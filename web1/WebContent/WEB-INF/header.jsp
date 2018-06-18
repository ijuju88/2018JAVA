<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" href="css/bootstrap.min.css?var=2">
<link rel="stylesheet" href="font/font.css?var=2" />

<script src="js/jquery-3.2.1.slim.min.js?var=2"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js?var=2"></script>
<script src="js/bootstrap.min.js?var=2"></script>

<!-- summernote설정용 -->
<link href="css/summernote-bs4.css?var=2" rel="stylesheet">
<script src="js/summernote-bs4.js?var=2"></script>

<script src="css/lang/summernote-ko-KR.js?var=2"></script>

<!-- 알림창용 sweetalert2 -->
<!-- https://sweetalert2.github.io/ -->
<script src="js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">

<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!-- 세션정보 가지고오기 -->
<% 
	HttpSession httpsession=request.getSession();
	String id=(String)httpsession.getAttribute("SID");
	String name=(String)httpsession.getAttribute("SNAME");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link disabled"
				href="index.do" style="color: #fff">홈 <span class="sr-only">(current)</span></a>
			</li>

			<% if(id == null){ %>

			<li class="nav-item"><a class="nav-link" href="login.do"
				style="color: #fff">로그인</a></li>
			
			<li class="nav-item"><a class="nav-link" href="join.do"
				style="color: #fff">회원가입</a></li>
		
			<%}else{ %>
			<li class="nav-item"><a class="nav-link" href="logout.do"
				style="color: #fff"><%=name %>님 로그아웃</a></li>

			<li class="nav-item"><a class="nav-link" href="join.do"
				style="color: #fff">회원수정</a></li>
			<%} %>


			<li class="nav-item"><a class="nav-link" href="boardlist.do"
				style="color: #fff">게시판</a></li>
		</ul>
	</div>
</nav>