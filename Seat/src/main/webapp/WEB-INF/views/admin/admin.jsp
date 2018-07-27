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
<script src="resources/js/jquery-3.2.1.js"></script>
<!-- <script src="http://192.168.0.239:1004/socket.io/socket.io.js"></script> -->
<!--<script>
 $(function () {
    
    //객체생성
    var socket=io.connect("http://192.168.0.239:1004");
    var chatindex=0;
    id="admin";
    
    //서버접속시
    socket.on('connect', function () {
         //최초전송할 아이디 -> 세션시 ${sessionScope.ID}
         socket.emit('init', {"id": id, "msg" : "불고기버거"});
         
         //메세지를 보내면 밑에 적히도록
         socket.on('subscribe', function(data) {
        	 //alert(data.id=="admin");
             
        	 if(data.id=="admin"){
        		 $(".chatmessage").append("<div class='direct-chat-msg right'><div class='direct-chat-info clearfix'>");
                 $(".chatmessage").append("<span class='direct-chat-name float-right' id='chatid"+chatindex+"'>");
                 $(".chatmessage").append("</span><span class='direct-chat-timestamp float-left'>23Jan 2:05 pm</span></div><br/>");
                 $(".chatmessage").append("<img class='direct-chat-img' src='dist/img/user1-128x128.jpg' alt='message user image'>");
                 $(".chatmessage").append("<div class='direct-chat-text' id='chattext"+chatindex+"'> </div></div>");	
                 $('#chatid'+chatindex).prepend(data.id);
                 $('#chattext'+chatindex).prepend(data.msg+"<br/>");

        	 }else if(!(data.id=="admin")){
        		  $(".chatmessage").append("<div class='direct-chat-msg'><div class='direct-chat-info clearfix'>");
                  $(".chatmessage").append("<span class='direct-chat-name float-left' id='chatid"+chatindex+"'>");
                  $(".chatmessage").append("</span> <span class='direct-chat-timestamp float-right'>23Jan 2:05 pm</span></div><br/>");
                  $(".chatmessage").append("<img class='direct-chat-img' src='dist/img/user1-128x128.jpg' alt='message user image'>");
                  $(".chatmessage").append("<div class='direct-chat-text' id='chattext"+chatindex+"'> </div></div>");	
                  $('#chatid'+chatindex).prepend(data.id);
                  $('#chattext'+chatindex).prepend(data.msg+"<br/>");
        	 }
					
             chatindex++;
         });
    });
    
    //버튼누를때 보내기
    $('.charSend').click(function () {
         var txt=$("#message").val();
         
         socket.emit('publish', {"id": id, "msg" : txt});
    });
});
 
</script> -->
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

									<div class="card direct-chat direct-chat-primary">
										<div class="card-header">
											<h3 class="card-title">Direct Chat</h3>

											<div class="card-tools">
												<button type="button" class="btn btn-tool"
													data-widget="collapse">
													<i class="fa fa-minus"></i>
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
											<div class="direct-chat-messages chatmessage">

													<!-- 채팅입력부분 -->

											</div>
											<!-- /.card-body -->
											<div class="card-footer">
												<form action="#" method="post">
													<div class="input-group">
														<input type="text" name="message" id="message"
															placeholder="Type Message ..." class="form-control">
														<span class="input-group-append">
															<button type="button" class="btn btn-primary charSend">Send</button>
														</span>
													</div>
												</form>
											</div>
											<!-- /.card-footer-->
										</div></div>
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
