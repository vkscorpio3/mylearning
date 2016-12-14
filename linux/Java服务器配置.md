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
```

启动失败了，没有读取到环境变量，直接在 /etc/init.d/tomcat 中头部添加：

```
export JAVA_HOME=/usr/local/jdk1.8

export TOMCAT_HOME=/usr/local/apache-tomcat-8

export CATALINA_HOME=$TOMCAT_HOME
export CATALINA_BASE=$CATALINA_HOME
export CATALINA_TMPDIR=$CATALINA_HOME/temp
```
