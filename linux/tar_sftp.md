# Tar & Sftp

## tar
--------------------------------------------------

tar [-cxtzjvfpPN] 文件与目录

* -c 简历压缩文件 create
* -x 解压文件参数命令
* -t 查看tarfile里的文件

以上3个不能同时使用，不可能同时做这些操作。

* -z 是否需要用gzip解压缩
* -j 是否需要用bzip2解压缩
* -v 压缩过程中显示文件，这个常用，但不建议用在后台执行过程
* -f 使用文件名，请注意，在f之后要立即接文件名。不要再加参数。

示例： 
tar -zcvfP tfile sfile 错误写法
tar -zcvPf tfile sfile 正确写法

* -p 使用原文件的原来属性
* -P 可以使用绝对路径来压缩
* -N 比后面接的日期(yyyy/mm/dd)还要新的才会被打包进新建的文件中。
* --exclude  File 压缩过程中，排除File

### 范例

##### 范例一，打包，压缩

tar -cvf /tmp/ect.tar /etc 仅打包
tar -zcvf /tmp/ect.tar.gz /etc 打包后，以gzip压缩
tar -jcvf /tmp/ect.tar /etc 打包后，以bzip2压缩

##### 范例二，查看
##### 范例三，解压缩
##### 范例四，解压缩一部分
##### 范例五，备份，并保存权限
##### 范例六，根据条件备份
##### 范例七，打包，压缩一部分
##### 范例八，打包后直接解压，不产生新文件

## sftp
--------------------------------------------------

帮助：man sftp

登录：sftp user@local

操作：cd ls 等均可用

获取文件：get [-P] remote-path [local-path]

退出：exit


## hybris 启动和停止
--------------------------------------------------

```
cd /xxx/platform
./hybrisserver.sh start
./hybrisserver.sh stop
```