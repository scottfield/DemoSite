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
  bc.`LAST_NAME`   nickname
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
  '201605111532208349900'
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
FROM fivecard
WHERE card_id = 2764;
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
SELECT *
FROM customer_coupon_xref ccx
WHERE ccx.customer_id = 43491;
SELECT *
FROM customer_coupon_xref ccx LEFT JOIN coupon c ON c.coupon_id = ccx.coupon_id
WHERE ccx.createdOn BETWEEN '2016-05-11 00:00:00' AND '2016-05-11 23:59:59' AND c.coupon_type < 4;
SELECT *
FROM blc_order bo
WHERE bo.ORDER_STATUS = 'PAID' AND bo.DATE_UPDATED BETWEEN '2016-05-11 00:00:00' AND '2016-05-11 23:59:59';
SELECT *
FROM blc_order bo LEFT JOIN blc_order_attribute boa ON bo.ORDER_ID = boa.ORDER_ID
WHERE boa.NAME = 'result_code' AND boa.VALUE = 'SUCCESS' AND bo.ORDER_STATUS <> 'PAID'
ORDER BY bo.DATE_UPDATED DESC;
SELECT *
FROM blc_order
WHERE ORDER_NUMBER = '201605100623026225204';
SELECT fivecard_id
FROM customer_fivecard_xref cfx
GROUP BY fivecard_id
HAVING count(fivecard_id) > 1;
/*检测卡资格数量*/
SELECT *
FROM
  customer_fivecard_xref
WHERE fivecard_id IN
      (SELECT fivecard_id
       FROM
         customer_fivecard_xref cfx
       GROUP BY fivecard_id
       HAVING COUNT(fivecard_id) > 1)
ORDER BY fivecard_id ASC;
/*查询五折卡数量是否一致*/
SELECT count(*)
FROM customer_fivecard_xref
WHERE status = 1;
SELECT count(*)
FROM fivecard
WHERE card_status = 1;
/**/
/*查询优惠券发放数量*/
SELECT count(*)
FROM customer_coupon_xref;
SELECT 8000 - coupon.coupon_amount
FROM coupon
WHERE coupon_id = 1;
/**/
SELECT *
FROM customer_fivecard_xref
WHERE status = 1 AND fivecard_id IS NULL;
/*查看系统中匿名用户*/
SELECT
  FIRST_NAME,
  USER_NAME
