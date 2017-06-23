# Day 1

### 版本
* 5.5.1.1 是过渡版本，需要java 8
* 5.6 Java8 Spring4.1

底层hybris自己的框架，最少的依赖来完成功能

顶层，开源技术，开放性比较强，容易定制化开房

切面：安全；缓存；事务

### 管理系统
* 第一代 hmc 管理type
* 第二代 cockpit
* 第三代 backoffice

### 展示
* www.hktvmall.com
* www.hxyxt.com
* www.lessomall.com

### backoffice
控制排名、置顶，控制Facets

### build framework
* Ant
* Maven
* Gradle

### extension 中包含的内容
* Java 代码
* Data Type 定义
* Web， 标准的java EE
* hMC

### Others
* 全局配置，覆盖project中的缺省值
* 修改/覆盖 原有功能，就去 继承 依赖
* localextensions.xml
    *依赖可以 用 name 也可以 dir
    *可以加载指定目录下所以的extension
* initialization 会删除表后重新建立基本数据
* update 从不删数据
* Type分为 系统级 和
* 扩展Model属性，可以扩展和直接加
* Design time  vs runtime，推荐使用前者
* ORM存储方式
    * SingleTable：效率高，空间浪费，列约束失效
    * ClassTable：效率低，空间紧凑
    * ConcreteTable
    * Hybris 支持 SingleTable 和 ConcreteTable
* hybris 原则
    * 默认根据名字找表，如果没有到 superType中去找，还没有，
    * 至少第一层需要有表，不能用GenericItem 表
    * 第二层往后，不建议指定表，如果有特殊需求，可以指定表
    * 关系，多对多的关系中，建议指定表，如果不指定，放入一个公共表中（不推荐）
    * 查看 Type 存储中哪个表：HAC -> Deployment -> Type with deployment
* Localization 分两种
    * Type Localization 写属性文件中
    * Data Localization （hybris 多语言机制，字段类型前面加localiz，数据存储中单独的表中）

### Homework
> 研究一些 Type

* Catalog
* User
* Order
* Marketing
