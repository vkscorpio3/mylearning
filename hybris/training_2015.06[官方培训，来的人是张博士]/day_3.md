# Day 3

*-items.xml 定义

Type Collection

建立关系，2种方式 Collection & Rel

Collection 描述一对多 单项关系 e.g. 商品->图片


商品->品类   多对多

## 差别是 数据存储模式上不同
Collection 存储在一的那一端，有可能出现，存储不下的问题，数据丢失
Relation 存在多的一侧或者中间表

可以参考core-items.xml

可以定义索引

可以通过HCM定义Type，然后导出xml

* 5.6 7月下旬发布
* 3个月发布一个版本
* sap收购后，从5.1到当前的版本
* 3年前进入亚洲市场，去年SAP收购后开始推广，去年增长200%，Sap收购后，价格涨了3倍左右。
* 鸿翔一心堂，和IBM与Oracle竞争，技术上完胜对手。
* YaaS
* 中国版->
* hybris的思想，自己做框架，应用层第三方咨询公司干。
* 淘宝 10亿商品，搜索服务器3千台
* hybris 客户 大多 百万级 商品，很少有超过个位数的 搜索引擎服务器

## 要学什么东西？
Winston wiki.hybris.com

## 提高效率

启动速度 config/tomcat/conf/server.xml 加 startStopThreads＝“0”
动态加载类：JRebel（商业软件）；Spring  load； DVCTM

## 安全
training.sap.com/hk/en/

JaloSession

以前Jalo架构时的遗留，最新的用 SessionService（管理Service层的Session）5.0以后转向SessionService

SpringSession

Event 很重要，解构，系统集成 等等 EDA体系架构

Type 层次的权限控制  Backoffice 中，默认灰色的 √是继承权限

## Restrictions 个性化定制权限
过滤条件  e.g. 只有审批过的商品才可以在前端显示

Personalization 限定权限的 Restriction


## 站内信

上传文件是 Meida 是 Type的属性

读取文件，需要覆盖 save

hmc 是管理 Type的，不建议有业务功能

OWASP 安全报告




# Event System

event 本身是Spring的机制

* 继承 AbstractEvetn
* 监听器
* 异步推荐在 platform 中设置，
* 站内信，不重写 save 的方案：拦截器 + 事件

Example
hybris 默认注册后即登录
新需求，注册后，需要验证，然后才能登录。
脚本语言也可以写事件，无需重启。

异步：event-spring.xml   springEventSender 中


Backoffice

hMC 是管理 Type的，技术人员使用，偏向底层

Cockpit & Backoffice 是业务人员使用，界面友好。


hMC 是用标准的MVC架构实现，定制是利用jsp，通过 webchip

Cockpit 和 Backoffice 实现技术比较接近，是基于ZK framework 构建的，基础定制，不需要了解ZK，高级定制，需要ZK

Cockpit 和 Backoffice 区别：cockpit是分散的，各种cockpit。Backoffice是聚合的，一个界面中，不同的视图。根据不同的用户权限，有不同的视图


这3个最基础的支撑 都是基于 Type 管理 item

Backoffice 基于zk ，然后hybris有进行了封装，很多个 Widget

F4 进入 Widget编辑

扩展 模版 ybackoffice

扩展：Widget 可以和另外一个Widget通讯，系统中提供了100多个。

自定义 Widget

* definition.xml
* Widget view 用zk
* 配置 cockpit-config.xml

- 定制左侧菜单，定制右侧搜索条件
- 创建商品向导
- Editore Area & hmD
深度定制，需要加Actions/Editors

聚合后的xml F4可以看 点击右上角的 logo，然后选择 show cockpit-cofig

## Cockpit

富Web
resources/productckcpitsampledata-config
	productmanagegroup

覆盖的时候，同名文件覆盖

Spring 中做配置，覆盖action



只要有Type 就有 api

webservice 测试工具  postman

作业：Backoffice


ContentCatelog  页面内容
ProductCatelog	产品内容
