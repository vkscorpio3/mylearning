# Setup Jdk & Ant

## 下载：
- jdk-7u79-macosx-x64.dmg
- apache-ant-1.9.1.zip

## 安装：
jdk因为是dmg格式直接双击然后跟着提示下一步就可以了。
ant 拷贝到想放的目录后 命令行里 unzip apache-ant-1.9.1.zip 解压就OK了。
[我的ant是hybris里面带的，所以路径会有些不同]

## 配置：
环境变量可以在好几个地方配置，具体还没时间研究，我用的是在用户目录下创建或者修改 ~/.bash_profile

打开文件：vi ~/.bash_profile [命令行里打开文件，如果没有保存的时候会自动创建]
编辑文件：里面配置需要的环境变量
编译文件：source ~/.bash_profile [完成后，执行让配置生效]

###我的配置文件内容如下:
```
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export ANT_HOME=/Users/Wen/Dev/hybris-5.4/bin/platform/apache-ant-1.9.1
export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH
```
Remark：和Windows的区别，分号变成了冒号；%JAVA_HOME%变成了$JAVA_HOME


## 检查：
- java -version
- ant -version