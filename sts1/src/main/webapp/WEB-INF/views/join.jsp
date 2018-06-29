<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/edit.css">
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/jquery-3.2.1.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<body>
	<div class="container" style="width: 60%;">

		<div
			class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-light border-bottom box-shadow">

			<nav class="my-2 my-md-0 mr-md-3">
				<a class="btn btn-outline-primary" href="home.do">home</a> 회원가입
			</nav>

		</div>

		<form action="join.do" method="post">

			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-user"></i>
					</span>
				</div>
				<input name="id" class="form-control" placeholder="id" type="text">
			</div>

			<!--pw -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input class="form-control" placeholder="Create password"
					type="password" name="pw">
			</div>

			<!-- name -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-child"></i>
					</span>
				</div>
				<input name="name" class="form-control" placeholder="name"
					type="text">
			</div>

			<!-- age -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-user-clock"></i>
					</span>
				</div>
				<input name="age" class="form-control" placeholder="age"
					type="number" min="1" max="150" name="joinAge">
			</div>

			<!-- email -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-envelope"></i>
					</span>
				</div>
				<input name="email" class="form-control" placeholder="Email address"
					type="email">
			</div>

			<!-- form-group// -->
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="회원가입"
					id="btn_join"> <input type="reset"
					class="btn btn-primary btn-block" value="초기화">
			</div>
		</form>
	</div>
</body>

</html>