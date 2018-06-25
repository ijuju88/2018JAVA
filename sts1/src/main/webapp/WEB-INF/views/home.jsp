<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/bootstrap.js"></script>

<script src="resources/js/jquery-3.2.1.js"></script>

<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}.  하이</P>

<input type="button" class="btn btn-success" value="버튼"/>

<script>
$(function(){
	alert("TEST");
});

</script>

</body>
</html>
