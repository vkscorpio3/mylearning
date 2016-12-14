# Java服务器配置

> ...

### 辅助

```
yum install htop

yum install wget

yum install zip
```

### 下载和拷贝

```
# 下载
wget http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz?AuthParam=1481680452_7b0a82fb7ee458bda8fa0e099d256166

# 拷贝
scp ./apache-maven-3.3.9-bin.tar.gz cuflash@139.196.1.1:/home/cuflash/setup
scp ./apache-tomcat-8.0.36.tar.gz cuflash@139.196.1.1:/home/cuflash/setup
# jenkins暂时不安装了，用另一台服务器上的jenkins远程管理
scp ./jenkins.war cuflash@139.196.1.1:/home/cuflash/setup

scp ./nginx-1.11.3.tar.gz cuflash@139.196.1.1:/home/cuflash/setup
```

### 目录

- ~/setup 下载和拷贝的安装包
- /usr/local
- /opt/

### JDK

/usr/local/jdk1.8

```
tar xzvf jdk-8u112-linux-x64.tar.gz
sudo mv ./jdk1.8.0_112 /usr/local/jdk1.8

sudo vi /etc/profile

# 在尾部添加如下配置

# add by wen
export JAVA_HOME=/usr/local/jdk1.8
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin

# 保存后，执行
source /etc/profile

# 测试
java -version
```

### Maven

/usr/local/apache-maven3.3.9

```
tar xzvf apache-maven-3.3.9-bin.tar.gz
sudo mv ./apache-maven-3.3.9 /usr/local/apache-maven-3.3.9

sudo vi /etc/profile

# 在尾部添加如下配置

# add by wen
export M2_HOME=/usr/local/apache-maven-3.3.9
export PATH=$PATH:$M2_HOME/bin

# 保存后，执行
source /etc/profile

# 测试
mvn -v
```

### Tomcat

/usr/local/

```
tar xzvf apache-tomcat-8.0.36.tar.gz
mv apache-tomcat-8.0.36 apache-tomcat-8
sudo mv ./apache-tomcat-8 /usr/local/apache-tomcat-8

cd /usr/local/apache-tomcat-8/bin
./startup.sh

# 测试，访问：http://139.196.1.1:8080

# 关闭
./shutdown.sh
```

Unix daemon

```
# 创建tomcat用户，但不创建用户目录
useradd -M tomcat
chown -R tomcat: /usr/local/apache-tomcat-8


sudo vi /etc/profile

# add by wen
export CATALINA_HOME=/usr/local/apache-tomcat-8
export CATALINA_BASE=$CATALINA_HOME
export PATH=$PATH:$CATALINA_HOME/bin

# 保存后，执行
source /etc/profile

# 测试
echo $CATALINA_HOME


cd $CATALINA_HOME/bin
sudo tar xvfz commons-daemon-native.tar.gz
cd commons-daemon-1.0.x-native-src/unix
sudo ./configure --with-java=/usr/local/jdk1.8
sudo make
sudo cp jsvc ../..

cp daemon.sh /etc/init.d/tomcat
sudo /etc/init.d/tomcat start

# 其他命令
sudo /etc/init.d/tomcat start|stop|run|version
# 也可以使用
sudo service tomcat start|stop
```

启动失败了，没有读取到环境变量，直接在 /etc/init.d/tomcat 中头部添加：

```
export JAVA_HOME=/usr/local/jdk1.8

export TOMCAT_HOME=/usr/local/apache-tomcat-8

export CATALINA_HOME=$TOMCAT_HOME
export CATALINA_BASE=$CATALINA_HOME
export CATALINA_TMPDIR=$CATALINA_HOME/temp
```

> 每次系统启动后，服务并不能自己启动

调查发现

/etc 目录下结构

```
- rc.d/init.d
- init.d -> rc.d/init.d
- rc -> rc.d/rc
- rc0.d -> rc.d/rc0.d
- rc1.d -> rc.d/rc1.d
- rc2.d -> rc.d/rc2.d
- rc3.d -> rc.d/rc3.d
- rc4.d -> rc.d/rc4.d
- rc5.d -> rc.d/rc5.d
- rc6.d -> rc.d/rc6.d
```

