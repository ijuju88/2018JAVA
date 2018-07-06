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

<!-- Custom styles for this template -->
<link href="resources/css/pricing.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">


<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/js/jquery.slides.js"></script>
<script src="resources/js/holder.min.js"></script>
<script src="resources/js/bootstrap.js"></script>

</head>

<body>

	<div
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
		<h5 class="my-0 mr-md-auto font-weight-normal">Ge 마켓</h5>

		<c:choose>
			<c:when test="${sessionScope.SID eq null}">
				<nav class="my-2 my-md-0 mr-md-3">
					<a class="p-2 text-dark" href="join.do">회원가입</a> <a
						class="p-2 text-dark" href="mypage.do">나의쇼핑</a> <a
						class="p-2 text-dark" href="cart.do">장바구니</a>
				</nav>
				<a class="btn btn-outline-primary" href="login.do">로그인</a>
				<a class="btn btn-outline-primary" href="admin.do?menu=0">관리자(임시)</a>
			</c:when>
			<c:otherwise>
				<nav class="my-2 my-md-0 mr-md-3">
					<a class="p-2 text-dark" href="edit.do">회원수정</a> <a
						class="p-2 text-dark" href="mypage.do">${sessionScope.SNAME}님의
						쇼핑</a> <a class="p-2 text-dark" href="cart.do">장바구니</a> <a
						class="p-2 text-dark" href="chatting.do">실시간채팅</a> <a
						class="p-2 text-dark" id="board_chk" href="board.do" >문의하기</a>
				</nav>
				<a class="btn btn-outline-primary" href="logout.do">로그아웃</a>
				<a class="btn btn-outline-primary" href="admin.do?menu=0">관리자(임시)</a>
			</c:otherwise>
		</c:choose>

	</div>
	</body></html>