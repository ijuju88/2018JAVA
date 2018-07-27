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

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Original - Lifestyle Blog Template</title>


<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/home.css">
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="resources/style.css?var=5">

<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
<!-- 알림창용 sweetalert2 -->
<!-- https://sweetalert2.github.io/ -->
<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
<style>
textarea {
	overflow-x: hidden;
	overflow-y: auto;
	resize: none; /* 사이즈 변경불가 */
}

div {
	margin-bottom: 5px;
}

.con {
	border: 1px solid #e4e7e7;
	border-radius: 0.5em;
}

.conent {
	margin: 15px;
}
</style>
<script src="resources/js/jquery-3.2.1.js"></script>
<!-- Material Design Lite -->
<script src="resources/js/slick.min.js"></script>
<!-- Bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>

</head>

<body>

	<jsp:include page="../home/hometitle.jsp"></jsp:include>


	<!-- ##### Contact Area Start ##### -->
	<section class="contact-area section-padding-50">
		<div class="container">

					<!-- Main content -->
					<section class="content">

						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="container">
										<div class="card-header">
											<h3 class="card-title" align="center">공지사항보기</h3>

											<!-- /.card-header -->
											<div class="card-body">

												<div>
													<input type="hidden" name="nb_no" class="form-control"
														id="nb_no" value="${nbVO.nb_no}" readonly />
												</div>

												<div>
													<div class="form-group row mb-4" style="margin-bottom: 5px">
														<div class="col-sm-5">
															제목 <input type="text" name="nb_title"
																class="form-control" id="nb_title"
																value="${nbVO.nb_title}" readonly />
														</div>
														<div class="col-sm-3">
															카테고리<input type="text" name="nb_category"
																class="form-control" id="nb_category"
																value="${nbVO.nb_category}" readonly />
														</div>
													</div>

													내용
													<div class="con">
														<div class="conent">${nbVO.nb_content}</div>
													</div>

													<div>
														쓴날짜 <input type="text" name="nb_title"
															class="form-control" id="nb_date" name="nb_date" readonly
															value="<fmt:formatDate value="${nbVO.nb_date}" pattern="yyyy/MM/dd HH:MM"/>">
													</div>
										
													<button type="button" class="btn btn-outline-secondary"
														onClick="window.location.href='home_noticelist.do'">이전으로</button>

													
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
		</div>


	</section>

	<jsp:include page="../home/homefooter.jsp"></jsp:include>
	<!-- page script -->
	<script src="resources/js_jsp/baselist.js"></script>
	<script src="resources/js_jsp/notice_list.js"></script>
</body>

</html>