/etc/init.d 是 /etc/rc.d/init.d 的连接

rc3.d 目录中的数字3，表示系统启动级别

进入 /etc/rc3.d 目录后发现都是连接，例如

```
lrwxrwxrwx. 1 root root 16 Aug 14  2014 K01smartd -> ../init.d/smartd
lrwxrwxrwx. 1 root root 13 Aug 14  2014 K05atd -> ../init.d/atd
lrwxrwxrwx. 1 root root 16 Aug 14  2014 K10psacct -> ../init.d/psacct
lrwxrwxrwx. 1 root root 19 Aug 14  2014 K10saslauthd -> ../init.d/saslauthd
lrwxrwxrwx. 1 root root 18 Aug 14  2014 K15svnserve -> ../init.d/svnserve
lrwxrwxrwx. 1 root root 14 Aug 14  2014 S55sshd -> ../init.d/sshd
lrwxrwxrwx  1 root root 14 Jan 30  2015 S58ntpd -> ../init.d/ntpd
lrwxrwxrwx. 1 root root 15 Aug 14  2014 S90crond -> ../init.d/crond
lrwxrwxrwx  1 root root 20 Dec 13 11:13 S98agentwatch -> ../init.d/agentwatch
lrwxrwxrwx. 1 root root 11 Aug 14  2014 S99local -> ../rc.local
```

每个连接都是 K 或 S 开头，后面跟数字，具体意义是，S表示(Start)，K表示(Kill)，数字表示启动顺序，系统启动或关闭的时候，会根据顺序执行，并附带 start or stop 参数。

解决上面不能随系统启动的问题

```
ln -s /etc/init.d/tomcat S99tomcat
ln -s /etc/init.d/tomcat K99tomcat
```

### Nginx

/usr/local/nginx-1.11.3

```
cd ~/setup
tar xzvf nginx-1.11.3.tar.gz
cd nginx-1.11.3

yum -y install pcre-devel
yum -y install openssl openssl-devel

# 做了些调整，修改一些存储位置
./configure --prefix=/usr/local/nginx-1.11.3 --sbin-path=/usr/local/nginx-1.11.3/ --pid-path=/usr/local/nginx-1.11.3/nginx.pid

make
make install

# 创建nginx用户，但不创建用户目录
useradd -M nginx
chown -R nginx: /usr/local/nginx-1.11.3

vi /usr/local/nginx-1.11.3/conf/nginx.conf
# 添加或修改下面内容
user nginx;
worker_processes 2;

```

nginx 操作

```
cd /usr/local/nginx-1.11.3

# 启动
./nginx
# 快速关闭
./nginx -s stop
# 正常关闭
./nginx -s quit
# 测试配置信息是否有错误
./nginx -t
# 重载配置
./nginx -s reload
# 重新打开日志文件
./nginx -s reopen

# 信号量的方式

kill -INT `cat /usr/local/nginx-1.11.3/nginx.pid`

# TERM,INT : Quick shutdown，立即关闭进程，不管他有没有在处理请求；
# QUIT : Graceful shutdown, 优雅的关闭进程，也就是等到该进程处理的请求都完成之后才关闭；
# HUP : Configuration reload, start the new worker processes with a new configuration. Gracefully shutdown the old worker processes.
# USR1 : Reopen the log files, 重新打开日志文件，在备份日志按月/日分割日志时用；
# USR2 : Upgrade Executable on the fly, 平滑的升级；
# WINCH : Gracefully shutdown the worker processes, 优雅的关闭旧的进程（配合USR2来进行升级）;

sudo kill -QUIT `cat /usr/local/nginx-1.11.3/nginx.pid`
sudo kill -HUP `cat /usr/local/nginx-1.11.3/nginx.pid`
```

跟随系统启动

```
//TODO
```
