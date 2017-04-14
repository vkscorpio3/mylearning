var http = require('http');
//var querystring = require('querystring');
var request = require('request');

var dingding_robot_url = 'https://oapi.dingtalk.com/robot/send?access_token=f7f2cd32431d4fac277c519f366cc90556be7639a690760d2b00ff3c53d39bf2';
 
http.createServer(function (req, res) {
	
	var body = '';
	
	req.on( 'data' , function ( chunk ) { body += chunk; });
	
	req.on('end', function () {
		// 解析参数
		
		//console.log(body);
		
		var j = JSON.parse(body);
		
		var repo_name = j.repository.name;
		var user_name = j.user_name;
		
		console.log(repo_name);
		console.log(user_name);
		
		// 设置响应头部信息及编码
		res.writeHead( 200, { 'Content-Type': 'text/html; charset=utf8' });
			
		request({
			url: dingding_robot_url,
			method: 'POST',
			json: true,
			headers: { 'content-type': 'application/json'},
			body: {
				msgtype:'text',
				text: {
					content: user_name + '，刚刚push了新代码到仓库' + repo_name + '，请小伙伴们及时pull。'
				},
				at: {
					isAtAll:false,
					atMobiles:['13604117976', '18252151125', '15840906009', '13898447253', '13265555615']
				}
			}
		});

		res.end();

	});
}).listen(3000);

console.log('Server running at http://127.0.0.1:3000/'); 
