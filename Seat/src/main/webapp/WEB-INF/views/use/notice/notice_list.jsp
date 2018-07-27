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
								<div class="card-header">
									<h3 class="card-title">공지사항</h3>

									<!-- /.card-header -->
									<div class="card-body">
										<table id="noticetable"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>순번</th>
													<th>카테고리</th>
													<th>제목</th>
													<th>날짜</th>
												</tr>
											</thead>
											<tbody id="datatable">
												<c:forEach var="vo" items="${noticelist}" varStatus="status">
													<tr>
														<td>${vo.nb_no}</td>
														<td>${vo.nb_category}</td>
														<td><a href="home_noticeview.do?nb_no=${vo.nb_no}">${vo.nb_title}</a></td>
														<td><fmt:formatDate value="${vo.nb_date}"
																pattern="yyyy/MM/dd HH:MM" /></td>
													</tr>
												</c:forEach>
											</tbody>

										</table>
										<div class="form-group row mb-4">
									
											<!-- 카테고리별 -->
											<div class="col-sm-3">
												<select class="custom-select" name="category" id="category">
													<option value="0" selected>전체</option>
													<option value="1">공지사항</option>
													<option value="2">이벤트</option>
													<option value="3">기타</option>
												</select>
											</div>
										</div>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
							</div>
							<!-- /.col -->
						</div>
					</div>

				</section>

			</div>


	</section>

	<jsp:include page="../home/homefooter.jsp"></jsp:include>
	<!-- DataTables -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<!-- page script -->
	<script src="resources/js_jsp/baselist.js"></script>
	<script src="resources/js_jsp/notice_list.js"></script>
</body>

</html>

