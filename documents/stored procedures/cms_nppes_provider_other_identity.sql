CREATE DEFINER=`root`@`localhost` PROCEDURE `cms_nppes_provider_other_identity`()
BEGIN
TRUNCATE cms_nppes_provider_other_identity;

INSERT INTO cms_nppes_provider_other_identity
SELECT
a.npi,
b.sequence_number,
CASE
	WHEN sequence_number = 1 THEN other_prov_id_1
	WHEN sequence_number = 2 THEN other_prov_id_2
	WHEN sequence_number = 3 THEN other_prov_id_3
	WHEN sequence_number = 4 THEN other_prov_id_4
	WHEN sequence_number = 5 THEN other_prov_id_5
	WHEN sequence_number = 6 THEN other_prov_id_6
	WHEN sequence_number = 7 THEN other_prov_id_7
	WHEN sequence_number = 8 THEN other_prov_id_8
	WHEN sequence_number = 9 THEN other_prov_id_9
	WHEN sequence_number = 10 THEN other_prov_id_10
	WHEN sequence_number = 11 THEN other_prov_id_11
	WHEN sequence_number = 12 THEN other_prov_id_12
	WHEN sequence_number = 13 THEN other_prov_id_13
	WHEN sequence_number = 14 THEN other_prov_id_14
	WHEN sequence_number = 15 THEN other_prov_id_15
	WHEN sequence_number = 16 THEN other_prov_id_16
	WHEN sequence_number = 17 THEN other_prov_id_17
	WHEN sequence_number = 18 THEN other_prov_id_18
	WHEN sequence_number = 19 THEN other_prov_id_19
	WHEN sequence_number = 20 THEN other_prov_id_20
	WHEN sequence_number = 21 THEN other_prov_id_21
	WHEN sequence_number = 22 THEN other_prov_id_22
	WHEN sequence_number = 23 THEN other_prov_id_23
	WHEN sequence_number = 24 THEN other_prov_id_24
	WHEN sequence_number = 25 THEN other_prov_id_25
	WHEN sequence_number = 26 THEN other_prov_id_26
	WHEN sequence_number = 27 THEN other_prov_id_27
	WHEN sequence_number = 28 THEN other_prov_id_28
	WHEN sequence_number = 29 THEN other_prov_id_29
	WHEN sequence_number = 30 THEN other_prov_id_30
	WHEN sequence_number = 31 THEN other_prov_id_31
	WHEN sequence_number = 32 THEN other_prov_id_32
	WHEN sequence_number = 33 THEN other_prov_id_33
	WHEN sequence_number = 34 THEN other_prov_id_34
	WHEN sequence_number = 35 THEN other_prov_id_35
	WHEN sequence_number = 36 THEN other_prov_id_36
	WHEN sequence_number = 37 THEN other_prov_id_37
	WHEN sequence_number = 38 THEN other_prov_id_38
	WHEN sequence_number = 39 THEN other_prov_id_39
	WHEN sequence_number = 40 THEN other_prov_id_40
	WHEN sequence_number = 41 THEN other_prov_id_41
	WHEN sequence_number = 42 THEN other_prov_id_42
	WHEN sequence_number = 43 THEN other_prov_id_43
	WHEN sequence_number = 44 THEN other_prov_id_44
	WHEN sequence_number = 45 THEN other_prov_id_45
	WHEN sequence_number = 46 THEN other_prov_id_46
	WHEN sequence_number = 47 THEN other_prov_id_47
	WHEN sequence_number = 48 THEN other_prov_id_48
	WHEN sequence_number = 49 THEN other_prov_id_49
	WHEN sequence_number = 50 THEN other_prov_id_50
    ELSE NULL
END AS provider_other_identification,


