<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- Preloader -->
	<div id="preloader">
		<div class="preload-content">
			<div id="original-load"></div>
		</div>
	</div>

	<!-- Subscribe Modal -->
	<div class="subscribe-newsletter-area">
		<div class="modal fade" id="subsModal" tabindex="-1" role="dialog"
			aria-labelledby="subsModal" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-body">
						<h5 class="title">Subscribe to my newsletter</h5>
						<form action="#" class="newsletterForm" method="post">
							<input type="email" name="email" id="subscribesForm2"
								placeholder="Your e-mail here">
							<button type="submit" class="btn original-btn">Subscribe</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">

		<!-- Top Header Area -->
		<div class="top-header">
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<!-- Breaking News Area -->
					<div class="col-12 col-sm-8">
						<div class="breaking-news-area">
							<div id="breakingNewsTicker" class="ticker">
								<ul>
									<li><a href="#">Hello World!</a></li>
									<li><a href="#">Hello Universe!</a></li>
									<li><a href="#">Hello Original!</a></li>
									<li><a href="#">Hello Earth!</a></li>
									<li><a href="#">Hello Colorlib!</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- Top Social Area -->
					<div class="col-12 col-sm-4">
						<div class="top-social-area">
							<a href="#" data-toggle="tooltip" data-placement="bottom" title="Pinterest">
								<i class="fa fa-pinterest" aria-hidden="true"></i></a> 
							<a href="#" data-toggle="tooltip" data-placement="bottom" title="Facebook">
								<i class="fa fa-facebook" aria-hidden="true"></i></a> 
							<a href="#" data-toggle="tooltip" data-placement="bottom" title="Twitter">
								<i class="fa fa-twitter" aria-hidden="true"></i></a> 
							<a href="#" data-toggle="tooltip" data-placement="bottom" title="Dribbble">
								<i class="fa fa-dribbble" aria-hidden="true"></i></a> 
							<a href="#" data-toggle="tooltip" data-placement="bottom" title="Behance">
								<i class="fa fa-behance" aria-hidden="true"></i></a> 
							<a href="#" data-toggle="tooltip" data-placement="bottom" title="Linkedin">
								<i class="fa fa-linkedin" aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Logo Area -->
		<div class="logo-area text-center">
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12">
						<a href="home.do" class="original-logo"><img
							src="resources/img/core-img/logo.png" alt=""></a>
					</div>
				</div>
			</div>
		</div>

		<!-- Nav Area -->
		<div class="original-nav-area" id="stickyNav">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Classy Menu -->
					<nav class="classy-navbar justify-content-between">

						<!-- Subscribe btn -->
						<div class="subscribe-btn">
							<a href="#" class="btn subscribe-btn" data-toggle="modal"
								data-target="#subsModal">Subscribe</a>
						</div>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu" id="originalNav">
							<!-- close btn -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Nav Start -->
							<div class="classynav">
								<ul>
									<li><a href="home.do">Home</a></li>
									<li><a href="#">소개</a>
										<ul class="dropdown">
											<li><a href="home.do">Home</a></li>
											<li><a href="#">About Us</a></li>
											<li><a href="#">Single Post</a></li>
											<li><a href="#">Contact</a></li>
											<li><a href="#">Coming Soon</a></li>
										</ul></li>
									<li><a href="#">공연 및 예약</a>
										<div class="megamenu">
											<ul class="single-mega cn-col-4">
												<li class="title">전체</li>
												<li><a href="#">Mega Menu Item 1</a></li>
											
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="title">Main Hell</li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="title">Hell 1</li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="title">Hell 2</li>
											</ul>
										</div></li>
										<li><a href="#">My page</a></li>
									<li><a href="#">회원가입</a></li>
									<li><a href="adminlogin.do">관리자(임시)</a></li>
								</ul>

								 <!-- Search Form  -->
                                <div id="search-wrapper">
                                    <form action="#">
                                        <input type="text" id="search" placeholder="Search something...">
                                        <div id="close-icon"></div>
                                        <input class="d-none" type="submit" value="">
                                    </form>
                                </div>
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
	<!-- ##### Header Area End ##### -->

