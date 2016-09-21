

查看目前系统的jdk:

rpm -qa | grep jdk

yum -y remove java-1.8.0-openjdk-1.8.0.91-0.b14.el6_7.x86_64


安装

下载

jdk-8u91-linux-x64.rpm

http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.rpm?AuthParam=1471838349_300ffda184750c2395c4936569467e0c

yum localinstall jdk-8u91-linux-x64.rpm -y

安装后在 /usr/java 目录中，里面有3个文件夹

```
lrwxrwxrwx 1 root root   16 May 25 17:43 default -> /usr/java/latest
drwxr-xr-x 9 root root 4096 May 25 17:43 jdk1.8.0_91
lrwxrwxrwx 1 root root   21 May 25 17:43 latest -> /usr/java/jdk1.8.0_91
```
