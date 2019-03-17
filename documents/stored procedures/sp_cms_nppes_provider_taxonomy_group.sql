CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cms_nppes_provider_taxonomy_group`()
BEGIN
TRUNCATE cms_nppes_provider_taxonomy_group;

INSERT INTO cms_nppes_provider_taxonomy_group
SELECT
a.npi,
b.sequence_number,
CASE
	WHEN sequence_number = 1 THEN hc_prov_taxon_group_1
    WHEN sequence_number = 2 THEN hc_prov_taxon_group_2
    WHEN sequence_number = 3 THEN hc_prov_taxon_group_3
    WHEN sequence_number = 4 THEN hc_prov_taxon_group_4
    WHEN sequence_number = 5 THEN hc_prov_taxon_group_5
    WHEN sequence_number = 6 THEN hc_prov_taxon_group_6
    WHEN sequence_number = 7 THEN hc_prov_taxon_group_7
    WHEN sequence_number = 8 THEN hc_prov_taxon_group_8
    WHEN sequence_number = 9 THEN hc_prov_taxon_group_9
    WHEN sequence_number = 10 THEN hc_prov_taxon_group_10
    WHEN sequence_number = 11 THEN hc_prov_taxon_group_11
    WHEN sequence_number = 12 THEN hc_prov_taxon_group_12
    WHEN sequence_number = 13 THEN hc_prov_taxon_group_13
    WHEN sequence_number = 14 THEN hc_prov_taxon_group_14
    WHEN sequence_number = 15 THEN hc_prov_taxon_group_15
    ELSE NULL
END AS healthcare_provider_taxonomy_group
FROM (select * from extract_staging_dedup) AS a
CROSS JOIN (SELECT 1 AS sequence_number UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7
UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15) AS b;
END
