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