CASE
	WHEN sequence_number = 1 THEN other_prov_id_type_cd_1
	WHEN sequence_number = 2 THEN other_prov_id_type_cd_2
	WHEN sequence_number = 3 THEN other_prov_id_type_cd_3
	WHEN sequence_number = 4 THEN other_prov_id_type_cd_4
	WHEN sequence_number = 5 THEN other_prov_id_type_cd_5
	WHEN sequence_number = 6 THEN other_prov_id_type_cd_6
	WHEN sequence_number = 7 THEN other_prov_id_type_cd_7
	WHEN sequence_number = 8 THEN other_prov_id_type_cd_8
	WHEN sequence_number = 9 THEN other_prov_id_type_cd_9
	WHEN sequence_number = 10 THEN other_prov_id_type_cd_10
	WHEN sequence_number = 11 THEN other_prov_id_type_cd_11
	WHEN sequence_number = 12 THEN other_prov_id_type_cd_12
	WHEN sequence_number = 13 THEN other_prov_id_type_cd_13
	WHEN sequence_number = 14 THEN other_prov_id_type_cd_14
	WHEN sequence_number = 15 THEN other_prov_id_type_cd_15
	WHEN sequence_number = 16 THEN other_prov_id_type_cd_16
	WHEN sequence_number = 17 THEN other_prov_id_type_cd_17
	WHEN sequence_number = 18 THEN other_prov_id_type_cd_18
	WHEN sequence_number = 19 THEN other_prov_id_type_cd_19
	WHEN sequence_number = 20 THEN other_prov_id_type_cd_20
	WHEN sequence_number = 21 THEN other_prov_id_type_cd_21
	WHEN sequence_number = 22 THEN other_prov_id_type_cd_22
	WHEN sequence_number = 23 THEN other_prov_id_type_cd_23
	WHEN sequence_number = 24 THEN other_prov_id_type_cd_24
	WHEN sequence_number = 25 THEN other_prov_id_type_cd_25
	WHEN sequence_number = 26 THEN other_prov_id_type_cd_26
	WHEN sequence_number = 27 THEN other_prov_id_type_cd_27
	WHEN sequence_number = 28 THEN other_prov_id_type_cd_28
	WHEN sequence_number = 29 THEN other_prov_id_type_cd_29
	WHEN sequence_number = 30 THEN other_prov_id_type_cd_30
	WHEN sequence_number = 31 THEN other_prov_id_type_cd_31
	WHEN sequence_number = 32 THEN other_prov_id_type_cd_32
	WHEN sequence_number = 33 THEN other_prov_id_type_cd_33
	WHEN sequence_number = 34 THEN other_prov_id_type_cd_34
	WHEN sequence_number = 35 THEN other_prov_id_type_cd_35
	WHEN sequence_number = 36 THEN other_prov_id_type_cd_36
	WHEN sequence_number = 37 THEN other_prov_id_type_cd_37
	WHEN sequence_number = 38 THEN other_prov_id_type_cd_38
	WHEN sequence_number = 39 THEN other_prov_id_type_cd_39
	WHEN sequence_number = 40 THEN other_prov_id_type_cd_40
	WHEN sequence_number = 41 THEN other_prov_id_type_cd_41
	WHEN sequence_number = 42 THEN other_prov_id_type_cd_42
	WHEN sequence_number = 43 THEN other_prov_id_type_cd_43
	WHEN sequence_number = 44 THEN other_prov_id_type_cd_44
	WHEN sequence_number = 45 THEN other_prov_id_type_cd_45
	WHEN sequence_number = 46 THEN other_prov_id_type_cd_46
	WHEN sequence_number = 47 THEN other_prov_id_type_cd_47
	WHEN sequence_number = 48 THEN other_prov_id_type_cd_48
	WHEN sequence_number = 49 THEN other_prov_id_type_cd_49
	WHEN sequence_number = 50 THEN other_prov_id_type_cd_50
    ELSE NULL
END AS provider_other_identification_type_code,


