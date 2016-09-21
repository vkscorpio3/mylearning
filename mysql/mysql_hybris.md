# MySQL

## MySQL查询表数量
```
SELECT count(TABLE_NAME) FROM information_schema.TABLES WHERE TABLE_SCHEMA='dbname';
```

## 创建库
```
CREATE SCHEMA `hybris_asset` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
```