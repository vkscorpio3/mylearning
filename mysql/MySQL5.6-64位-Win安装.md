# MySQL5.6 64位 Win安装

## 配置文件

my.ini

```
basedir=D:\work\mysql-5.6.30-winx64
datadir=D:\work\mysql-5.6.30-winx64\data
port=3306
```

[mysql]
# 设置mysql客户端默认字符集
default-character-set=utf8 
[mysqld]
#设置3306端口
port = 3306 
# 设置mysql的安装目录
basedir=D:\mysql\mysql-5.6.17-winx64
# 设置mysql数据库的数据的存放目录
datadir=D:\mysql\mysql-5.6.17-winx64\data
# 允许最大连接数
max_connections=200
# 服务端使用的字符集默认为8比特编码的latin1字符集
character-set-server=utf8
# 创建新表时将使用的默认存储引擎
default-storage-engine=INNODB 

## 安装mysql服务

```
mysqld install

net start mysql
```

## 打开MySQL


还是将目录切换到D:\mysql\mysql-x.x.xx-winx64\bin（x.xx.xxx是什么根据你自己的版本来吧）输入mysql -uroot -p ,默认是没有密码的。回车进入，当然我的已经设置密码了，所以要输入密码才能进。有密码的话，可以mysql -uroot -p密码，也是可以是mysql -uroot -p 回车输入密码，推荐第二种，原因，你动手之后就知道了。
设置密码的方法：mysqladmin -u root -p password 密码。
退出exit 就行了。记住直接关闭cmd窗口是没有退出的，要输入exit才会退出啊。