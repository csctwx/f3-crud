UPDATE `items` SET `code`=CONCAT(`brand_prefix`,`code`) WHERE `code` RLIKE '^[^A-Z]';
UPDATE `items` SET `brand_code`=CONCAT(`brand_code`,"A") WHERE `brand_code`="BDDIORAM";
UPDATE `items` SET `brand_prefix`=CONCAT(`brand_prefix`,"P") WHERE `brand_code`="BDDIORAMA";
UPDATE `items` INNER JOIN `brands` ON items.brand_code = brands.code SET `brand_prefix`=brands.prefix;

UPDATE `items` SET `ncode`=LEFT(code,length(code)-1), `language`='Z'  WHERE `code` LIKE '%Z';
UPDATE `items` SET `ncode`=LEFT(code,length(code)-2), `language`='CC'  WHERE `code` LIKE '%CC';
UPDATE `items` SET `ncode`=LEFT(code,length(code)-1), `language`='Q'  WHERE `code` LIKE '%Q';
UPDATE `items` SET `ncode`=LEFT(code,length(code)-1), `language`='X'  WHERE `code` LIKE '%X';
UPDATE `items` SET `ncode`=LEFT(code,length(code)-1), `language`='S'  WHERE `code` LIKE '%S' AND `code` NOT LIKE '%DIS';

UPDATE `items` SET `ncode`=code WHERE `ncode` IS NULL OR `ncode` = '';

UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-2), `extension`='C1'  WHERE `ncode` LIKE '%C1';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-3), `extension`='C12'  WHERE `ncode` LIKE '%C12';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-2), `extension`='C2'  WHERE `ncode` LIKE '%C2';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-2), `extension`='C3'  WHERE `ncode` LIKE '%C3';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-2), `extension`='C4'  WHERE `ncode` LIKE '%C4';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-2), `extension`='C6'  WHERE `ncode` LIKE '%C6';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-2), `extension`='C8'  WHERE `ncode` LIKE '%C8';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-2), `extension`='CP'  WHERE `ncode` LIKE '%CP';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-3), `extension`='DIS'  WHERE `ncode` LIKE '%DIS';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-1), `extension`='F'  WHERE `ncode` LIKE '%F';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-1), `extension`='G'  WHERE `ncode` LIKE '%G';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-2), `extension`='IM'  WHERE `ncode` LIKE '%IM';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-2), `extension`='IT'  WHERE `ncode` LIKE '%IT';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-1), `extension`='K'  WHERE `ncode` LIKE '%K';
UPDATE `items` SET `ncode`=LEFT(ncode,length(ncode)-1), `extension`='T'  WHERE `ncode` LIKE '%T';

SELECT * FROM `items` WHERE `code` LIKE "BDDISP%";
SELECT * FROM `items` LEFT JOIN `brands` ON items.brand_code = brands.code WHERE brands.code IS NULL OR brands.code = '';