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

 
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<script src="resources/js/jquery-3.2.1.js"></script>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.slides.js"></script>
<script src="resources/js/holder.min.js"></script>

<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<body>
<a href="adminlogin.do">관리자</a>
<div class="container">
		<table class="table table-striped table-hover" id="tablepage">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="test" items="${list}" varStatus="status">
						<tr>
							<td>${test.no}</td>
							<td>${test.name}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
</div>
</body>
</html>
