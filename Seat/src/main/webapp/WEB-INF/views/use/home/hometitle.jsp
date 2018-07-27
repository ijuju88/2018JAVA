<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<script src="resources/js_jsp/homeindex.js"></script>
<!-- Preloader -->
<div id="preloader">
	<div class="preload-content">
		<div id="original-load"></div>
	</div>
</div>

<!-- ##### Header Area Start ##### -->
<header class="header-area">

	<!-- Top Header Area -->
	<div class="top-header">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<!-- Breaking News Area -->
				<div class="col-6">
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
				<div class="col-6">
					<div class="top-social-area">
						<!-- 로그인 안되면 -->
						<c:choose>

							<c:when test="${sessionScope.USESID eq null}">

								<form action="homelogin.do" method="post" id="loginForm">
									<div class="form-row">
										<div class="col-md-4 ">
											<input type="text" class="form-control" id="id" name="id"
												placeholder="id">
										</div>
										<div class="col-md-4 ">
											<input type="password" class="form-control" id="pw" name="pw"
												placeholder="pw">
										</div>

										<div class="col-md-1 ">
											<button type="submit" class="btn btn-secondary"
												data-toggle="tooltip" data-placement="bottom" id="Uselogin"
												title="Login">Login</button>
										</div>
										<div class="col-md-3">

											<a data-toggle="modal" class="btn btn-secondary"
												href="homejoin.do" data-target="#myModal" id="Usejoin"
												style="width: 100px; height: 38px; color: #fff; font-size: 18px; vertical-align: middle;">Join</a>

										</div>
									</div>
								</form>
							</c:when>

							<c:otherwise>
								<!-- 로그인 되면 -->
								<div class="form-row">
									<div class="col-md-4 "><input type="hidden" id="userid" value="${sessionScope.USESID}">${sessionScope.USESID}님환영합니다</div>


									<div class="col-md-3 ">
										<button type="button" class="btn btn-secondary"
											data-toggle="tooltip" data-placement="bottom" id="UsePage"
											title="MyPage">MyPage</button>
									</div>
									<form action="homelogout.do" method="GET" id="logoutForm">
										<div class="col-md-2 ">
											<button type="submit" class="btn btn-secondary"
												data-toggle="tooltip" data-placement="bottom" id="Uselogout"
												title="LogOut">LogOut</button>
										</div>
									</form>
								</div>
							</c:otherwise>
						</c:choose>

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
					<a href="home.do" class="original-logo" style="float: left;"><img
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
						<button type="button" class="btn original-btn chats1"
							data-toggle="modal" data-target="#myModal">문의채팅</button>
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

							<!-- 로그인 안되면 -->
							<c:choose>

								<c:when test="${sessionScope.USESID eq null}">
									<ul>
										<li><a href="home.do">Home</a></li>
										<li><a href="#">소개</a>
											<ul class="dropdown">
												<li><a href="home.do">Home</a></li>
												<li><a href="about.do">About Us</a></li>
												<li><a href="#">Single Post</a></li>
											</ul></li>
										<li><a href="#">공연 및 예약</a>
											<div class="megamenu">
												<ul class="single-mega cn-col-4">
													<li class="title">전체</li>
													<li><a href="#">전체보기</a></li>

												</ul>
												<ul class="single-mega cn-col-4">
													<li class="title">Main Hell</li>
													<li><a href="#">>Main Hell</a></li>
												</ul>
												<ul class="single-mega cn-col-4">
													<li class="title">Hell 1</li>
													<li><a href="#">Hell 1</a></li>
												</ul>
												<ul class="single-mega cn-col-4">
													<li class="title">Hell 2</li>
													<li><a href="#">Hell 2</a></li>
												</ul>
											</div></li>
										<li><a href="#">게시판</a>
											<ul class="dropdown">
												<li><a href="home_noticelist.do">공지사항</a></li>
												<li><a href="#">#</a></li>
											</ul></li>
										<li><a href="adminlogin.do">관리자(임시)</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<!-- 로그인 되면 -->
									<ul>
										<li><a href="home.do">Home</a></li>
										<li><a href="#">소개</a>
											<ul class="dropdown">
												<li><a href="home.do">Home</a></li>
												<li><a href="about.do">About Us</a></li>
											</ul></li>
										<li><a href="#">공연 및 예약</a>
											<div class="megamenu">
												<ul class="single-mega cn-col-4">
													<li class="title">전체</li>
													<li><a href="#">전체</a></li>
												</ul>
												<ul class="single-mega cn-col-4">
													<li class="title">Main Hell</li>
													<li><a href="#">Main Hell</a></li>
												</ul>
												<ul class="single-mega cn-col-4">
													<li class="title">Hell 1</li>
													<li><a href="#">Hell 1</a></li>
												</ul>
												<ul class="single-mega cn-col-4">
													<li class="title">Hell 2</li>
													<li><a href="#">Hell 2</a></li>
												</ul>
											</div></li>
										<li><a href="#">My page</a>
											<ul class="dropdown">
												<li><a href="homeMyPage1.do">예약현황</a></li>
												<li><a href="homeMyPage2.do">회원수정</a></li>
												<li><a href="homeMyPage3.do">About</a></li>
											</ul></li>
										<li><a href="#">게시판</a>
											<ul class="dropdown">
												<li><a href="home_noticelist.do">공지사항</a></li>
												<li><a href="#">#</a></li>
											</ul></li>
										<li><a href="adminlogin.do">관리자(임시)</a></li>
									</ul>
								</c:otherwise>
							</c:choose>

						</div>
						<!-- Nav End -->
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- ##### Header Area End ##### -->
