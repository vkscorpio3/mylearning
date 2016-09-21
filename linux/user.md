# User

## 查看系统中已存在的用户

* 存储帐号的文件：/etc/passwd
* 存储密码的文件：/etc/shadow


## 添加用户

```
#adduser tommy
#passwd tommy
Changing password for user tommy.
New password:在这里输入新密码
Retype new password:再次输入新密码
passwd: all authentication tokens updated successfully.
```

## 授权

### 方法一： 修改/etc/sudoers 文件，找到下面一行，把前面的注释（#）去掉
```
## Allows people in group wheel to run all commands
 
%wheel ALL=(ALL) ALL
 
然后修改用户，使其属于root组（wheel），命令如下：
 
#usermod -g root tommy
```

修改完毕，现在可以用tommy帐号登录，然后用命令su – ，即可获得root权限进行操作。


### 方法二： 修改/etc/sudoers 文件，找到下面一行，在root下面添加一行，如下所示：

```
## Allow root to run any commands anywhere
 
root ALL=(ALL) ALL
 
tommy ALL=(ALL) ALL
```

修改完毕，现在可以用tommy帐号登录，然后用命令su – ，即可获得root权限进行操作。

### 方法三： 修改/etc/passwd 文件，找到如下行，把用户ID修改为0 ，如下所示：

```
tommy:x:500:500:tommy:/home/tommy:/bin/bash
 
修改后如下
 
tommy:x:0:500:tommy:/home/tommy:/bin/bash
```

保存，用tommy账户登录后，直接获取的就是root帐号的权限。
