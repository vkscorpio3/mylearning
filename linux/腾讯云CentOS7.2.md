# 腾讯云CentOS7.2

## 系统版本查看

```
cat /etc/redhat-release

uname -r
```

## 安装NodeJS

```
yum install -y nodejs

node -v
#v6.10.1

npm -v
#3.10.10

npm install pm2 -g
```

## 安装Docker

```
yum -y install docker

docker -v

#centos 6.x ,ubuntu 14.x
sudo service docker start

#centos 7.x ,ubuntu 15.x
sudo systemctl start docker
```
