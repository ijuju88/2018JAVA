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

<body>
	<div class="hero-area">
		<figure class="snip0029">
			<!-- Hero Slides Area -->
			<div class="hero-slides owl-carousel">

			</div>
		</figure>
	</div>


	<!-- 중간 협찬?표시 -->
	<div class="logos-section" style="background-color: #b6b6b6; height: 150px; text-align: center; vertical-align: middle;">
		<div class="logos-wrap">
			<img
				src="https://uploads-ssl.webflow.com/5b7ca0cc9166b0decbac1e8d/5b7ca0cc9166b01f64ac1eaa_logo-facebook.png"
				width="41" class="customers-logo" style="margin-left: 50px;"/><img
				src="https://uploads-ssl.webflow.com/5b7ca0cc9166b0decbac1e8d/5b7ca0cc9166b00c73ac1eaf_logo-stripe.png"
				width="92" class="customers-logo" style="margin-left: 50px;"/><img
				src="https://uploads-ssl.webflow.com/5b7ca0cc9166b0decbac1e8d/5b7ca0cc9166b0e4aeac1eb2_logo-apple.png"
				width="34" class="customers-logo" style="margin-left: 50px;"/><img
				src="https://uploads-ssl.webflow.com/5b7ca0cc9166b0decbac1e8d/5b7ca0cc9166b06bf1ac1eb0_logo-fitbit.png"
				width="117" class="customers-logo" style="margin-left: 50px;"/><img
				src="https://uploads-ssl.webflow.com/5b7ca0cc9166b0decbac1e8d/5b7ca0cc9166b06213ac1eab_logo-buzzfeed.png"
				width="132" class="customers-logo" style="margin-left: 50px;"/><img
				src="https://uploads-ssl.webflow.com/5b7ca0cc9166b0decbac1e8d/5b7ca0cc9166b076ebac1eac_logo-sega.png"
				width="89" class="customers-logo" style="margin-left: 50px;"/><img
				src="https://uploads-ssl.webflow.com/5b7ca0cc9166b0decbac1e8d/5b7ca0cc9166b076b7ac1ead_logo-dropbox.png"
				width="46" class="customers-logo" style="margin-left: 50px;"/><img
				src="https://uploads-ssl.webflow.com/5b7ca0cc9166b0decbac1e8d/5b7ca0cc9166b0e49aac1eae_logo-google.png"
				width="113" class="customers-logo" style="margin-left: 50px;"/>
		</div>
	</div>

	<!-- 게시판 및 이벤트?소식넣기 -->


	<!-- ##### Blog Wrapper Start ##### -->
	<div class="blog-wrapper section-padding-100 clearfix">
		<div class="container">
			<div class="row align-items-end">
				<!-- Single Blog Area -->
				<div class="col-12 col-lg-4">
					<div class="single-blog-area clearfix mb-100">
						<!-- Blog Content -->
						<div class="single-blog-content">
							<div class="line"></div>
							<a href="#" class="post-tag">Lifestyle</a>
							<h4>
								<a href="#" class="post-headline">Welcome to this Lifestyle
									blog</a>
							</h4>
							<p>Curabitur venenatis efficitur lorem sed tempor. Integer
								aliquet tempor cursus. Nullam vestibulum convallis risus vel
								condimentum. Nullam auctor lorem in libero luctus, vel volutpat
								quam tincidunt. Morbi sodales, dolor id ultricies dictum</p>
							<a href="#" class="btn original-btn">Read More</a>
						</div>
					</div>
				</div>
				<!-- Single Blog Area -->
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-catagory-area clearfix mb-100">
						<img src="resources/img/blog-img/1.jpg" alt="">
						<!-- Catagory Title -->
						<div class="catagory-title">
							<a href="#">소개</a>
						</div>
					</div>
				</div>
				<!-- Single Blog Area -->
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-catagory-area clearfix mb-100">
						<img src="resources/img/blog-img/2.jpg" alt="">
						<!-- Catagory Title -->
						<div class="catagory-title">
							<a href="#">알림이</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-9">

					<!-- Single Blog Area  -->
					<div class="single-blog-area blog-style-2 mb-50 wow fadeInUp"
						data-wow-delay="0.2s" data-wow-duration="1000ms">
						<div class="row align-items-center">
							<div class="col-12 col-md-6">
								<div class="single-blog-thumbnail">
									<img src="resources/img/blog-img/3.jpg" alt="">
									<div class="post-date">
										<a href="#">12 <span>march</span></a>
									</div>
								</div>
							</div>
							<div class="col-12 col-md-6">
								<!-- Blog Content -->
								<div class="single-blog-content">
									<div class="line"></div>
									<a href="#" class="post-tag">Lifestyle</a>
									<h4>
										<a href="#" class="post-headline">Party people in the
											house</a>
									</h4>
									<p>Curabitur venenatis efficitur lorem sed tempor. Integer
										aliquet tempor cursus. Nullam vestibulum convallis risus vel
										condimentum. Nullam auctor lorem in libero luctus, vel
										volutpat quam tincidunt.</p>
									<div class="post-meta">
										<p>
											By <a href="#">james smith</a>
										</p>
										<p>3 comments</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

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
				<c:forEach var="list" items="${ssplList}" varStatus="status">
					<div class="single-insta-feed">
						<img src="homeimgtitle.do?show_no=${list.show_no}&idx=1" alt="">
						<!-- Hover Effects -->
						<div class="hover-effects">
							<a href="#"
								class="d-flex align-items-center justify-content-center"> <i
								class="fa fa-instagram"></i></a>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<!-- ##### Instagram Feed Area End ##### -->

	</div>
</body>
</html>

