DROP TABLE IF EXISTS PRODUCT_EXTEND;
CREATE TABLE PRODUCT_EXTEND(
 PRODUCT_EXTEND_ID BIGINT(20) UNSIGNED AUTO_INCREMENT NOT NULL, 
 PRODUCT_ID BIGINT(20) NOT NULL,
 PROMOTION_MESSAGE VARCHAR(200),
 SALES BIGINT(20) DEFAULT '0' COMMENT '销售量',
 PRIMARY KEY(PRODUCT_EXTEND_ID),
 FOREIGN KEY  (PRODUCT_ID) REFERENCES blc_product(PRODUCT_ID)
);
INSERT INTO PRODUCT_EXTEND(PRODUCT_ID,PROMOTION_MESSAGE) VALUES(10000,'promotion message for meiji');
SELECT * FROM PRODUCT_EXTEND a,blc_product b WHERE a.`PRODUCT_ID`=b.`PRODUCT_ID` ;
SELECT * FROM blc_order_item;

DROP TABLE IF EXISTS shop;
CREATE TABLE shop(
  id INT(20) UNSIGNED AUTO_INCREMENT,
  `area` CHAR(3) NOT NULL,
  `code` VARCHAR(20) NOT NULL,
  `province` VARCHAR(20) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  PRIMARY KEY(id)
);

INSERT INTO shop(`code`,`area`,province,city,`name`,address) VALUES('097','南区','广东','佛山','乐从店','佛山市顺德区乐从镇乐从大道南星光广场');
INSERT INTO shop(`code`,`area`,province,city,`name`,address) VALUES('103','南区','广东','佛山','怡丰城店','佛山南海区平洲佛平四路与石龙路交界');
INSERT INTO shop(`code`,`area`,province,city,`name`,address) VALUES('084','南区','广东','汕头','金平店','汕头市汕樟路41号');
INSERT INTO shop(`code`,`area`,province,city,`name`,address) VALUES('015','南区','广东','汕头','汕头店','汕头市长平东路丰泽庄卜蜂莲花商城');
SELECT * FROM shop;

CREATE TABLE address_shop(
 address_shop_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
 shop_id BIGINT NOT NULL,
 address_id BIGINT NOT NULL,
 PRIMARY KEY(address_shop_id)
);
SELECT * FROM address_shop;
SELECT * FROM blc_address;
SELECT * FROM blc_customer_address;
SELECT * FROM blc_order WHERE ORDER_NUMBER ='2016041111030277252';
SELECT * FROM blc_order;
--创建二维码表
CREATE TABLE qrcode(
 id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
 `code` CHAR(13) NOT NULL COMMENT '13位条码',
 usedate DATETIME COMMENT '条码使用时间',
 `status` TINYINT DEFAULT 0 COMMENT '使用状态 0未使用，1已使用',
 usedby BIGINT COMMENT '使用者ID',
 PRIMARY KEY(id)
);
INSERT INTO qrcode(`code`) VALUES('7400045945206');
SELECT * FROM qrcode;
SELECT * FROM blc_customer;
SELECT * FROM `blc_customer_attribute`;
SELECT * FROM customer_fivecard_xref;
DELETE FROM shop_account WHERE id>2;
SELECT FROM shop s LEFT JOIN shop_account a ON s.`city`;
DELETE FROM shop_account;
UPDATE shop SET shop_account_id=(SELECT id FROM shop_account WHERE shop.`code`=shop_account.`shop_code`);