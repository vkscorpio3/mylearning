# ehcache.xml详解

> ehcache.xml是ehcache的配置文件，并且存放在应用的classpath中。下面是对该XML文件中的一些元素及其属性的相关说明： 

<diskStore>元素：指定一个文件目录，当EHCache把数据写到硬盘上时，将把数据写到这个文件目录下。 下面的参数这样解释： 

- user.home – 用户主目录   
- user.dir      – 用户当前工作目录   
- java.io.tmpdir – 默认临时文件路径