# Day 2

### 问题讲解

##### item 定义

autocreate = true/false  true是新的Type，false 扩展已有的Type

generate = true/false 遗留代码，jalo是否自动生成 5.0 以后版本取消 jalo，不用再写了

* true  true 新增
* false false 扩展

##### Type attribute type＝dynamic

这条属性不存在DB中，通过动态计算的方式，老版本是jalo，新版本是 attributeHandler

type 目前推荐使用2个 property 和 dynamic，另2个是遗留代码

### Flexible Search

* 搜索 Type 得到 Item 得到一堆Model
* 搜索属性 Syntax:{}
* SELECT {code} FROM {Product!}，默认搜索子Type，加感叹号，只搜索当前Type
* JDBC 可以用，但丧失了hybris对表的管理。e.g. 大数据分析后的数据，hybris要用，直接连到表。
* Count  SearchResult<Integer>

### ImpEx 导入/导出
* 尽量不要用于业务处理，只做导入导出
* 基于Type操作
* INSERT/UPDATE/INSERT_UPDATE/REMOVE
* [] 修饰符，() 复合类型，括号中的参数是 对应的 Type的业务主建
* $宏定义
* INSERT_UPDATE 必须指定某一列为业务主键
* 任务：
    * hmc 中创建一个商品，iphone6
    * ImpEx中创建一个小米 6

### Cache

* 基于区域缓存，多个节点，大小，策略 可以单独设置
* 分布式系统，本地缓存，涉及到缓存同步
* 其中一个节点缓存发生更新了，发消息到通讯中心，告诉其他节点缓存失效
* hybris Type 缓存，key是sql，value是结果集
* Types 缓存没有大小限制，也没有驱逐策略

### Transactions

Winston推荐的事务相关数据《JTDS》INFOQ上可以免费下载

### CronJobs
* 备份、同步、导入、到处、定期计算
* 三元素：runtime信息 Type， job spring bean， Trigger 也是个Type
* CronJobs 运行在 SessionContext中
* 可以用脚本写 CronJobs，而无需重启服务器，groovy
* groovy： println productService 可以看到实现
* 默认30秒

### Update

* Update running system： Type变化时候更新
* Clear the hMC：hmc修改后
* Create essential data：创建基础数据，加载指定目录中的，钩子函数
* Localize Type：Type 本地化文件修改

### 钩子函数
CoreSystemSetu
@SystemSetu

### PCM hybris 最强大的功能之一

Catelog 一个比较大的容易，装所有的商品

一个Catelog下包含喊几个 Catelog Version

每个 CV 下有多个 Category

Classification 怎么建模？动态修改建模

非结构化信息，不便于搜索

### Services

hybris 自带了一些service，可以直接用，也可以加新的，也可以替换增强

推荐，web成用 注解， web层以下用xml

ModuleService

Interceptor 基于Module生命周期  5个拦截点 5个接口

Module new 和 service create 的区别，后者带缺省值

### Beans Generation

可以在多个extension 中定义bean or 扩展
