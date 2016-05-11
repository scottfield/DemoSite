#根据订单号查询订单信息
SELECT
  o.`ORDER_NUMBER` ordernumber,
  sa.`mchid`       mchid,
  sa.`appid`       appid,
  sa.`name`        shopname,
  sa.`key`         shopkey,
  o.`ORDER_TOTAL`  amount,
  o.`ORDER_STATUS` orderstatus,
  o.`SUBMIT_DATE`  submitdate,
  o.`DATE_UPDATED` udpatedate,
  bc.`CUSTOMER_ID` userid,
  bc.`USER_NAME`   openID,
  bc.`LAST_NAME`  nickname
FROM
  blc_order o
  LEFT JOIN order_extend oe
    ON o.`ORDER_ID` = oe.`ORDER_ID`
  LEFT JOIN blc_address ba
    ON oe.`ADDRESS_ID` = ba.`ADDRESS_ID`
  LEFT JOIN address_shop adds
    ON adds.`address_id` = ba.`ADDRESS_ID`
  LEFT JOIN shop s
    ON s.`id` = adds.`shop_id`
  LEFT JOIN shop_account sa
    ON sa.`id` = s.`shop_account_id`
  LEFT JOIN blc_customer bc
    ON bc.`CUSTOMER_ID` = o.`CUSTOMER_ID`
WHERE o.`ORDER_NUMBER` IN (
  '201605101037587687779'
);

#end
#根据用户openID查询订单信息
SELECT
  o.`ORDER_NUMBER` 订单号,
  o.`ORDER_TOTAL`  金额,
  o.`ORDER_STATUS` 状态,
  o.`SUBMIT_DATE`  下单时间,
  o.`DATE_UPDATED` 更新时间,
  sa.`mchid`       商户号,
  sa.`key`         商户密匙,
  sa.`appid`       appid,
  sa.`name`        商户名称,
  bc.`FIRST_NAME`  昵称,
  bc.`CUSTOMER_ID` 用户ID,
  bc.`USER_NAME`   openID
FROM
  blc_order o
  LEFT JOIN order_extend oe
    ON o.`ORDER_ID` = oe.`ORDER_ID`
  LEFT JOIN blc_address ba
    ON oe.`ADDRESS_ID` = ba.`ADDRESS_ID`
  LEFT JOIN address_shop adds
    ON adds.`address_id` = ba.`ADDRESS_ID`
  LEFT JOIN shop s
    ON s.`id` = adds.`shop_id`
  LEFT JOIN shop_account sa
    ON sa.`id` = s.`shop_account_id`
  LEFT JOIN blc_customer bc
    ON bc.`CUSTOMER_ID` = o.`CUSTOMER_ID`
WHERE bc.`USER_NAME` IN ('o1Py0tz-2sHNNvCCobGHpjDZMXXA');

#end
#根据ID查询用户五折卡信息
SELECT *
FROM
  customer_fivecard_xref
WHERE CUSTOMER_ID IN (16285);

#end
#查询A卡用户下面的被分享者
SELECT *
FROM
  customer_fivecard_xref
WHERE referer IN (11975);
#查询五折卡信息
SELECT *
FROM fivecard WHERE card_id=2764;
#end
#根据昵称查询用户
SELECT *
FROM
  blc_customer
WHERE FIRST_NAME LIKE '%无所%';

#end 
#根据id查询用户
SELECT *
FROM
  blc_customer
WHERE USER_NAME LIKE '%khp0%';

SELECT *
FROM
  customer_fivecard_xref
WHERE id = 2387;

SELECT COUNT(*)
FROM
  blc_order
WHERE ORDER_NUMBER IN (
  '201605100838012944321',
  '201605101101406447835',
  '201605101103311297838',
  '201605100910429467605',
  '201605101037587687779',
  '201605101142458927941',
  '201605100134355687241',
  '201605101303166837576',
  '201605100634371257360',
  '20160510113240917916',
  '201605101612393398334',
  '201605100126413147229',
  '201605091951245374897',
  '201605092127593145161',
  '201605092146136265818',
  '201605091635025394858',
  '201605101144032857923'
);
SELECT *
FROM blc_order
WHERE ORDER_STATUS = 'CANCELLED';

#查询用户发放优惠券
SELECT * from customer_coupon_xref ccx WHERE ccx.customer_id=43491;
SELECT * FROM customer_coupon_xref ccx LEFT JOIN coupon c on c.coupon_id=ccx.coupon_id WHERE ccx.createdOn  BETWEEN '2016-05-11 00:00:00' AND '2016-05-11 23:59:59' AND c.coupon_type<4;
SELECT * FROM blc_order bo WHERE bo.ORDER_STATUS='PAID'AND bo.DATE_UPDATED BETWEEN '2016-05-11 00:00:00' AND '2016-05-11 23:59:59';
SELECT * FROM blc_order bo LEFT JOIN blc_order_attribute boa on bo.ORDER_ID=boa.ORDER_ID WHERE boa.NAME='result_code' AND boa.VALUE='SUCCESS'and bo.ORDER_STATUS<>'PAID' ORDER BY bo.DATE_UPDATED DESC ;
SELECT * FROM blc_order WHERE ORDER_NUMBER='201605100623026225204';
SELECT fivecard_id from customer_fivecard_xref cfx GROUP BY fivecard_id HAVING count(fivecard_id)>1;
SELECT * FROM customer_fivecard_xref WHERE fivecard_id IN (SELECT fivecard_id from customer_fivecard_xref cfx GROUP BY fivecard_id HAVING count(fivecard_id)>1) ORDER BY fivecard_id ASC ;