CASE
	WHEN sequence_number = 1 THEN other_prov_id_state_1
	WHEN sequence_number = 2 THEN other_prov_id_state_2
	WHEN sequence_number = 3 THEN other_prov_id_state_3
	WHEN sequence_number = 4 THEN other_prov_id_state_4
	WHEN sequence_number = 5 THEN other_prov_id_state_5
	WHEN sequence_number = 6 THEN other_prov_id_state_6
	WHEN sequence_number = 7 THEN other_prov_id_state_7
	WHEN sequence_number = 8 THEN other_prov_id_state_8
	WHEN sequence_number = 9 THEN other_prov_id_state_9
	WHEN sequence_number = 10 THEN other_prov_id_state_10
	WHEN sequence_number = 11 THEN other_prov_id_state_11
	WHEN sequence_number = 12 THEN other_prov_id_state_12
	WHEN sequence_number = 13 THEN other_prov_id_state_13
	WHEN sequence_number = 14 THEN other_prov_id_state_14
	WHEN sequence_number = 15 THEN other_prov_id_state_15
	WHEN sequence_number = 16 THEN other_prov_id_state_16
	WHEN sequence_number = 17 THEN other_prov_id_state_17
	WHEN sequence_number = 18 THEN other_prov_id_state_18
	WHEN sequence_number = 19 THEN other_prov_id_state_19
	WHEN sequence_number = 20 THEN other_prov_id_state_20
	WHEN sequence_number = 21 THEN other_prov_id_state_21
	WHEN sequence_number = 22 THEN other_prov_id_state_22
	WHEN sequence_number = 23 THEN other_prov_id_state_23
	WHEN sequence_number = 24 THEN other_prov_id_state_24
	WHEN sequence_number = 25 THEN other_prov_id_state_25
	WHEN sequence_number = 26 THEN other_prov_id_state_26
	WHEN sequence_number = 27 THEN other_prov_id_state_27
	WHEN sequence_number = 28 THEN other_prov_id_state_28
	WHEN sequence_number = 29 THEN other_prov_id_state_29
	WHEN sequence_number = 30 THEN other_prov_id_state_30
	WHEN sequence_number = 31 THEN other_prov_id_state_31
	WHEN sequence_number = 32 THEN other_prov_id_state_32
	WHEN sequence_number = 33 THEN other_prov_id_state_33
	WHEN sequence_number = 34 THEN other_prov_id_state_34
	WHEN sequence_number = 35 THEN other_prov_id_state_35
	WHEN sequence_number = 36 THEN other_prov_id_state_36
	WHEN sequence_number = 37 THEN other_prov_id_state_37
	WHEN sequence_number = 38 THEN other_prov_id_state_38
	WHEN sequence_number = 39 THEN other_prov_id_state_39
	WHEN sequence_number = 40 THEN other_prov_id_state_40
	WHEN sequence_number = 41 THEN other_prov_id_state_41
	WHEN sequence_number = 42 THEN other_prov_id_state_42
	WHEN sequence_number = 43 THEN other_prov_id_state_43
	WHEN sequence_number = 44 THEN other_prov_id_state_44
	WHEN sequence_number = 45 THEN other_prov_id_state_45
	WHEN sequence_number = 46 THEN other_prov_id_state_46
	WHEN sequence_number = 47 THEN other_prov_id_state_47
	WHEN sequence_number = 48 THEN other_prov_id_state_48
	WHEN sequence_number = 49 THEN other_prov_id_state_49
	WHEN sequence_number = 50 THEN other_prov_id_state_50
    ELSE NULL
END AS provider_other_identification_state_code,

