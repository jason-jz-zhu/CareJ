CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cms_nppes_provider_licenses`()
BEGIN
TRUNCATE cms_nppes_provider_licenses;

INSERT INTO cms_nppes_provider_licenses
SELECT
a.npi,
b.sequence_number,
CASE
	WHEN sequence_number = 1 THEN prov_license_num_1
	WHEN sequence_number = 2 THEN prov_license_num_2
	WHEN sequence_number = 3 THEN prov_license_num_3
	WHEN sequence_number = 4 THEN prov_license_num_4
	WHEN sequence_number = 5 THEN prov_license_num_5
	WHEN sequence_number = 6 THEN prov_license_num_6
	WHEN sequence_number = 7 THEN prov_license_num_7
	WHEN sequence_number = 8 THEN prov_license_num_8
	WHEN sequence_number = 9 THEN prov_license_num_9
	WHEN sequence_number = 10 THEN prov_license_num_10
	WHEN sequence_number = 11 THEN prov_license_num_11
	WHEN sequence_number = 12 THEN prov_license_num_12
	WHEN sequence_number = 13 THEN prov_license_num_13
	WHEN sequence_number = 14 THEN prov_license_num_14
	WHEN sequence_number = 15 THEN prov_license_num_15
    ELSE NULL
END AS provider_license_number,

CASE
	WHEN sequence_number = 1 THEN prov_license_num_state_cd_1
	WHEN sequence_number = 2 THEN prov_license_num_state_cd_2
	WHEN sequence_number = 3 THEN prov_license_num_state_cd_3
	WHEN sequence_number = 4 THEN prov_license_num_state_cd_4
	WHEN sequence_number = 5 THEN prov_license_num_state_cd_5
	WHEN sequence_number = 6 THEN prov_license_num_state_cd_6
	WHEN sequence_number = 7 THEN prov_license_num_state_cd_7
	WHEN sequence_number = 8 THEN prov_license_num_state_cd_8
	WHEN sequence_number = 9 THEN prov_license_num_state_cd_9
	WHEN sequence_number = 10 THEN prov_license_num_state_cd_10
	WHEN sequence_number = 11 THEN prov_license_num_state_cd_11
	WHEN sequence_number = 12 THEN prov_license_num_state_cd_12
	WHEN sequence_number = 13 THEN prov_license_num_state_cd_13
	WHEN sequence_number = 14 THEN prov_license_num_state_cd_14
	WHEN sequence_number = 15 THEN prov_license_num_state_cd_15
    ELSE NULL
END AS provider_license_number_state_code,

CASE
	WHEN sequence_number = 1 THEN hc_prov_taxon_cd_1
	WHEN sequence_number = 2 THEN hc_prov_taxon_cd_2
	WHEN sequence_number = 3 THEN hc_prov_taxon_cd_3
	WHEN sequence_number = 4 THEN hc_prov_taxon_cd_4
	WHEN sequence_number = 5 THEN hc_prov_taxon_cd_5
	WHEN sequence_number = 6 THEN hc_prov_taxon_cd_6
	WHEN sequence_number = 7 THEN hc_prov_taxon_cd_7
	WHEN sequence_number = 8 THEN hc_prov_taxon_cd_8
	WHEN sequence_number = 9 THEN hc_prov_taxon_cd_9
	WHEN sequence_number = 10 THEN hc_prov_taxon_cd_10
	WHEN sequence_number = 11 THEN hc_prov_taxon_cd_11
	WHEN sequence_number = 12 THEN hc_prov_taxon_cd_12
	WHEN sequence_number = 13 THEN hc_prov_taxon_cd_13
	WHEN sequence_number = 14 THEN hc_prov_taxon_cd_14
	WHEN sequence_number = 15 THEN hc_prov_taxon_cd_15
    ELSE NULL
END AS healthcare_provider_taxonomy_code,

CASE
	WHEN sequence_number = 1 THEN hc_prov_prim_taxon_switch_1
	WHEN sequence_number = 2 THEN hc_prov_prim_taxon_switch_2
	WHEN sequence_number = 3 THEN hc_prov_prim_taxon_switch_3
	WHEN sequence_number = 4 THEN hc_prov_prim_taxon_switch_4
	WHEN sequence_number = 5 THEN hc_prov_prim_taxon_switch_5
	WHEN sequence_number = 6 THEN hc_prov_prim_taxon_switch_6
	WHEN sequence_number = 7 THEN hc_prov_prim_taxon_switch_7
	WHEN sequence_number = 8 THEN hc_prov_prim_taxon_switch_8
	WHEN sequence_number = 9 THEN hc_prov_prim_taxon_switch_9
	WHEN sequence_number = 10 THEN hc_prov_prim_taxon_switch_10
	WHEN sequence_number = 11 THEN hc_prov_prim_taxon_switch_11
	WHEN sequence_number = 12 THEN hc_prov_prim_taxon_switch_12
	WHEN sequence_number = 13 THEN hc_prov_prim_taxon_switch_13
	WHEN sequence_number = 14 THEN hc_prov_prim_taxon_switch_14
	WHEN sequence_number = 15 THEN hc_prov_prim_taxon_switch_15
    ELSE NULL
END AS healthcare_provider_taxonomy_switch


FROM extract_staging_dedup AS a
CROSS JOIN (SELECT 1 AS sequence_number UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7
UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15) AS b;
END
