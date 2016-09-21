#搭建一个B2C开发环境
> 基于5.4版本，练习环境。

##开发环境
> jdk, eclipse, mysql

##hybris环境
> 解压出hybris即可，尽可能放到根目录。
> ant clean

##创建B2C模块
> ant modulegen 创建b2c模块，会生成7个工程，创建过程中会要求输入3个参数：模块类型（默认）；前缀；包

##修改配置
> **修改config目录下的localextensions.xml**，这一步可以直接拷贝sampleconfigurations目录下的b2c_acc_standalone_extensions.xml，备份原有的localextensions.xml，然后直接替换。替换后找到第63行的 <!-- ext-template -->，把里面的7个 yaccelerator 开头的扩展名字改成上一步的模块前缀。  

> **修改config目录下的local.properties**，添加如下配置： 

```
build.parallel=true
hac.webroot=/hac
db.url=jdbc:mysql://localhost/db-name?useConfigs=maxPerformance&characterEncoding=utf8
db.driver=com.mysql.jdbc.Driver
db.username=root
db.password=
db.tableprefix=
mysql.optional.tabledefs=CHARSET=utf8 COLLATE=utf8_bin
mysql.tabletype=InnoDB
```

> 拷贝mysql驱动到platform/lib/dbdriver

##启动服务
> ant all
> sh ./hybrisserver.sh

##数据初始化
> hac中，初始化和更新

##站点配置

1. 访问 http://localhost:9001/hmc/hybris
2. 左侧菜单栏里WCMS->Websites
3. 在Results里点击ID为electronics 前面的图标
4. 找到Configuration，URL Patterns，选中第一个并保存
5. 这一步最悲催，第一次搞那天晚上都配置好了，却不知道B2C站点的地址，好几个人找了2个多小时。上一步保存后，点开第二个选项卡WCMS Cockpit Properties，把WCMS Cockpit Preview URL 拷贝出来：/xxxstorefront/?site=electonics

##修改host
If you have administrator rights, it is a good idea to add the following entries in your host file.
The etc hosts modification allows the accelerator to identify sites (CMSSites) from the url.
If you are on windows machine it is normally located here c:\Windows\System32\drivers\etc\hosts
On Unix / Linux / Mac the file is located here /etc/hosts
127.0.0.1 hybris.local  

This makes for a neater URL construction, so you can call http://hybris.local:9001/yacceleratorstorefront/  
If you don't do this, the sites would need to be identified with an additional request parameter 
like:http://localhost:9001/yacceleratorstorefront/?site=hybris&clear=true





