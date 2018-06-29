<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<html>
<head>
<title>관리자페이지</title>
</head>



<link rel="stylesheet" href="resources/css/dashboard.css">
<!-- Icons -->
<script src="resources/js/feather.min.js"></script>


<link rel="stylesheet" href="resources/css/bootstrap.min.css?var=2">
<script src="resources/js/jquery-3.2.1.js?var=2"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js?var=2"></script>
<script src="resources/js/bootstrap.min.js?var=2"></script>


<script>
	$(function() {
		feather.replace();

		$('#btn-insert-item').click(function() {
			$('#insert-item-modal').modal('show');
		});

	});
</script>


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

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">

					<!-- 옆메뉴 -->
					<ul class="nav flex-column">
						<li class="nav-item"><a
							${param.menu==0 || param.menu eq null ? 'class="nav-link active"' : 'class="nav-link"'}
							href="admin.do?menu=0"> <span data-feather="home"></span>
								Home <span class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a
							${param.menu==1 ? 'class="nav-link active"' : 'class="nav-link"'}
							href="admin.do?menu=1"> <span data-feather="shopping-cart"></span>
								물품관리
						</a></li>

						<li class="nav-item"><a
							${param.menu==2 ? 'class="nav-link active"' : 'class="nav-link"'}
							href="admin.do?menu=2"> <span data-feather="users"></span>
								회원관리
						</a></li>


					</ul>

				</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<div
				class="d-flex justify-content-between 
			flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<c:choose>
					<c:when test="${param.menu==0 || param.menu eq null}">
						<h1 class="h2">홈</h1>
					</c:when>

					<c:when test="${param.menu==1}">
						<h1 class="h2">물품관리</h1>
			</div>

			<div class="table-responsive">
				<a href="#" id="btn-insert-item"
					class="btn btn-sm btn-outline-secondary">물품추가</a> <a href="#"
					class="btn btn-sm btn-outline-secondary">전체삭제</a> <a href="#"
					class="btn btn-sm btn-outline-secondary">전체수정</a>
				<table class="table table-striped table-sm">
					<thead align="center">
						<tr>
							<th><input type="checkbox"></th>
							<th>번호</th>
							<th>이름</th>
							<th>내용</th>
							<th>가격</th>
							<th>재고수량</th>
							<th>이미지1</th>
							<th>이미지2</th>
							<th>이미지3</th>
							<th>날짜</th>
							<th>비고</th>
						</tr>
					</thead>
					<c:if test="${empty list}">
						<tbody align="center">
							<tr>
								<td colspan="11">내용없음!!</td>
							</tr>
					</c:if>
					<c:if test="${! empty list}">
						<c:forEach var="iDAO" items="${list}">
							<tbody align="center">
								<tr>
									<th><input type="checkbox"></th>
									<td>${iDAO.itm_no}</td>
									<td>${iDAO.itm_name}</td>

									<c:choose>
										<c:when test="${fn:length(iDAO.itm_content)>10}">
											<td><c:out
													value="${fn:substring(iDAO.itm_content,0,10)}" /> ....</td>
										</c:when>
										<c:otherwise>
											<td>${iDAO.itm_content}</td>
										</c:otherwise>
									</c:choose>

									<td>${iDAO.itm_price}</td>
									<td>${iDAO.itm_qty}</td>
									<td>${iDAO.itm_img1}</td>
									<td>${iDAO.itm_img2}</td>
									<td>${iDAO.itm_img3}</td>
									<td>${iDAO.itm_date}</td>
									<td><a href="#" class="btn btn-sm btn-outline-secondary">수정</a>
										<a href="#" class="btn btn-sm btn-outline-secondary">삭제</a></td>
								</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
			</c:when> <c:when test="${param.menu==2}">
				<h1 class="h2">회원관리</h1>
		</div>

		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead align="center">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>나이</th>
						<th>이메일주소</th>
						<th>가입일</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody align="center">
					<tr>
						<c:if test="${empty list1}">
							<td colspan="6">내용없음!!</td>
					</tr>
					</c:if>
					<c:if test="${! empty list1}">
						<c:forEach var="mDAO" items="${list1}">
							<td>${mDAO.mem_id}</td>
							<td>${mDAO.mem_name}</td>
							<td>${mDAO.mem_age}</td>
							<td>${mDAO.mem_email}</td>
							<td>${mDAO.mem_date}</td>
							<td><a href="#" class="btn btn-sm btn-outline-secondary">차단</a>
								<a href="#" class="btn btn-sm btn-outline-secondary">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		</c:when>
		</c:choose>
		</main>
	</div>


	<!-- 물품등록 모달창  -->
	<form action="admin-item-insert.do" method="post"
		enctype="multipart/form-data">
		<div class="modal fade bd-example-modal-lg" id="insert-item-modal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">물품등록</h5>
					</div>

					<div class="modal-body">
						<div class="form-inline">
							<label>물품번호</label> <input type="text" name="itm_no"
								class="form-control" readonly value="${no}">
						</div>

						<div class="form-inline">
							<label>물품이름</label> <input type="text" name="itm_name"
								class="form-control">
						</div>

						<div class="form-inline">
							<label>물품설명</label>
							<textarea name="itm_content" rows="6" style="width: 400px"></textarea>
						</div>

						<div class="form-inline">
							<label>물품가격</label> <input type="text" name="itm_price"
								class="form-control">
						</div>

						<div class="form-inline">
							<label>재고수량</label> <select name="itm_qty">
								<c:forEach var="i" begin="1" end="1000" step="1">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
						</div>

						<c:forEach var="i" begin="1" end="3" step="1">
							<div class="form-inline">
								<label>이미지들</label> <input type="file" name="itm_img${i}"
									class="form-control">
							</div>
						</c:forEach>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="등록">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
