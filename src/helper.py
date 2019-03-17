# -*- coding: utf-8 -*-
import pandas as pd
import json

with open('../config/columns_type.json') as json_file:
    data = json.load(json_file)

new_columns_name = [item['new_name'] for item in data]

def extract_element(line):
    res = pd.DataFrame([line], columns = new_columns_name)
    return res
