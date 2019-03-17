CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cms_nppes_provider_address`()
BEGIN
TRUNCATE cms_nppes_provider_address;

INSERT INTO cms_nppes_provider_address
SELECT
a.npi,
b.address_type_code,
CASE
	WHEN address_type_code = 'mailing' THEN prov_first_line_business_mailing_address
    WHEN address_type_code = 'practice' THEN prov_first_line_business_practice_location_address
    ELSE NULL
END AS first_line,

CASE
	WHEN address_type_code = 'mailing' THEN prov_second_line_business_mailing_address
    WHEN address_type_code = 'practice' THEN prov_second_line_business_practice_location_address
    ELSE NULL
END AS second_line,

CASE
	WHEN address_type_code = 'mailing' THEN prov_business_mailing_address_city_name
    WHEN address_type_code = 'practice' THEN prov_business_practice_location_address_city_name
    ELSE NULL
END AS city_name,

CASE
	WHEN address_type_code = 'mailing' THEN prov_business_mailing_address_state_name
    WHEN address_type_code = 'practice' THEN prov_business_practice_location_address_state_name
    ELSE NULL
END AS state_name,

CASE
	WHEN address_type_code = 'mailing' THEN prov_business_mailing_address_postal_cd
    WHEN address_type_code = 'practice' THEN prov_business_practice_location_address_postal_cd
    ELSE NULL
END AS postal_code,

CASE
	WHEN address_type_code = 'mailing' THEN prov_business_mailing_address_country_cd_if_outside_us
    WHEN address_type_code = 'practice' THEN prov_business_practice_location_address_country_cd_if_outside_u
    ELSE NULL
END AS country_code,

CASE
	WHEN address_type_code = 'mailing' THEN prov_business_mailing_address_phone_num
    WHEN address_type_code = 'practice' THEN prov_business_practice_location_address_phone_num
    ELSE NULL
END AS telephone_number,

CASE
	WHEN address_type_code = 'mailing' THEN prov_business_mailing_address_fax_num
    WHEN address_type_code = 'practice' THEN prov_business_practice_location_address_fax_num
    ELSE NULL
END AS fax_number

FROM extract_staging_dedup AS a
CROSS JOIN (SELECT 'mailing' AS address_type_code UNION SELECT 'practice') AS b;
END
