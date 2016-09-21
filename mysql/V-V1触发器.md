# V-V1触发器

> 给初始箱数赋值

```
DROP TRIGGER IF EXISTS `flash`.`backup_invest_product_quantity`;
CREATE  TRIGGER `flash`.`backup_invest_product_quantity`
BEFORE INSERT  ON flash.fh_invest_product
 FOR EACH ROW  
begin

SET NEW.quantity_init = NEW.quantity;

end;

```
