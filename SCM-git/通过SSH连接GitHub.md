# 通过SSH连接GitHub

> ...

## 配置用户名和邮件地址

> --global参数是全局参数，也就是这些命令在这台电脑的所有Git仓库下都有用，如果不加，那只针对当前的仓库起作用。

```
git config --global user.name "Your Name"
git config --global user.email you@example.com
```

## 创建SSH密钥

##### 1
ssh-keygen -t rsa -C "you@example.com"
##### 2
按回车保存到默认位置，再稍等出来提示输入密码短语，输完按回车要输两遍；它用来加密私钥，也就是以后使用私钥的时候要输这个密码；
##### 3
稍等出来提示成功，密钥存放在自己主文件夹的.ssh文件夹中
##### 4
打开文件管理器，显示隐藏文件后，可以看到这个文件夹中有两个文件，一个私钥一个公钥，把这个文件夹备份一下.id_rsa 是密钥 ，id_rsa.pub是公钥。

## 同时管理多个ssh私钥

##### 1
首先，在新增私钥的时候，通过指定不同的文件名来生成不同的私钥文件
```
ssh-keygen -t rsa -f ~/.ssh/id_rsa.work -C "Key for Work"
ssh-keygen -t rsa -f ~/.ssh/id_rsa.github -C "Key for GitHub"
```

##### 2
> 新增ssh的配置文件，如果是linux需要注意权限

~/.ssh/config

##### 3
修改config文件的内容
```
Host *.workdomain.com
    IdentityFile ~/.ssh/id_rsa.work
 
Host github.com www.github.com
    IdentityFile ~/.ssh/id_rsa.github
```

## GitHub配置
[https://github.com/settings/ssh](https://github.com/settings/ssh)

> 添加SSH Key即可，拷贝.pub文件中的内容。

## 修改远程库的地址为ssh