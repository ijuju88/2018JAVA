<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/font-awesome.css">
<script src="resources/js/bootstrap.js"></script>

<script src="resources/js/jquery-3.2.1.js"></script>
<body>
	<div class="container" style="width: 60%;">
		<form action="join.do" method="post">
			<input type="text" name="id" class="form-control" placeholder="id">
			<input type="password" name="pw" class="form-control"placeholder="pw"> 
			<input type="text" name="name" class="form-control" placeholder="name"> 
			<input type="number" class="form-control"  placeholder="나이" min="1" max="150" name="age">
			<input type="text"    class="form-control"  placeholder="이메일" name="email">
			
		<input type="submit" class="btn btn-success" value="회원가입" id="btn_join"> 
		<input type="reset" class="btn btn-success" value="초기화">
			
	</form>
	</div>
</body>

</html>