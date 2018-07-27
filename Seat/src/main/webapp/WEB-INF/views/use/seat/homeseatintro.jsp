<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>
<html>
</head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/home.css">
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="resources/style.css?var=4">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<script src="resources/js/jquery-3.2.1.js"></script>
<!-- Material Design Lite -->
<script src="resources/js/slick.min.js"></script>
<!-- Bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(function() {

	});
</script>
<body>
	<jsp:include page="../home/hometitle.jsp"></jsp:include>

	<!-- ##### Single Blog Area Start ##### -->
	<div class="single-blog-wrapper section-padding-0-100">

		<!-- Single Blog Area  -->
		<div class="single-blog-area blog-style-2 mb-50">
			<div class="single-blog-thumbnail">
				<img src="homeimgtitle.do?show_no=${ssplVO.show_no}&idx=1" alt="">
				<div class="post-tag-content">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="post-date">
									<a>
										${fn:substring(ssplVO.show_startdate,5,7)}월&nbsp;${fn:substring(ssplVO.show_startdate,8,10)}일
										<span>${fn:substring(ssplVO.show_startdate,10,16)} </span>
									</a><br /> <a>
										${fn:substring(ssplVO.show_enddate,5,7)}월&nbsp;${fn:substring(ssplVO.show_enddate,8,10)}일
										<span>${fn:substring(ssplVO.show_enddate,10,16)} </span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<!-- ##### Post Content Area ##### -->
				<div class="col">
					<!-- Single Blog Area  -->
					<div class="single-blog-area blog-style-2 mb-50">
						<!-- Blog Content -->
						<div class="single-blog-content">
							<div class="line"></div>
							<a href="#" class="post-tag">${ssplVO.show_id_name}</a>
							<h4>
								<a href="#" class="post-headline mb-0">${ssplVO.show_title}</a>
							</h4>
							<div class="post-meta mb-50">
								<p>
									By <a href="#">james smith</a>
								</p>
								<p>3 comments</p>
							</div>

							<p>${fn:replace(ssplVO.show_content, newLineChar, "<br />")}

							</p>

							<div class="row">
								<div class="col">
									<div class="form-control" style="margin: auto;">
										<img src="homeimgtitle.do?show_no=${ssplVO.show_no}&idx=2" 
										height="50%" alt="">
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ##### Instagram Feed Area Start ##### -->
	<!-- ##### Instagram Feed Area Start ##### -->
	<div class="instagram-feed-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="insta-title">
						<h5>Follow us @ Instagram</h5>
					</div>
				</div>
			</div>
		</div>
		<!-- Instagram Slides -->
		<div class="instagram-slides owl-carousel">
			<!-- Single Insta Feed -->
			<div class="single-insta-feed">
				<img src="resources/img/instagram-img/1.png" alt="">
				<!-- Hover Effects -->
				<div class="hover-effects">
					<a href="#"
						class="d-flex align-items-center justify-content-center"><i
						class="fa fa-instagram"></i></a>
				</div>
			</div>
			<!-- Single Insta Feed -->
			<div class="single-insta-feed">
				<img src="resources/img/instagram-img/2.png" alt="">
				<!-- Hover Effects -->
				<div class="hover-effects">
					<a href="#"
						class="d-flex align-items-center justify-content-center"><i
						class="fa fa-instagram"></i></a>
				</div>
			</div>
			<!-- Single Insta Feed -->
			<div class="single-insta-feed">
				<img src="resources/img/instagram-img/3.png" alt="">
				<!-- Hover Effects -->
				<div class="hover-effects">
					<a href="#"
						class="d-flex align-items-center justify-content-center"><i
						class="fa fa-instagram"></i></a>
				</div>
			</div>
			<!-- Single Insta Feed -->
			<div class="single-insta-feed">
				<img src="resources/img/instagram-img/4.png" alt="">
				<!-- Hover Effects -->
				<div class="hover-effects">
					<a href="#"
						class="d-flex align-items-center justify-content-center"><i
						class="fa fa-instagram"></i></a>
				</div>
			</div>
			<!-- Single Insta Feed -->
			<div class="single-insta-feed">
				<img src="resources/img/instagram-img/5.png" alt="">
				<!-- Hover Effects -->
				<div class="hover-effects">
					<a href="#"
						class="d-flex align-items-center justify-content-center"><i
						class="fa fa-instagram"></i></a>
				</div>
			</div>
			<!-- Single Insta Feed -->
			<div class="single-insta-feed">
				<img src="resources/img/instagram-img/6.png" alt="">
				<!-- Hover Effects -->
				<div class="hover-effects">
					<a href="#"
						class="d-flex align-items-center justify-content-center"><i
						class="fa fa-instagram"></i></a>
				</div>
			</div>
			<!-- Single Insta Feed -->
			<div class="single-insta-feed">
				<img src="resources/img/instagram-img/7.png" alt="">
				<!-- Hover Effects -->
				<div class="hover-effects">
					<a href="#"
						class="d-flex align-items-center justify-content-center"><i
						class="fa fa-instagram"></i></a>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Instagram Feed Area End ##### -->
	<jsp:include page="../home/homefooter.jsp"></jsp:include>
</body>
</html>

