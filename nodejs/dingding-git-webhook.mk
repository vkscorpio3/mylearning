# NodeJS

> 钉钉机器人，git.oschina.net


```
D:\NodeJS\git.oschina.net>node -v
v4.6.0

D:\NodeJS\git.oschina.net>npm -v
2.15.9
```

```
var http = require('http');  
  
http.createServer(function (request, response) {  
  
    // 发送 HTTP 头部   
    // HTTP 状态值: 200 : OK  
    // 内容类型: text/plain  
    response.writeHead(200, {'Content-Type': 'text/plain'});  
  
    // 发送响应数据 "Hello World"  
    response.end('Hello World\n');  
}).listen(8888);  
  
// 终端打印如下信息  
console.log('Server running at http://127.0.0.1:8888/');
```

```
D:\NodeJS\git.oschina.net>node helloworld.js
Server running at http://127.0.0.1:8888/
```