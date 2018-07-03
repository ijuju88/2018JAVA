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
			<input type="text" class="from-control" placeholder="보낼 메세지"/>
			<input type="button" class="btn btn-primary" value="전송">
		</div>	
		<div style="width:100%; height: 500px; border: 1px solid #ccc;">
			
		</div>
	</div>
	
	<script>
	$(function() {
		//var host="ws://localhost:8088/sts1/chatting_server.do";
		var socket=socket = new SockJS("<c:url value="/chatting_server.do"/>");
		socket.onopen = onMessage;
		socket.onmessage = onMessage;
		socket.onclose = onClose;
		
		function onMessage(evt){
			console.log(evt.data);
		};
		
		function onClose(){
			console.log('종료');
		};
		
		$(function(){

		});

	});
	</script>
</body>

</html>