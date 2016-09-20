# 限制当前只能用随提

> 


```
SET @product_type = 'anytime';
SET @order_type = @product_type;

UPDATE `customer_detail` SET `product_type` = @product_type , `order_type` = @order_type WHERE  1 = 1;

UPDATE `customer` SET session_id = 'logout' WHERE 1 = 1;
```

