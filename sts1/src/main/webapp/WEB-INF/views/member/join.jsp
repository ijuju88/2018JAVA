<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	<jsp:include page="../home/hometitle.jsp" />


	<div class="container" style="width: 60%;">

		<div
			class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-light border-bottom box-shadow">

			<nav class="my-2 my-md-0 mr-md-3">
				<a class="btn btn-outline-primary" href="home.do">home</a> 회원가입
			</nav>

		</div>

		<form:form action="join.do" method="post" modelAttribute="vo">
			<!-- id -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-user"></i>
					</span>
				</div>
				<form:input name="id" id="mem_id" class="form-control"
					placeholder="id" type="text" path="mem_id" />
			</div>

			<div class="form-group input-group">
				<span id="badge_mem_id"> </span>
			</div>

			<!--pw -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<form:input class="form-control" placeholder="Create password"
					type="password" name="pw" id="mem_pw" path="mem_pw" />
			</div>


			<!--pw1 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input class="form-control" placeholder="Create password"
					type="password" name="pw1" id="mem_pw1">
			</div>


			<div class="form-group input-group">
				<span id="badge_mem_pw"> </span>
			</div>

			<!-- name -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-child"></i>
					</span>
				</div>
				<form:input name="name" class="form-control" placeholder="name"
					type="text" id="mem_name" path="mem_name" />
			</div>

			<div class="form-group input-group">
				<span id="badge_mem_name"> </span>
			</div>

			<!-- age -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-user-clock"></i>
					</span>
				</div>
				<form:input name="age" class="form-control" placeholder="age"
					type="number" min="1" max="150" id="mem_age" path="mem_age" />
			</div>

			<div class="form-group input-group">
				<span id="badge_mem_age"> </span>
			</div>

			<!-- email -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-envelope"></i>
					</span>
				</div>
				<form:input name="email" class="form-control"
					placeholder="Email address" type="email" id="mem_email"
					path="mem_email" />

			</div>

			<div class="form-group input-group">
				<span id="badge_mem_email"> </span>
			</div>

			<div class="card">
				<div class="card-body">
					<c:forEach var="tmp" items="${nlist}">
						<form:checkbox path="mem_nl" value="${tmp}" />${tmp}&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</div>
			</div>
			</br>

			<!-- form-group// -->
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="회원가입"
					id="btn_join"> <input type="reset"
					class="btn btn-primary btn-block" value="초기화">
			</div>


		</form:form>




	</div>
	<jsp:include page="../home/homefooter.jsp" />
	<script>
		$(function() {
		

				//var re_id = /^[a-z0-9_-]{3,16}$/; // 아이디 검사식
				//var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
				//var re_name = /^[a-z]{3,16}$/; // 이름 검사식
				//var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
				//var re_url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/; // URL 검사식
				//var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식

				//$('#badge_mem_id').text('아이디를 입력하세요.');

			
			$('#btn_join').click(function(){
				//$('선택자').val()  => input type="" 
				//$('선택자').text()  => <p>가나다</p>
				var chk = true;
				
				$('#badge_mem_id').text('');
				$('#badge_mem_pw').text('');
				$('#badge_mem_pw1').text('');
				$('#badge_mem_name').text('');
				$('#badge_mem_age').text('');
				$('#badge_mem_email').text('');
				
				var id=$('#mem_id').val();
				var pw=$('#mem_pw').val();
				var pw1=$('#mem_pw1').val();
				var name=$('#mem_name').val();
				var age=$('#mem_age').val();
				var email=$('#mem_email').val();
				
				var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
				
				if(id.length < 1){
					$('#badge_mem_id').text('아이디를 입력하세요.');
					chk = false;
				}
				
				if(pw.length < 1){
					$('#badge_mem_pw').text('암호를 입력하세요.');
					chk = false;
				}
				
				if(pw1.length < 1){
					$('#badge_mem_pw1').text('암호확인을 입력하세요.');
					chk = false;
				}
				
				if(name.length < 1){
					$('#badge_mem_name').text('이름을 입력하세요.');
					chk = false;
				}
				
				if(age.length < 1){
					$('#badge_mem_age').text('나이를 입력하세요.');
					chk = false;
				}
				
				if(email.length < 1 || re_email.test(upw.val()) != true){
					$('#badge_mem_email').text('이메일을 입력하세요.');
					chk = false;
				}
				
				return chk;
			});

		});
	</script>
</body>

</html>