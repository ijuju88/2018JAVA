<!-- https://getbootstrap.com/docs/4.1/examples/sign-in/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/signin.css">

</head>
<body class="text-center">
	<form class="form-signin" action="login.do" method="post">
		<img class="mb-4" src="resources/img/ajax-loader.gif" width="72"
			height="72" />
		<h1 class="h3 mb-3 font-weight-normal">로그인</h1>

		<input type="text" class="form-control" placeholder="아이디 입력" name="id"
			autofocus required oninvalid="this.setCustomValidity('아이디를 입력하세요.')"
			oninput="setCustomValidity('')" /> <input type="password"
			class="form-control" placeholder="암호 입력" required name="pw"
			oninvalid="this.setCustomValidity('암호를 입력하세요')"
			oninput="setCustomValidity('')" />

		<div class="checkbox mb-3">
			<label><input type="checkbox" />아이디/암호저장</label>
		</div>
		<input type="submit" class="btn btn-lg btn-primary btn-block"
			value="로그인" />
		<p class="mt-5 mb-3 text-muted">&copy; 2018 ds class603.</p>

	</form>
</body>
</html>