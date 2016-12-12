# Nginx 日志文件切割

> ...

```

偶然发现access.log有21G大，所以将其切割。

Nginx 是一个非常轻量的 Web 服务器，体积小、性能高、速度快等诸多优点。但不足的是也存在缺点，比如其产生的访问日志文件一直就是一个，不会自动地进行切割，如果访问量很大的话，将 导致日志文件容量非常大，不便于管理。当然了，我们也不希望看到这么庞大的一个访问日志文件，那需要手动对这个文件进行切割。

在 Linux 平台上 Shell 脚本丰富，使用 Shell 脚本加 crontab 命令能非常方便地进行切割，但在 Windows 平台上就麻烦一些了，刚才弄了好长时间，就在这里记录整理一下。

日志文件切割要求

由于 Nginx 的日志都是写在一个文件当中的，因此，我们需要每天零点将前一天的日志存为另外一个文件，这里我们就将 Nginx 位于 logs 目录中的 access.log 存为 access_[yyyy-MM-dd].log 的文件。其实 logs 目录中还有个 error.log 的错误日志文件，这个文件也需要每天切割一个，在这里就说 access.log 了，error.log 的切割方法类似。

Linux 平台切割

在 Linux 平台上进行切割，需要使用 date 命令以获得昨天的日期、使用 kill 命令向 Nginx 进程发送重新打开日志文件的信号，以及 crontab 设置执行任务周期。

先创建一个 Shell 脚本，如下：


Shell代码  
#!/bin/bash
## 零点执行该脚本
## Nginx 日志文件所在的目录
LOGS_PATH=/usr/local/nginx/logs
## 获取昨天的 yyyy-MM-dd
YESTERDAY=$(date -d ”yesterday” +%Y-%m-%d)
## 移动文件
mv ${LOGS_PATH}/access.log ${LOGS_PATH}/access_${YESTERDAY}.log
## 向 Nginx 主进程发送 USR1 信号。USR1 信号是重新打开日志文件
kill -USR1 $(cat /usr/local/nginx/nginx.pid)
#!/bin/bash
## 零点执行该脚本
## Nginx 日志文件所在的目录
LOGS_PATH=/usr/local/nginx/logs
## 获取昨天的 yyyy-MM-dd
YESTERDAY=$(date -d "yesterday" +%Y-%m-%d)
## 移动文件
mv ${LOGS_PATH}/access.log ${LOGS_PATH}/access_${YESTERDAY}.log
## 向 Nginx 主进程发送 USR1 信号。USR1 信号是重新打开日志文件
kill -USR1 $(cat /usr/local/nginx/nginx.pid)
上面这个脚本中的最后一行必须向 Nginx 的进程发送 USR1 信号以重新打开日志文件，如果不写的话，Nginx 会继续将日志信息写入 access_[yyyy-MM-dd].log 的那个文件中，这显然是不正确的。

脚本完成后将其存入 Nginx 安装目录的 sbin 中，取名为 cut-log.sh，之后使用 crontab -e 新增一个定时任务，在其中增加执行这个脚本：

Shell代码  
0 0 * * * /bin/bash /usr/local/nginx/sbin/cut-log.sh
0 0 * * * /bin/bash /usr/local/nginx/sbin/cut-log.sh
到这里 Linux 下切割 Nginx 日志就完成了，可以将 crontab 设置为距当前时较近的时间测试一下，否则在零点出问题就不好了 。




Windows 平台切割

要在 Windows 平台上做这件事情就有点麻烦了。在 Windows 中没有原生的命令能够获得昨天的日期，Windows 中的计划任务设置我感觉也没有 Linux 的 crontab 用得方便，再有批处理命令也没有 Shell 脚本功能强大。总之，逐一来解决这些问题吧。

新浪博客上有一篇文章 nginx for windows日志切割，但这篇文章有两个不足之处：切割后的日志文件不是以昨天的日期命名；需要停止 Nginx 服务。为了切割日志停止服务，我认为有所不值，如果访问量较小的话问题不大，但是访问量较大的话这种做法是非常不可取的。为了弥补这些缺陷，我们对这个批处理文件进行了改进。

要 Windows 平台上使用 Linux 的 date 命令以获得昨天的日期，我们可以到 SourceForge上去下载 UnxUtils这 个工具。UnxUtils 是个非常强大的工具集，将大多数的 Linux 命令都移植到 Windows 平台上来了，比如：ls, grep, wc 等等 120 个命令，当然了其中也包括了我们需要的 date 工具。将这个工具解压到一个目录中，假定是 d:\common-path\UnxUtils 目录中，将那些工具所在的 d:\common-path\UnxUtils\usr\local\wbin 添加到系统的环境变量 PATH 中，可以加到最后去。由于 Windows 平台中有 date 内置命令，因此需要将 UnxUtils 的 date.exe 改名为其他的，比如改为 udate.exe。用 cmd 打开控制台，输入：

D:\>udate -d "yesterday" +%Y-%m-%d
2010-05-31
D:\>_
如果能正确输出昨天日期的话，那么这一点我们就搞定了 。

接下来需要写一个批处理文件，假定我们的 Nginx 是放在 d:\httpServer\nginx-0.7.64 目录中的，我们就在这个目录中建一个 cut-log.bat 的文件：

Batch代码  
@echo off
rem  获取昨天的日期，存入 YESTERDAY 变量，udate 参数中的 % 需要改成 %% 进行转义
for /f %%a in (‘udate -d ”yesterday” +%%Y-%%m-%%d’) do set YESTERDAY=%%a
rem 设置 Nginx 位于的盘符
set NGINX_DRIVER=d:
rem 设置 Nginx 的主目录
set NGINX_PATH=%NGINX_DRIVER%\green\httpServer\nginx-0.7.64
rem 设置 Nginx 的日志目录
set LOG_PATH=%NGINX_PATH%\logs
rem 移动文件
move %LOG_PATH%\access.log %LOG_PATH%\access_%YESTERDAY%.log
rem 切换到 Nginx 所在的盘符
%NGINX_DRIVER%
rem 进入 Nginx 的主目录
cd %NGINX_PATH%
rem 向 nginx 发送 reopen 信号以重新打开日志文件，功能与 Linux 平台中的 kill -USR1 一致
nginx -s reopen
echo on
@echo off
rem  获取昨天的日期，存入 YESTERDAY 变量，udate 参数中的 % 需要改成 %% 进行转义
for /f %%a in ('udate -d "yesterday" +%%Y-%%m-%%d') do set YESTERDAY=%%a
rem 设置 Nginx 位于的盘符
set NGINX_DRIVER=d:
rem 设置 Nginx 的主目录
set NGINX_PATH=%NGINX_DRIVER%\green\httpServer\nginx-0.7.64
rem 设置 Nginx 的日志目录
set LOG_PATH=%NGINX_PATH%\logs
rem 移动文件
move %LOG_PATH%\access.log %LOG_PATH%\access_%YESTERDAY%.log
rem 切换到 Nginx 所在的盘符
%NGINX_DRIVER%
rem 进入 Nginx 的主目录
cd %NGINX_PATH%
rem 向 nginx 发送 reopen 信号以重新打开日志文件，功能与 Linux 平台中的 kill -USR1 一致
nginx -s reopen
echo on
这个批处理写好后，将其加入 Windows 的计划任务中，设置为每天零时执行。需要注意的是，在执行 nginx -s reopen 命令时，当前目录必须位于 Nginx 的主目录中，否则会找不到日志文件在哪个目录中（估计 Nginx 默认采用相对路径寻找），这也就是批处理中需要进入盘符和 Nginx 主目录的原因了，因为任务计划执行时并不是在 Nginx 的主目录中。

结束语

这里主要介绍了一下 Linux 平台和 Windows 平台上切割 Nginx 日志文件的方法。Linux 中可以直接使用一些内置的命令完成，而在 Windows 中需要装载 UnxUtils 工具，不过这个工具集非常有用，比如使用其中的 tail 命令，我们在 Windows 中也能很方便地在控制台中使用 tail -f 实时地查看日志文件的输出。

更多参考

需要了解更多在 Linux 中使用 kill 命令向 Nginx 进程发送其他信号，以及该信号的意义可以参考 Nginx 中文 Wiki 上的 运行和控制 Nginx – 命令行参数和信号 这篇中文文档。
Windows 平台使用 nginx -s 命令向 Nginx 主进程发送各种信号，以及该信号的意义可以在 安装Nginx 一文的最后找到。

```