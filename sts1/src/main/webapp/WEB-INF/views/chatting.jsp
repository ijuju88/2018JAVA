<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실시간 채팅</title>
</head>


<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/js/sockjs.min.js"></script>
<script src="resources/js/sockjs.js"></script>

<body>
	<div class="container">
		<div class="form-inline">
			<input type="text" id="txt_msg" class="from-control" placeholder="보낼 메세지"/>
			<input type="button" id="btn_send" class="btn btn-primary" value="전송">
		</div>	
		<div id="output" style="width:100%; height: 500px; overflow:scroll; border: 1px solid #ccc;">
			
		</div>
	</div>
	
	<script>
	$(document).ready(function(){
		var host = "ws://192.168.0.238:8080/sts7/wsserver.do";
		var socket = new WebSocket(host);
		  
		socket.onopen = function(){
			//서버 접속시
			console.log('접속');
		};
		
		socket.onmessage = function(msg){
			//서버에서 메시지가 올경우 
			$('#output').prepend(msg.data+"<br />");
		};
		  
		socket.onclose = function(){
			//서버 접속 종료시
		};
		
		$('#btn_send').click(function(){
			var msg =  $('#txt_msg').val();
			socket.send(msg);
		});
		
		$('#txt_msg').keyup(function(event){
			if(event.which ==13){
				var msg =  $('#txt_msg').val();
				socket.send(msg);
				$('#txt_msg').val('');
			}
		});



	});
	</script>
</body>

</html>