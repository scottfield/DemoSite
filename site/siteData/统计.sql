#付款成功订单
SELECT
  o.`ORDER_NUMBER`   订单号,
  #   boa.`VALUE`                                微信订单号,
  s.`name`           门店名称,
  sa.`mchid`         商户号,
  o.`SUBMIT_DATE`    下单时间,
  ba.`FIRST_NAME`    提货人,
  bp.`PHONE_NUMBER`  电话,
  o.`ORDER_SUBTOTAL` 金额,
  o.`ORDER_STATUS`   订单状态
FROM
  blc_order o
  LEFT JOIN order_extend oe
    ON o.`ORDER_ID` = oe.`ORDER_ID`
  LEFT JOIN blc_address ba
    ON oe.`ADDRESS_ID` = ba.`ADDRESS_ID`
  LEFT JOIN blc_phone bp
    ON bp.`PHONE_ID` = ba.`PHONE_PRIMARY_ID`
  LEFT JOIN address_shop adds
    ON adds.`address_id` = ba.`ADDRESS_ID`
  LEFT JOIN shop s
    ON s.`id` = adds.`shop_id`
  LEFT JOIN shop_account sa
    ON sa.`id` = s.`shop_account_id`
  LEFT JOIN blc_customer bc
    ON bc.`CUSTOMER_ID` = o.`CUSTOMER_ID`
/*LEFT JOIN blc_order_attribute boa
  ON boa.`ORDER_ID` = o.`ORDER_ID`*/
WHERE /* boa.`NAME` = 'transaction_id' AND */
  o.`ORDER_STATUS` IN ('CONSUMED')
/*AND (
  o.`SUBMIT_DATE` BETWEEN '2016-05-11 00:00:00'
  AND '2016-05-11 23:59:59'
)*/
ORDER BY o.`SUBMIT_DATE`;

#订单详情
SELECT
  bo.`ORDER_NUMBER`  订单号,
  boi.`NAME`         商品名称,
  boi.`QUANTITY`     数量,
  boi.`SALE_PRICE`   售价,
  boi.`RETAIL_PRICE` 原价,
  bo.`ORDER_STATUS`  订单状态
FROM
  blc_order bo
  LEFT JOIN blc_order_item boi
    ON bo.`ORDER_ID` = boi.`ORDER_ID`
WHERE bo.`ORDER_STATUS` != 'IN_PROCESS';
/*查询发放优惠券数量*/
SELECT COUNT(*)
FROM customer_coupon_xref
WHERE (`createdOn` BETWEEN '2016-05-9 00:00:00'
AND '2016-05-10 23:59:59');
#付款成功订单
SELECT
  o.`ORDER_NUMBER`                           订单号,
  boa.`VALUE`                                微信订单号,
  s.`name`                                   门店名称,
  sa.`mchid`                                 商户号,
  o.`SUBMIT_DATE`                            下单时间,
  ba.`FIRST_NAME`                            提货人,
  bp.`PHONE_NUMBER`                          电话,
  o.`ORDER_SUBTOTAL`                         金额,
  IF(o.`ORDER_STATUS` = 'PAID', '付款', '未付款') 订单状态
FROM
  blc_order o
  LEFT JOIN order_extend oe
    ON o.`ORDER_ID` = oe.`ORDER_ID`
  LEFT JOIN blc_address ba
    ON oe.`ADDRESS_ID` = ba.`ADDRESS_ID`
  LEFT JOIN blc_phone bp
    ON bp.`PHONE_ID` = ba.`PHONE_PRIMARY_ID`
  LEFT JOIN address_shop adds
    ON adds.`address_id` = ba.`ADDRESS_ID`
  LEFT JOIN shop s
    ON s.`id` = adds.`shop_id`
  LEFT JOIN shop_account sa
    ON sa.`id` = s.`shop_account_id`
  LEFT JOIN blc_customer bc
    ON bc.`CUSTOMER_ID` = o.`CUSTOMER_ID`
  LEFT JOIN blc_order_attribute boa
    ON boa.`ORDER_ID` = o.`ORDER_ID`
WHERE boa.`NAME` = 'transaction_id'
      AND o.`ORDER_STATUS` = 'PAID'
/*AND (
  o.`SUBMIT_DATE` BETWEEN '2016-05-9 00:00:00'
  AND '2016-05-10 23:59:59'
)*/
ORDER BY o.`ORDER_STATUS`;
SELECT
  o.`ORDER_NUMBER`      订单号,
  #   boa.`VALUE`                                微信订单号,
  s.`name`              门店名称,
  sa.`mchid`            商户号,
  o.`SUBMIT_DATE`       下单时间,
  receiver.`VALUE`      提货人,
  receiverPhone.`VALUE` 电话,
  o.`ORDER_SUBTOTAL`    金额,
  o.`ORDER_STATUS`      订单状态
FROM
  blc_order o
  LEFT JOIN order_extend oe
    ON o.`ORDER_ID` = oe.`ORDER_ID`
  LEFT JOIN blc_address ba
    ON oe.`ADDRESS_ID` = ba.`ADDRESS_ID`
  LEFT JOIN blc_phone bp
    ON bp.`PHONE_ID` = ba.`PHONE_PRIMARY_ID`
  LEFT JOIN address_shop adds
    ON adds.`address_id` = ba.`ADDRESS_ID`
  LEFT JOIN shop s
    ON s.`id` = adds.`shop_id`
  LEFT JOIN shop_account sa
    ON sa.`id` = s.`shop_account_id`
  LEFT JOIN blc_customer bc
    ON bc.`CUSTOMER_ID` = o.`CUSTOMER_ID`
  LEFT JOIN blc_order_attribute receiver
    ON receiver.`ORDER_ID` = o.`ORDER_ID`
  LEFT JOIN blc_order_attribute receiverPhone
    ON receiverPhone.ORDER_ID = o.ORDER_ID
WHERE  receiver.`NAME` = 'receiver' AND receiverPhone.NAME='receiverPhone' AND
  o.`ORDER_STATUS` IN ('CONSUMED')
/*AND (
  o.`SUBMIT_DATE` BETWEEN '2016-05-11 00:00:00'
  AND '2016-05-11 23:59:59'
)*/
ORDER BY o.`SUBMIT_DATE`;
SELECT *
FROM blc_order
WHERE ORDER_STATUS = 'CONSUMED';
