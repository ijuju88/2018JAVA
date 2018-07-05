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
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="admin.do?menu=0">관리자
			페이지</a>

		<!-- <input class="form-control form-control-dark w-100" type="text" 
		placeholder="Search" aria-label="Search"> -->

		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#">Sign
					out</a></li>
		</ul>
	</nav>

	<jsp:include page="admin/admin_sidemenu.jsp"></jsp:include>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<div
				class="d-flex justify-content-between 
			flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<c:choose>
					<c:when test="${param.menu==0 || param.menu eq null}">
						<jsp:include page="admin/admin_menu0.jsp"></jsp:include>
					</c:when>

					<c:when test="${param.menu==1}">
						<jsp:include page="admin/admin_menu1.jsp"></jsp:include>

					</c:when>
					<c:when test="${param.menu==2}">
						<jsp:include page="admin/admin_menu2.jsp"></jsp:include>
						
			</c:when> </c:choose> </main>
		</div>


	
</body>
</html>
