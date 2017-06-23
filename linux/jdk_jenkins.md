# JDK & Jenkins

## JDK

解压 jdk-8u60-linux-x64.gz 到指定目录

tar zxvf jdk-8u60-linux-x64.gz

配置环境变量 /etc/profile

在最后加入：

```
export JAVA_HOME=/app/jdk1.8.0_60
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin
```

输入source /etc/profile

## Jenkins

```
#To use this repository, run the following command:

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum install jenkins

sudo yum remove jenkins

# 启动

# 提示用下面的命令
sudo service jenkins start

# 启动失败，根据提示查看错误信息，提示没有/usr/bin/java，打开jenkins配置文件后，配置一下就行了，JENKINS_JAVA_CMD="/usr/local/java/jdk1.8.0_131/bin/java"

vi /etc/rc.d/init.d/jenkins

sudo systemctl start jenkins.service
sudo systemctl stop jenkins.service
sudo systemctl status jenkins.service

# 安装目录和配置
/usr/lib/jenkins/
/etc/sysconfig/jenkins
/var/lib/jenkins/


```


log

/var/log/jenkins/jenkins.log

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

6956d94e50b8450e9889d496173b281e

This may also be found at: /var/lib/jenkins/secrets/initialAdminPassword