FROM blc_customer
WHERE USER_NAME IS NOT NULL AND FIRST_NAME IS NULL AND IS_REGISTERED = 1;
/*更新查询订单详情*/
SELECT
  customerim0_.CUSTOMER_ID                AS CUSTOMER1_37_6_,
  customerim0_.CREATED_BY                 AS CREATED2_37_6_,
  customerim0_.DATE_CREATED               AS DATE3_37_6_,
  customerim0_.DATE_UPDATED               AS DATE4_37_6_,
  customerim0_.UPDATED_BY                 AS UPDATED5_37_6_,
  customerim0_.CHALLENGE_ANSWER           AS CHALLENG6_37_6_,
  customerim0_.CHALLENGE_QUESTION_ID      AS CHALLEN18_37_6_,
  customerim0_.LOCALE_CODE                AS LOCALE19_37_6_,
  customerim0_.DEACTIVATED                AS DEACTIVA7_37_6_,
  customerim0_.EMAIL_ADDRESS              AS EMAIL8_37_6_,
  customerim0_.FIRST_NAME                 AS FIRST9_37_6_,
  customerim0_.LAST_NAME                  AS LAST10_37_6_,
  customerim0_.PASSWORD                   AS PASSWOR11_37_6_,
  customerim0_.PASSWORD_CHANGE_REQUIRED   AS PASSWOR12_37_6_,
  customerim0_.IS_PREVIEW                 AS IS13_37_6_,
  customerim0_.RECEIVE_EMAIL              AS RECEIVE14_37_6_,
  customerim0_.IS_REGISTERED              AS IS15_37_6_,
  customerim0_.TAX_EXEMPTION_CODE         AS TAX16_37_6_,
  customerim0_.USER_NAME                  AS USER17_37_6_,
  customerim0_1_.test                     AS test1_183_6_,
  CASE WHEN customerim0_1_.CUSTOMER_ID IS NOT NULL
    THEN 1
  WHEN customerim0_.CUSTOMER_ID IS NOT NULL
    THEN 0 END                            AS clazz_6_,
  challengeq1_.QUESTION_ID                AS QUESTION1_33_0_,
  challengeq1_.QUESTION                   AS QUESTION2_33_0_,
  localeimpl2_.LOCALE_CODE                AS LOCALE1_78_1_,
  localeimpl2_.CURRENCY_CODE              AS CURRENCY5_78_1_,
  localeimpl2_.DEFAULT_FLAG               AS DEFAULT2_78_1_,
  localeimpl2_.FRIENDLY_NAME              AS FRIENDLY3_78_1_,
  localeimpl2_.USE_IN_SEARCH_INDEX        AS USE4_78_1_,
  broadleafc3_.CURRENCY_CODE              AS CURRENCY1_36_2_,
  broadleafc3_.DEFAULT_FLAG               AS DEFAULT2_36_2_,
  broadleafc3_.FRIENDLY_NAME              AS FRIENDLY3_36_2_,
  customerfi4_.id                         AS id1_184_3_,
  customerfi4_.active_date                AS active2_184_3_,
  customerfi4_.create_date                AS create3_184_3_,
  customerfi4_.customer_id                AS customer7_184_3_,
  customerfi4_.fivecard_id                AS fivecard8_184_3_,
  customerfi4_.is_show_dialog             AS is4_184_3_,
  customerfi4_.referer                    AS referer9_184_3_,
  customerfi4_.status                     AS status5_184_3_,
  customerfi4_.type                       AS type6_184_3_,
  fivecardim5_.card_id                    AS card1_177_4_,
  fivecardim5_.card_desc                  AS card2_177_4_,
  fivecardim5_.card_name                  AS card3_177_4_,
  fivecardim5_.card_no                    AS card4_177_4_,
  fivecardim5_.card_status                AS card5_177_4_,
  fivecardim5_.card_type                  AS card6_177_4_,
  customcust6_.CUSTOMER_ID                AS CUSTOMER1_37_5_,
  customcust6_1_.CREATED_BY               AS CREATED2_37_5_,
  customcust6_1_.DATE_CREATED             AS DATE3_37_5_,
  customcust6_1_.DATE_UPDATED             AS DATE4_37_5_,
  customcust6_1_.UPDATED_BY               AS UPDATED5_37_5_,
  customcust6_1_.CHALLENGE_ANSWER         AS CHALLENG6_37_5_,
  customcust6_1_.CHALLENGE_QUESTION_ID    AS CHALLEN18_37_5_,
  customcust6_1_.LOCALE_CODE              AS LOCALE19_37_5_,
  customcust6_1_.DEACTIVATED              AS DEACTIVA7_37_5_,
  customcust6_1_.EMAIL_ADDRESS            AS EMAIL8_37_5_,
  customcust6_1_.FIRST_NAME               AS FIRST9_37_5_,
  customcust6_1_.LAST_NAME                AS LAST10_37_5_,
  customcust6_1_.PASSWORD                 AS PASSWOR11_37_5_,
  customcust6_1_.PASSWORD_CHANGE_REQUIRED AS PASSWOR12_37_5_,
  customcust6_1_.IS_PREVIEW               AS IS13_37_5_,
  customcust6_1_.RECEIVE_EMAIL            AS RECEIVE14_37_5_,
  customcust6_1_.IS_REGISTERED            AS IS15_37_5_,
  customcust6_1_.TAX_EXEMPTION_CODE       AS TAX16_37_5_,
  customcust6_1_.USER_NAME                AS USER17_37_5_,
  customcust6_.test                       AS test1_183_5_
FROM BLC_CUSTOMER customerim0_ LEFT OUTER JOIN customer_extend customerim0_1_
    ON customerim0_.CUSTOMER_ID = customerim0_1_.CUSTOMER_ID
  LEFT OUTER JOIN BLC_CHALLENGE_QUESTION challengeq1_ ON customerim0_.CHALLENGE_QUESTION_ID = challengeq1_.QUESTION_ID
  LEFT OUTER JOIN BLC_LOCALE localeimpl2_ ON customerim0_.LOCALE_CODE = localeimpl2_.LOCALE_CODE
  LEFT OUTER JOIN BLC_CURRENCY broadleafc3_ ON localeimpl2_.CURRENCY_CODE = broadleafc3_.CURRENCY_CODE
  LEFT OUTER JOIN customer_fivecard_xref customerfi4_ ON customerim0_.CUSTOMER_ID = customerfi4_.customer_id
  LEFT OUTER JOIN FIVECARD fivecardim5_ ON customerfi4_.fivecard_id = fivecardim5_.card_id
  LEFT OUTER JOIN customer_extend customcust6_ ON customerfi4_.referer = customcust6_.CUSTOMER_ID
  LEFT OUTER JOIN BLC_CUSTOMER customcust6_1_ ON customcust6_.CUSTOMER_ID = customcust6_1_.CUSTOMER_ID
WHERE customerim0_.CUSTOMER_ID = 25797;

