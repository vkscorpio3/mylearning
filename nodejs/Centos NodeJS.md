# Centos NodeJS

wget https://nodejs.org/dist/v4.6.2/node-v4.6.2-linux-x64.tar.gz

# tar && move

/usr/local/node-v4.6.2

vi /etc/profile

```
export NODE_HOME=/usr/local/node-v4.6.2
PATH=$PATH:$NODE_HOME/bin:$NODE_HOME/lib/node_modules
```

source /etc/profile