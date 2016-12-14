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
