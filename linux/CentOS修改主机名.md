# CentOS修改主机名

/etc/hosts

/etc/sysconfig/network


hostname itbulu



## CentOS 7

```
# hostnamectl set-hostname [new hostname]

修改完需要重启服务

#systemctl restart systemd-hostnamed

```
