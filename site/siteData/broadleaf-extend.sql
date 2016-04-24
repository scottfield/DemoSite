ALTER TABLE shop ADD shop_account_id BIGINT UNSIGNED;
DROP TABLE IF EXISTS shop_account;
--商店微信支付账号信息
CREATE TABLE shop_account(
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  appid VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  mchid VARCHAR(100) NOT NULL,
  `key` VARCHAR(100) NOT NULL,
  appsecret VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
);
INSERT INTO shop_account(appid,mchid,`key`,appsecret,`name`) VALUES('wx937fba8914a5d9a9','10010514','xVVm9pGXwwJpAQWkhJDszfi46wtBX1EQ','1974155fda854243a2a4b08c2928bf92','三元里');
INSERT INTO shop_account(appid,mchid,`key`,appsecret,`name`) VALUES('wx937fba8914a5d9a9','10010514','xVVm9pGXwwJpAQWkhJDszfi46wtBX1EQ','1974155fda854243a2a4b08c2928bf92','金沙');
SELECT * FROM shop_account;
SELECT * FROM shop;
DROP TABLE IF EXISTS fivecard;
CREATE TABLE fivecard(
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `no` CHAR(13) NOT NULL,
  `desc` VARCHAR(100),
  `type` TINYINT NOT NULL DEFAULT 0,
  `status` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY(id)
);
INSERT INTO fivecard(`name`,`desc`,`no`) VALUES('五折卡','自主领取五折卡','8938389898989');
INSERT INTO fivecard(`name`,`desc`,`no`) SELECT '五折卡','自主领取五折卡',member_no FROM sheet2$;
SELECT * FROM fivecard;
SELECT * FROM fivecard WHERE id>30000;
UPDATE fivecard SET `desc`='分享五张卡',`type`=1 WHERE id>30000; 
DROP TABLE IF EXISTS customer_fivecard_xref;
CREATE TABLE customer_fivecard_xref(
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  customer_id BIGINT NOT NULL,
  fivecard_id BIGINT,
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '五折卡领取状态，默认为未领取',
  `type` TINYINT NOT NULL COMMENT '五折卡类型',
  referer BIGINT COMMENT '推荐人id',
  PRIMARY KEY(id)
);
SELECT * FROM customer_fivecard_xref;
INSERT INTO qrcode(`code`) SELECT `条码` FROM sheet$;
SELECT * FROM qrcode;
CREATE TABLE customer_extend(
 customer_id BIGINT UNSIGNED NOT NULL,
 test VARCHAR(30)
);
INSERT INTO customer_extend VALUES(4009,'testtete');
SELECT * FROM customer_extend;
SELECT * FROM blc_customer WHERE customer_id=4009;