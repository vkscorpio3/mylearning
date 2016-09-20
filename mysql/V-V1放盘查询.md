# V1放盘查询

```
-- 放盘起始时间
SET @afterTime = date_format('2016-05-09 09:00:00', '%Y%m%d%H%i%s');

SELECT 

ip.`id` ,

ip.`create_date` ,

concat(ism.`group_name`) as product , 
concat(ip.`release_month`,'月') as month ,
concat('$' ,ip.`price` ) as price ,

concat(
    '卖出' ,
    ( SELECT SUM( o.box )  FROM `fh_order` as o  WHERE o.`status` =1 and o.`invest_id`  = ip.`id` ) ,
    '箱,剩余' ,
    ip.`quantity` ,
    '箱，共有' ,
    (SELECT COUNT(o.`id`)  FROM `fh_order` as o  WHERE o.`status` =1 and o.`invest_id`  = ip.`id`) ,
    '人下单。'
)as sale ,

group_concat(oo.`user_name`) as '下单人',
group_concat(oo.`box`) as '下单箱数'

FROM `fh_invest_product` as ip

LEFT JOIN `fh_invest_spec_master` as ism on ism.`id` = ip.`spec_id` 
LEFT JOIN `fh_order` as oo on oo.`invest_id` = ip.`id` 

where oo.`status` =1 and ip.`create_date` > @afterTime

GROUP BY ip.`id` 

ORDER BY ip.`create_date` 
```
