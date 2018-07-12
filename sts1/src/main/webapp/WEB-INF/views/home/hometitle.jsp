<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>

 
<link href="resources/css/pricing.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<script src="resources/js/jquery-3.2.1.js"></script>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.slides.js"></script>
<script src="resources/js/holder.min.js"></script>

<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">


</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="home.do">Ge 마켓</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="home.do"> home
 			<span class="sr-only">(current)</span></a>
      </li>			 
		<c:choose>
			<c:when test="${sessionScope.SID eq null}">
						
				<li class="nav-item"><a class="nav-link" href="join.do">회원가입</a></li>
				<li class="nav-item"><a class="nav-link" href="mypage.do">나의쇼핑</a></li>
				<li class="nav-item"><a class="nav-link" href="cartlist.do">장바구니</a></li>

				<li class="nav-item"><a class="nav-link" class="btn btn-outline-primary" href="login.do">로그인</a></li>
				<li class="nav-item"><a class="nav-link" class="btn btn-outline-primary" href="admin.do?menu=0">관리자(임시)</a> </li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link" href="edit.do">회원수정</a></li>
					<li class="nav-item"><a class="nav-link" href="mypage.do">${sessionScope.SNAME}님의
								쇼핑</a></li>
					<li class="nav-item"><a class="nav-link" href="cartlist.do">장바구니</a></li>
					<li class="nav-item"><a class="nav-link" href="chatting.do">실시간채팅</a></li>
					<li class="nav-item"><a class="nav-link" id="board_chk"
							href="board.do">문의하기</a></li>

					<li class="nav-item"><a class="nav-link"
						class="btn btn-outline-primary" href="logout.do">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
							class="btn btn-outline-primary" href="admin.do?menu=0">관리자(임시)</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>

</body>
</html>