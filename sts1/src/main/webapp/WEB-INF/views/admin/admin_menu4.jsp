<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page session="true"%>
<html>
<head>
<title>관리자페이지</title>
</head>



<link rel="stylesheet" href="resources/css/dashboard.css">

<link rel="stylesheet" href="resources/css/bootstrap.min.css?var=2">
<script src="resources/js/jquery-3.2.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js?var=2"></script>
<script src="resources/js/bootstrap.min.js"></script>

<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
<body>
	</div>
	<h1 class="h2">주문관리</h1>
	<div class="table-responsive">

		<form action="#" method="post">
			<table class="table table-striped table-sm">
				<thead align="center">
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>상품가격</th>
						<th>구매수량</th>
						<th>구매자</th>
						<th>이메일</th>
						<th>구매일</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:if test="${empty olist}">
						<tr>
							<td colspan="8">내용이 없습니다.</td>
						</tr>
					</c:if>

					<c:if test="${!empty olist}">
						<c:forEach var="vo" items="${olist}">
							<tr>
								<td>${vo.ORD_ID}</td>
								<td>${vo.ITM_NAME}</td>
								<td>${vo.ITM_PRICE}</td>
								<td>${vo.ORD_CNT}</td>
								<td>${vo.MEM_NAME}</td>
								<td>${vo.MEM_EMAIL}</td>
								<td>${vo.ORD_DATE}</td>
								<td><a href="delivery.do?ord_no=${vo.ORD_ID}"
									class="btn btn_primary btn-sm">배송</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</form>
	</div>
	<script>
		
	</script>
</body>

</html>