<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<div class="container" style="width: 60%;">

		<div
			class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-light border-bottom box-shadow">

			<nav class="my-2 my-md-0 mr-md-3">
				<a class="btn btn-outline-primary" href="home.do">home</a> 글쓰기
			</nav>

		</div>


		<form:form action="boardw.do" class="form-control" method="post" modelAttribute="vo">
	글번호 : <form:input type="text" class="form-control" id="brd_insert_no" path="brd_no" />	
	글제목 : <form:input type="text" class="form-control" path="brd_title" />			
	글내용 : <form:textarea rows="6" class="form-control" path="brd_content"></form:textarea>			
	작성자 : <form:input type="text" class="form-control" path="brd_writer" id="brd_insert_writer" value="${sessionScope.SID}" />

			<input type="submit" class="btn btn-primary" value="글쓰기" />
		
		<hr />
		<%-- <form:select path="slist" items="${slist}" />
		<form:select path="slistary" items="${slistary}" />
		
		<hr />
		<form:checkboxes path="slist" items="${slist}"/>
		<form:radiobuttons path="slistary" items="${slistary}"/> --%>
		
		</form:form>


	</div>

	<script>
		$(function() {
			document.getElementById('brd_insert_no').readOnly = true;
			document.getElementById('brd_insert_writer').readOnly = true;
		})
	</script>
</body>

</html>