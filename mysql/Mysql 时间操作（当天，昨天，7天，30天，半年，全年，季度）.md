# Mysql 时间操作（当天，昨天，7天，30天，半年，全年，季度） #

```
1 、 查看当天日期
select current_date();

2、 查看当天时间
select current_time();

3、查看当天时间日期
select current_timestamp();

4、查询当天记录
select * from 表名 where to_days(时间字段名) = to_days(now());

5、查询昨天记录
SELECT * FROM 表名 WHERE TO_DAYS( NOW( ) ) – TO_DAYS( 时间字段名) <= 1

6、查询7天的记录
SELECT * FROM 表名 where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(时间字段名)

7、查询近30天的记录
SELECT * FROM 表名 where DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= date(时间字段名)

8、查询本月的记录
SELECT * FROM 表名 WHERE DATE_FORMAT( 时间字段名, ‘%Y%m’ ) = DATE_FORMAT( CURDATE( ) , ‘%Y%m’ )

9、查询上一月的记录
SELECT * FROM 表名 WHERE PERIOD_DIFF( date_format( now( ) , ‘%Y%m’ ) , date_format( 时间字段名, ‘%Y%m’ ) ) =1

10、查询本季度数据
select * from 表名 where QUARTER(create_date)=QUARTER(now());

11、查询上季度数据
select * from 表名 where QUARTER(create_date)=QUARTER(DATE_SUB(now(),interval 1 QUARTER));

12、查询本年数据
select * from 表名  where YEAR(create_date)=YEAR(NOW());

13、查询上年数据
select * from 表名 where year(create_date)=year(date_sub(now(),interval 1 year));

14、查询当前这周的数据
SELECT * FROM 表名 WHERE YEARWEEK(date_format(submittime,'%Y-%m-%d')) = YEARWEEK(now());

15、查询上周的数据
SELECT * FROM 表名 WHERE YEARWEEK(date_format(submittime,'%Y-%m-%d')) = YEARWEEK(now())-1;

16、查询当前月份的数据
select * from 表名   where date_format(submittime,'%Y-%m')=date_format(now(),'%Y-%m')

17、查询距离当前现在6个月的数据
select name,submittime from enterprise where submittime between date_sub(now(),interval 6 month) and now();

18、mysql直接日期加几天时间添加7天的例子:
SELECT DATE_ADD('2011-09-26', INTERVAL 7 DAY);
```
