# Day 4

## 问题解答

select * from 查询不到数据，子Type的问题造成的，不建议这样用，查询列要定义， 查询 pk 即可得到 Model

select pk  是延迟加载

在 hybris 有3种方式，配置延迟加载

* default（默认None）
* None 不加载
* literal
* all

## 课程内容

### 库存

结构图

库存介绍

预售

什么时候减少库存是可配置的：放入购物车；订单；付款；发货；签收；评价

放在前面容易卖不出去，放后面容易超卖。

国外是先付款再订单

OMS 库存  并且涵盖了一部分 CRM

stockService


### 价格

* 静态价格
* hybris价格处理
* 调用第三方服务获取价格

不同的会员不同的价格，不同的商品组合不同的价格，不同的渠道等等，很复杂。

hybris内置了价格引擎：PriceFactory

hmc 中，指定某个用户什么价格，指定100个商品神价格

可以限制最大购买量，最小购买量

### Vouchers & Promotions
优惠卷，单码劵 多码劵

官方文档需要阅读，每个Extansion

* qq群
* 公众号：
* 网站：还没有做。

### WeChat

连接器 + 内容

http://djt.qq.com/article/view/1306

移动应用 M
网站网站 W
xxx
xxx

微信小店 是微信自己的东西
微商是外部的

微信卡劵

github.com/colorzhang/

hybris 与第三方集成，建议在 service层



# Summary

## Facades层 是一种模式

主要是隔离 Controller 和 service

数据成，以Type为核心是 Hybris 自由的技术

拦截器 和 事件是在service成的，事件是为了组件之间解耦

## 搜索知道补全



## 每次讲课张老师都要讲的

饼图

* 技术 （功）
    * spring
    * tomcat
    * solr
    * 继承
    * 各种第三方库
* Industnal
    * 电商相关业务，
    * 电商人应该关注的12个公众号
    * 了解业界发生的事情
    * 关注一些交流会
    * hybris会议
* Method （武）
    * hybris做项目的方法论
    * hybris 最佳实现 （Impl best）

调查问卷：

https://www.surveymonkey.com/

