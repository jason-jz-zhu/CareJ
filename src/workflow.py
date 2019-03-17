# -*- coding: utf-8 -*-
"""
Created on Fri Feb 23 16:18:11 2019

@author: Jiazhen
"""
import googlemaps
import csv
from pipeline import Pipeline
import sys
import json
from sqlalchemy import create_engine
import pandas as pd
from helper import extract_element
#import sqlalchemy
import pandas.io.sql as sql
import time
# init the pipeline class
pipeline = Pipeline()
# global value to store path
path = {}
chunk = {}
engine = {}
gmaps = []

@pipeline.task()
def set_path(paths):
    """
    :type paths: List[str]
    :rtype: Boolean
    :goal: Get the input and output path, then set them for global value
    """
    try:
        path['input'] = paths[0]
        chunk['size'] = paths[1]
        return True
    except:
        print('fail')
        return False

@pipeline.task(depends_on=set_path)
def read_db_config(status):
    """
    :type status: Boolean
    :rtype: Boolean
    :goal: Get the db config, then set them for global value
    """
    # with open('../config/db_config.json') as json_file:
    with open('{}/db_config.json'.format(paths[0])) as json_file:
        data = json.load(json_file)
    return (data['username'], data['password'], data['host'], data['db_name'])

@pipeline.task(depends_on=read_db_config)
def create_db_engine(db_config):
    """
    :type db_config: List[str]
    :rtype: Boolean
    :goal: Create engine, then set them for global value
    """
    try:
        engine['engine'] = create_engine('mysql://'+db_config[0]+':'+db_config[1]+'@'+db_config[2]+'/'+db_config[3]+'?charset=utf8',encoding='utf-8',echo=False)
        return True
    except:
        return False


@pipeline.task(depends_on=create_db_engine)
def extract_nppes_data(status):
    """
    :type good: Boolean
    :rtype: Boolean
    :goal: input the raw data
    """
    if not status:
        print('set_path error.')
        return False
    res = pd.DataFrame()
    try:
        with open(path['input'], 'r') as lines:
            csvreader = csv.reader(lines)
            next(csvreader)
            cnt = 0
            for line in csvreader:
                try:

                    cnt += 1
                    df = extract_element(line)
                    res = res.append(df)

                    if len(res) == chunk['size']:
                        print(cnt)
                        res.to_sql(name='extract_staging', con=engine['engine'], if_exists='append', index=False)
                        res = pd.DataFrame()
                except:
                    continue
            res.to_sql(name='extract_staging', con=engine['engine'], if_exists='append', index=False)
        return True
    except:
        return False


@pipeline.task(depends_on=extract_nppes_data)
def dedup_nppes_data(status):
    """
    :type status: Boolean
    :rtype: Boolean
    :goal: dedup
    """
    if not status:
        print('extract_nppes_data error.')
        return False
    try:
        conn = engine['engine'].raw_connection()
        cursor = conn.cursor()
        cursor.callproc('sp_extract_staging_dedup')
    except:
        print('error')
    finally:
        cursor.close()
        conn.close()


@pipeline.task(depends_on=dedup_nppes_data)
def transform_four_sub_data(status):
    """
    :type status: Boolean
    :rtype: Boolean
    :goal: run four store procedures
    """
    if not status:
        print('dedup_nppes_data error.')
        return False
    try:
        conn = engine['engine'].raw_connection()
        cursor = conn.cursor()
        cursor.callproc('cms_nppes_provider_other_identity')
        cursor.callproc('sp_cms_nppes_provider_address')
        cursor.callproc('sp_cms_nppes_provider_licenses')
        cursor.callproc('sp_cms_nppes_provider_taxonomy_group')
    except:
        print('error')
    finally:
        cursor.close()
        conn.close()

@pipeline.task(depends_on=transform_four_sub_data)
def set_google_api(status):
    """
    :type db_config: List[str]
    :rtype: Boolean
    :goal: get Google API, then set them for global value
    """
    try:
        with open('{}/google_api.json'.format(path['input'])) as json_file:
            data = json.load(json_file)
        gmaps = googlemaps.Client(key=data['api'])
        return True
    except:
        return False



@pipeline.task(depends_on=set_google_api)
def add_address(status):
    """
    :type status: Boolean
    :rtype: Boolean
    :goal: call google geocode api to fill the lat and lng
    """
    if not status:
        print('transform_four_sub_data error.')
        return False
    lat = []
    lng = []
    address_df = sql.read_sql_query('SELECT * FROM cms_nppes_provider_address LIMIT 100;', engine['engine'])
    for i, row in address_df.iterrows():
        if not row['first_line'].strip() and not row['state_name'].strip():
            continue
        address = '{} {}, {}, {}'.format(row['first_line'].strip(), row['second_line'].strip(), row ['city_name'].strip(), row['state_name'].strip())
        geocode_result = gmaps.geocode(address)
        lat.append(geocode_result[0]['geometry']['location']['lat'])
        lng.append(geocode_result[0]['geometry']['location']['lng'])

    address_df['lat'] = lat
    address_df['lng'] = lng

    address_df.to_sql(name='cms_nppes_provider_address_with_geo', con=engine['engine'], if_exists='replace', index=False)



# main function to call pipeline
def main():
    # pipeline.run(sys.argv[1: 3])
    start = time.time()
    pipeline.run(sys.argv[1: 3])
    #pipeline.run(['../input/npi_nppes_data_r201610.csv', 500])
    end = time.time()
    print "Took %f ms" % ((end - start) * 1000.0)

if __name__ == "__main__":
    main()
