<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<meta charset="UTF-8">

<!-- Morris chart -->
<link rel="stylesheet" href="resources/admin/plugins/morris/morris.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<!-- Morris.js charts -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="resources/admin/plugins/morris/morris.min.js"></script>

<!-- daterangepicker -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
<script src="resources/admin/plugins/daterangepicker/daterangepicker.js"></script>

<body class="hold-transition sidebar-mini">
	<%@ page session="true"%>
	<c:choose>
		<c:when test="${sessionScope.SID eq null}">
			<h3>잘못된 접근입니다...</h3>
		</c:when>
		<c:otherwise>
			<div class="wrapper">

				<jsp:include page="admintitle.jsp"></jsp:include>
				<!-- Content Wrapper. Contains page content -->
				<div class="content-wrapper">
					<!-- Content Header (Page header) -->
					<div class="content-header">
						<div class="container-fluid">
							<div class="row mb-2">
								<div class="col-sm-6">
									<h1 class="m-0 text-dark">Dashboard</h1>
								</div>
								<!-- /.col -->
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right">
										<li class="breadcrumb-item"><a href="#">Home</a></li>
										<li class="breadcrumb-item active">Dashboard v2</li>
									</ol>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.container-fluid -->
					</div>
					<!-- /.content-header -->

					<!-- Main content -->
					<section class="content">
						<div class="container-fluid">

							<!-- 윗상자 -->
							<div class="row">
								<div class="col-lg-3 col-6">
									<!-- small box -->
									<div class="small-box bg-info">
										<div class="inner">
											<h3>${show_num}</h3>
											<p>공연등록수</p>
										</div>
										<div class="icon">
											<i class="ion ion-bag"></i>
										</div>
										<a href="adminshowseat.do" class="small-box-footer">들어가기<i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
								<!-- ./col -->
								<div class="col-lg-3 col-6">
									<!-- small box -->
									<div class="small-box bg-success">
										<div class="inner">
											<h3>
												53<sup style="font-size: 20px">%</sup>
											</h3>

											<p>예약현황 및 기록</p>
										</div>
										<div class="icon">
											<i class="ion ion-stats-bars"></i>
										</div>
										<a href="#" class="small-box-footer">들어가기<i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
								<!-- ./col -->
								<div class="col-lg-3 col-6">
									<!-- small box -->
									<div class="small-box bg-warning">
										<div class="inner">
											<h3>${member_num}</h3>

											<p>최근일주일간회원수</p>
										</div>
										<div class="icon">
											<i class="ion ion-person-add"></i>
										</div>
										<a href="adminmember.do" class="small-box-footer">자세히보기<i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
								<!-- ./col -->
								<div class="col-lg-3 col-6">
									<!-- small box -->
									<div class="small-box bg-danger">
										<div class="inner">
											<h3>65</h3>
											<p>기타</p>
										</div>
										<div class="icon">
											<i class="ion ion-pie-graph"></i>
										</div>
										<a href="#" class="small-box-footer">More info <i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
								<!-- ./col -->
							</div>
							<!-- /.row -->
							<!-- /.row -->
							<!-- Main row -->
							<div class="row">
								<!-- Left col -->
								<section class="col-lg-7 connectedSortable">
									<!-- Custom tabs (Charts with tabs)-->
									<div class="card">
										<div class="card-header d-flex p-0">
											<h3 class="card-title p-3">
												<i class="fa fa-pie-chart mr-1"></i> Sales
											</h3>
											<ul class="nav nav-pills ml-auto p-2">
												<li class="nav-item"><a class="nav-link active"
													href="#revenue-chart" data-toggle="tab">Area</a></li>
												<li class="nav-item"><a class="nav-link"
													href="#sales-chart" data-toggle="tab">Donut</a></li>
											</ul>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<div class="tab-content p-0">
												<!-- Morris chart - Sales -->
												<div class="chart tab-pane active" id="revenue-chart"
													style="position: relative; height: 300px;"></div>
												<div class="chart tab-pane" id="sales-chart"
													style="position: relative; height: 300px;"></div>
											</div>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->




								</section>
								<!-- /.Left col -->
								<!-- right col (We are only adding the ID to make the widgets sortable)-->


								<section class="col-lg-5 connectedSortable">
									<!-- DIRECT CHAT -->
									<div class="card direct-chat direct-chat-primary">
										<div class="card-header">
											<h3 class="card-title">Direct Chat</h3>

											<div class="card-tools">
												<span data-toggle="tooltip" title="3 New Messages"
													class="badge badge-primary">3</span>
												<button type="button" class="btn btn-tool"
													data-widget="collapse">
													<i class="fa fa-minus"></i>
												</button>
												<button type="button" class="btn btn-tool"
													data-toggle="tooltip" title="Contacts"
													data-widget="chat-pane-toggle">
													<i class="fa fa-comments"></i>
												</button>
												<button type="button" class="btn btn-tool"
													data-widget="remove">
													<i class="fa fa-times"></i>
												</button>
											</div>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<!-- Conversations are loaded here -->
											<div class="direct-chat-messages">
												<!-- Message. Default to the left -->
												<div class="direct-chat-msg">
													<div class="direct-chat-info clearfix">
														<span class="direct-chat-name float-left">Alexander
															Pierce</span> <span class="direct-chat-timestamp float-right">23
															Jan 2:00 pm</span>
													</div>
													<!-- /.direct-chat-info -->
													<img class="direct-chat-img"
														src="dist/img/user1-128x128.jpg" alt="message user image">
													<!-- /.direct-chat-img -->
													<div class="direct-chat-text">Is this template really
														for free? That's unbelievable!</div>
													<!-- /.direct-chat-text -->
												</div>
												<!-- /.direct-chat-msg -->

												<!-- Message to the right -->
												<div class="direct-chat-msg right">
													<div class="direct-chat-info clearfix">
														<span class="direct-chat-name float-right">Sarah
															Bullock</span> <span class="direct-chat-timestamp float-left">23
															Jan 2:05 pm</span>
													</div>
													<!-- /.direct-chat-info -->
													<img class="direct-chat-img"
														src="dist/img/user3-128x128.jpg" alt="message user image">
													<!-- /.direct-chat-img -->
													<div class="direct-chat-text">You better believe it!
													</div>
													<!-- /.direct-chat-text -->
												</div>
												<!-- /.direct-chat-msg -->

												<!-- Message. Default to the left -->
												<div class="direct-chat-msg">
													<div class="direct-chat-info clearfix">
														<span class="direct-chat-name float-left">Alexander
															Pierce</span> <span class="direct-chat-timestamp float-right">23
															Jan 5:37 pm</span>
													</div>
													<!-- /.direct-chat-info -->
													<img class="direct-chat-img"
														src="dist/img/user1-128x128.jpg" alt="message user image">
													<!-- /.direct-chat-img -->
													<div class="direct-chat-text">Working with AdminLTE
														on a great new app! Wanna join?</div>
													<!-- /.direct-chat-text -->
												</div>
												<!-- /.direct-chat-msg -->

												<!-- Message to the right -->
												<div class="direct-chat-msg right">
													<div class="direct-chat-info clearfix">
														<span class="direct-chat-name float-right">Sarah
															Bullock</span> <span class="direct-chat-timestamp float-left">23
															Jan 6:10 pm</span>
													</div>
													<!-- /.direct-chat-info -->
													<img class="direct-chat-img"
														src="dist/img/user3-128x128.jpg" alt="message user image">
													<!-- /.direct-chat-img -->
													<div class="direct-chat-text">I would love to.</div>
													<!-- /.direct-chat-text -->
												</div>
												<!-- /.direct-chat-msg -->

											</div>
											<!--/.direct-chat-messages-->

											<!-- Contacts are loaded here -->
											<div class="direct-chat-contacts">
												<ul class="contacts-list">
													<li><a href="#"> <img class="contacts-list-img"
															src="dist/img/user1-128x128.jpg">

															<div class="contacts-list-info">
																<span class="contacts-list-name"> Count Dracula <small
																	class="contacts-list-date float-right">2/28/2015</small>
																</span> <span class="contacts-list-msg">How have you
																	been? I was...</span>
															</div> <!-- /.contacts-list-info -->
													</a></li>
													<!-- End Contact Item -->
													<li><a href="#"> <img class="contacts-list-img"
															src="dist/img/user7-128x128.jpg">

															<div class="contacts-list-info">
																<span class="contacts-list-name"> Sarah Doe <small
																	class="contacts-list-date float-right">2/23/2015</small>
																</span> <span class="contacts-list-msg">I will be
																	waiting for...</span>
															</div> <!-- /.contacts-list-info -->
													</a></li>
													<!-- End Contact Item -->
													<li><a href="#"> <img class="contacts-list-img"
															src="dist/img/user3-128x128.jpg">

															<div class="contacts-list-info">
																<span class="contacts-list-name"> Nadia Jolie <small
																	class="contacts-list-date float-right">2/20/2015</small>
																</span> <span class="contacts-list-msg">I'll call you
																	back at...</span>
															</div> <!-- /.contacts-list-info -->
													</a></li>
													<!-- End Contact Item -->
													<li><a href="#"> <img class="contacts-list-img"
															src="dist/img/user5-128x128.jpg">

															<div class="contacts-list-info">
																<span class="contacts-list-name"> Nora S. Vans <small
																	class="contacts-list-date float-right">2/10/2015</small>
																</span> <span class="contacts-list-msg">Where is your
																	new...</span>
															</div> <!-- /.contacts-list-info -->
													</a></li>
													<!-- End Contact Item -->
													<li><a href="#"> <img class="contacts-list-img"
															src="dist/img/user6-128x128.jpg">

															<div class="contacts-list-info">
																<span class="contacts-list-name"> John K. <small
																	class="contacts-list-date float-right">1/27/2015</small>
																</span> <span class="contacts-list-msg">Can I take a
																	look at...</span>
															</div> <!-- /.contacts-list-info -->
													</a></li>
													<!-- End Contact Item -->
													<li><a href="#"> <img class="contacts-list-img"
															src="dist/img/user8-128x128.jpg">

															<div class="contacts-list-info">
																<span class="contacts-list-name"> Kenneth M. <small
																	class="contacts-list-date float-right">1/4/2015</small>
																</span> <span class="contacts-list-msg">Never mind I
																	found...</span>
															</div> <!-- /.contacts-list-info -->
													</a></li>
													<!-- End Contact Item -->
												</ul>
												<!-- /.contacts-list -->
											</div>
											<!-- /.direct-chat-pane -->
										</div>
										<!-- /.card-body -->
										<div class="card-footer">
											<form action="#" method="post">
												<div class="input-group">
													<input type="text" name="message"
														placeholder="Type Message ..." class="form-control">
													<span class="input-group-append">
														<button type="button" class="btn btn-primary">Send</button>
													</span>
												</div>
											</form>
										</div>
										<!-- /.card-footer-->
									</div>
									<!--/.direct-chat -->

								</section>
								<!-- /.content -->
							</div>
						</div>
					</section>
				</div>
			</div>


			<jsp:include page="adminfooter.jsp"></jsp:include>
			<!-- ./wrapper -->
		</c:otherwise>
	</c:choose>
</body>
</html>
