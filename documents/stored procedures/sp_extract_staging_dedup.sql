CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_extract_staging_dedup`()
BEGIN
ALTER TABLE extract_staging ADD uid INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
TRUNCATE extract_staging_dedup;
INSERT INTO extract_staging_dedup
SELECT *
FROM carej.extract_staging
GROUP BY npi;
END
