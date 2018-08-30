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
<<<<<<< HEAD

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
=======
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/home.css">
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="resources/style.css?var=3">

<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<script src="resources/js/jquery-3.2.1.js"></script>
<!-- Material Design Lite -->
<script src="resources/js/slick.min.js"></script>
<!-- Bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("figure").mouseleave(function() {
			$(this).removeClass("hover");
			$(this).toggleClass('share-expanded');
			$(".ico").css('opacity', '0.7');
		});
		

	    $('.card__share > a').on('click', function(e){ 
	        e.preventDefault() // prevent default action - hash doesn't appear in url
	        $(this).parent().find( 'div' ).toggleClass( 'card__social--active' );
	        $(this).toggleClass('share-expanded');
	    });
	    
	 /*    $('.intro').on('click', function(e) {
	    	alert("!!!!");
			alert($(this).attr("id"));
		})
		*/
	    $('.seatshow').on('click', function(e) {
	    	var id=$(this).attr("id");
	    	window.open(
	    			'homeshowseat1.do?show_no='+id, '_blank', 
	    			'width=800, height=755, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no'
	    			);
		}); 
	    
	});
</script>
<body>
	<div class="hero-area">
		<figure class="snip0029">
			<!-- Hero Slides Area -->
			<div class="hero-slides owl-carousel">

				<!-- Single Slide  ${FileName}${list.show_img1} -->
				<c:forEach var="list" items="${ssplList}" varStatus="status">
					<div class="container h-100">
						<div class="row h-100 align-items-center">
							<div class="col-12">
								<div class="slide-content text-center">
									
										<!-- card -->
										<div class="card radius shadowDepth1">
											<div class="card__image border-tlr-radius" style="position: relative; z-index: 1;">
												<img src="homeimgtitle.do?show_no=${list.show_no}&idx=2"
													alt="image" class="single-hero-slide bg-img" class="img-thumbnail">
											</div>

											<div class="card__content card__padding"
											style="position: relative; z-index: 2;">
												<div class="card__share">
													<div class="card__social">
														<a class="share-icon facebook intro" href="homeseatintro.do?show_no=${list.show_no}">자세히</a> 
														<button class="share-icon twitter seatshow" id="${list.show_no}" >예약</button> 
												</div>

													<a id="share" class="share-toggle share-icon order-first" href="#"></a>
												</div>

												<div class="card__meta">
													${list.show_id_name}
													<a href="#"><time>${list.show_title}</time></a>
												</div>

												<article class="card__article">
													<h5>
														<c:out value="${fn:substring(list.show_startdate,0,13)}"/>시
														~<c:out value="${fn:substring(list.show_enddate,0,13)}"/>시
													</h5>

													<p>
													${fn:replace(list.show_content, newLineChar, "<br />")}
													</p>
												</article>
											</div>

											<div class="card__action">

												<div class="card__author">
													<div class="card__author-content">
														By <a href="#">John Doe</a>
													</div>
												</div>
											</div>
										</div>
										<!-- card end -->
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
			</div>
		</figure>
	</div>
		<%-- 	<div class="single-hero-slide bg-img"
				style="background-image: url(homeimgtitle.do?show_no=${list.show_no}&idx=1);">
				<div class="container h-100">
					<div class="row h-100 align-items-center">
						<div class="col-12">
							<div class="slide-content text-center">
								<div class="post-tag">
									<a href="#" data-animation="fadeInUp">자세히보기..</a>
								</div>
								<h2 data-animation="fadeInUp" data-delay="250ms">
									<a href="#">${list.show_title}</a>
								</h2>
							</div>
						</div>
					</div>
				</div> </div>--%>

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
>>>>>>> refs/remotes/origin/master
</body>
</html>

