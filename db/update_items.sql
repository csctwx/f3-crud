UPDATE `items` SET `code`=CONCAT(`brand_prefix`,`code`) WHERE `code` RLIKE '^[^A-Z]';
UPDATE `items` SET `brand_code`=CONCAT(`brand_code`,"A") WHERE `brand_code`="BDDIORAM";
UPDATE `items` SET `brand_prefix`=CONCAT(`brand_prefix`,"P") WHERE `brand_code`="BDDIORAMA";
UPDATE `items` INNER JOIN `brands` ON items.brand_code = brands.code SET `brand_prefix`=brands.prefix;

SELECT * FROM `items` WHERE `code` LIKE "BDDISP%";
SELECT * FROM `items` LEFT JOIN `brands` ON items.brand_code = brands.code WHERE brands.code IS NULL OR brands.code = '';