ALTER TABLE shop ADD shop_account_id BIGINT UNSIGNED;
DROP TABLE IF EXISTS shop_account;
/*商店微信支付账号信息*/
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
CREATE TABLE `customer_fivecard_xref` (
  `active_date` datetime DEFAULT NULL COMMENT '激活时间',
  `create_date` datetime DEFAULT NULL COMMENT '发卡时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `fivecard_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '五折卡领取状态，默认为未领取',
  `type` tinyint(4) NOT NULL COMMENT '五折卡类型',
  `referer` bigint(20) DEFAULT NULL COMMENT '推荐人id',
  is_show_dialog TINYINT DEFAULT 0 COMMENT '是否已经提示过用户获取卡券成功',
  PRIMARY KEY (`id`)
);
COMMIT ;
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
SELECT * FROM customer_fivecard_xref;
SELECT * FROM fivecard;


/*删除所有会员相关信息*/
DELETE FROM blc_order_attribute;
DELETE FROM blc_fulfillment_group_item;
DELETE FROM blc_fulfillment_group;
DELETE FROM blc_order_item_price_dtl;
DELETE FROM blc_discrete_order_item;
DELETE FROM blc_order_item;
DELETE FROM blc_order;
DELETE FROM blc_customer_attribute;
DELETE FROM blc_customer_role;
DELETE FROM blc_customer_address;
DELETE FROM customaddressimpl;
DELETE FROM blc_address;
DELETE FROM blc_customer_phone;
DELETE FROM blc_phone;
DELETE FROM customer_fivecard_xref;
DELETE FROM customer_coupon_xref;
DELETE FROM blc_customer;
/**/

UPDATE shop SET shop_account_id = NULL;
SELECT * FROM shop_account;
/*优惠券*/
DROP TABLE IF EXISTS coupon;
CREATE TABLE coupon(
  coupon_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  coupon_type TINYINT NOT NULL COMMENT '优惠券类型',
  coupon_value INT NOT NULL COMMENT '优惠券金额',
  coupon_amount INT NOT NULL DEFAULT 0 COMMENT '优惠券数量',
  coupon_desc VARCHAR(100) COMMENT '使用规则描述',
  updatedOn DATETIME NOT NULL ,
  createdOn  DATETIME NOT NULL,
  PRIMARY KEY (coupon_id)
);
INSERT INTO coupon(coupon_type, coupon_value, coupon_amount, coupon_desc, updatedOn, createdOn) VALUES(0,5,8000,'购买满50元可用',now(),now());
INSERT INTO coupon(coupon_type, coupon_value, coupon_amount, coupon_desc, updatedOn, createdOn) VALUES(1,10,100,'购买满88元可用',now(),now());
INSERT INTO coupon(coupon_type, coupon_value, coupon_amount, coupon_desc, updatedOn, createdOn) VALUES(2,50,20,'购买满150元可用',now(),now());
INSERT INTO coupon(coupon_type, coupon_value, coupon_amount, coupon_desc, updatedOn, createdOn) VALUES(3,88,5,'购买满200元可用',now(),now());
INSERT INTO coupon(coupon_type, coupon_value, coupon_amount, coupon_desc, updatedOn, createdOn) VALUES(4,10,10,'购买满50元可用',now(),now());
INSERT INTO coupon(coupon_type, coupon_value, coupon_amount, coupon_desc, updatedOn, createdOn) VALUES(5,10,10,'购买满50元可用',now(),now());
DROP TABLE IF EXISTS customer_coupon_xref;
CREATE TABLE customer_coupon_xref(
  customer_coupon_xref_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  coupon_id BIGINT,
  customer_id BIGINT,
  coupon_status TINYINT DEFAULT 0 COMMENT '优惠券使用状态,默认未使用',
  updatedOn  DATETIME NOT NULL,
  createdOn  DATETIME NOT NULL,
  shop_id BIGINT COMMENT '优惠券兑换门店',
  PRIMARY KEY (customer_coupon_xref_id)
);
/**/