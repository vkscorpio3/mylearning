# CentOS 添加用户和设置权限

## 添加用户

```
#adduser tommy  //添加一个名为tommy的用户

#passwd tommy   //修改密码
Changing password for user tommy.

New UNIX password:     //在这里输入新密码
Retype new UNIX password:  //再次输入新密码
passwd: all authentication tokens updated successfully.
```


## 设置权限（赋予root权限 ）

### 方法一：

> 修改 /etc/sudoers 文件，找到下面一行，把前面的注释（#）去掉

```
## Allows people in group wheel to run all commands
%wheel    ALL=(ALL)    ALL

然后修改用户，使其属于root组（wheel），命令如下：

#usermod -g root tommy

```

### 方法二：

> 修改 /etc/sudoers 文件，找到下面一行，在root下面添加一行，如下所示：

```
## Allow root to run any commands anywhere
root    ALL=(ALL)     ALL
tommy   ALL=(ALL)     ALL

# 使用 sudo 免输密码
tommy   ALL=(ALL) NOPASSWD:     ALL
```
