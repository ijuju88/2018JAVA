<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page session="false"%>
<html>
<head>
<title>관리자페이지</title>
</head>



<link rel="stylesheet" href="resources/css/dashboard.css">
<!-- Icons -->
<script src="resources/js/feather.min.js"></script>


<link rel="stylesheet" href="resources/css/bootstrap.min.css?var=2">
<script src="resources/js/jquery-3.2.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js?var=2"></script>
<script src="resources/js/bootstrap.min.js"></script>

<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
<body>
</div>
	<h1 class="h2">회원관리</h1>
	<div class="table-responsive">
		<table class="table table-striped table-sm">
			<thead align="center">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>나이</th>
					<th>이메일주소</th>
					<th>가입일</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody align="center">
				<tr>
					<c:if test="${empty list1}">
						<td colspan="6">내용없음!!</td>
				</tr>
				</c:if>
				<c:if test="${! empty list1}">
					<c:forEach var="mDAO" items="${list1}">
						<td>${mDAO.mem_id}</td>
						<td>${mDAO.mem_name}</td>
						<td>${mDAO.mem_age}</td>
						<td>${mDAO.mem_email}</td>
						<td>${mDAO.mem_date}</td>
						<td><a href="#" class="btn btn-sm btn-outline-secondary">차단</a>
							<a href="#" class="btn btn-sm btn-outline-secondary">삭제</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</div>
</body>

</html>