CASE
	WHEN sequence_number = 1 THEN other_prov_id_issuer_1
	WHEN sequence_number = 2 THEN other_prov_id_issuer_2
	WHEN sequence_number = 3 THEN other_prov_id_issuer_3
	WHEN sequence_number = 4 THEN other_prov_id_issuer_4
	WHEN sequence_number = 5 THEN other_prov_id_issuer_5
	WHEN sequence_number = 6 THEN other_prov_id_issuer_6
	WHEN sequence_number = 7 THEN other_prov_id_issuer_7
	WHEN sequence_number = 8 THEN other_prov_id_issuer_8
	WHEN sequence_number = 9 THEN other_prov_id_issuer_9
	WHEN sequence_number = 10 THEN other_prov_id_issuer_10
	WHEN sequence_number = 11 THEN other_prov_id_issuer_11
	WHEN sequence_number = 12 THEN other_prov_id_issuer_12
	WHEN sequence_number = 13 THEN other_prov_id_issuer_13
	WHEN sequence_number = 14 THEN other_prov_id_issuer_14
	WHEN sequence_number = 15 THEN other_prov_id_issuer_15
	WHEN sequence_number = 16 THEN other_prov_id_issuer_16
	WHEN sequence_number = 17 THEN other_prov_id_issuer_17
	WHEN sequence_number = 18 THEN other_prov_id_issuer_18
	WHEN sequence_number = 19 THEN other_prov_id_issuer_19
	WHEN sequence_number = 20 THEN other_prov_id_issuer_20
	WHEN sequence_number = 21 THEN other_prov_id_issuer_21
	WHEN sequence_number = 22 THEN other_prov_id_issuer_22
	WHEN sequence_number = 23 THEN other_prov_id_issuer_23
	WHEN sequence_number = 24 THEN other_prov_id_issuer_24
	WHEN sequence_number = 25 THEN other_prov_id_issuer_25
	WHEN sequence_number = 26 THEN other_prov_id_issuer_26
	WHEN sequence_number = 27 THEN other_prov_id_issuer_27
	WHEN sequence_number = 28 THEN other_prov_id_issuer_28
	WHEN sequence_number = 29 THEN other_prov_id_issuer_29
	WHEN sequence_number = 30 THEN other_prov_id_issuer_30
	WHEN sequence_number = 31 THEN other_prov_id_issuer_31
	WHEN sequence_number = 32 THEN other_prov_id_issuer_32
	WHEN sequence_number = 33 THEN other_prov_id_issuer_33
	WHEN sequence_number = 34 THEN other_prov_id_issuer_34
	WHEN sequence_number = 35 THEN other_prov_id_issuer_35
	WHEN sequence_number = 36 THEN other_prov_id_issuer_36
	WHEN sequence_number = 37 THEN other_prov_id_issuer_37
	WHEN sequence_number = 38 THEN other_prov_id_issuer_38
	WHEN sequence_number = 39 THEN other_prov_id_issuer_39
	WHEN sequence_number = 40 THEN other_prov_id_issuer_40
	WHEN sequence_number = 41 THEN other_prov_id_issuer_41
	WHEN sequence_number = 42 THEN other_prov_id_issuer_42
	WHEN sequence_number = 43 THEN other_prov_id_issuer_43
	WHEN sequence_number = 44 THEN other_prov_id_issuer_44
	WHEN sequence_number = 45 THEN other_prov_id_issuer_45
	WHEN sequence_number = 46 THEN other_prov_id_issuer_46
	WHEN sequence_number = 47 THEN other_prov_id_issuer_47
	WHEN sequence_number = 48 THEN other_prov_id_issuer_48
	WHEN sequence_number = 49 THEN other_prov_id_issuer_49
	WHEN sequence_number = 50 THEN other_prov_id_issuer_50
    ELSE NULL
END AS provider_other_identification_issuer
FROM extract_staging_dedup AS a
CROSS JOIN (SELECT 1 AS sequence_number UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20
UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 UNION SELECT 25 UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29 UNION SELECT 30
UNION SELECT 31 UNION SELECT 32 UNION SELECT 33 UNION SELECT 34 UNION SELECT 35 UNION SELECT 36 UNION SELECT 37 UNION SELECT 38 UNION SELECT 39 UNION SELECT 40
UNION SELECT 41 UNION SELECT 42 UNION SELECT 43 UNION SELECT 44 UNION SELECT 45 UNION SELECT 46 UNION SELECT 47 UNION SELECT 48 UNION SELECT 49 UNION SELECT 50) AS b;
END
