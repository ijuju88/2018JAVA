<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/jquery-3.2.1.js"></script>
<script>
	$(function() {
		
		//결제창가기
		$(".step3") .click( function() {
			var show_no = $(this).attr("show_no");
			var ssr_no = $(this).attr("ssr_no");

			var checkBtn = $(this);

			var tr = checkBtn.parent().parent();
			var td = tr.children();

			console.log("클릭한 Row의 모든 데이터 : " + tr.text());

			var showno = Number(td.eq(1).text());
			var ssrno =  parseInt(td.eq(0).text());


			window.open(
			'homepayseat3.do?show_no='+ showno + '&ssr_no='+ ssrno,
			'_blank',
			'width=800, height=755, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no');
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<h1 class="page-header">예약현황</h1>

	<div class="table-responsive">
		<form action="homepayseat3.do" method="get" id="step3Form">
			<table class="table table-striped">
				<thead>
					<tr>
						<th style="display: none;">정보</th>
						<th style="display: none;">정보</th>
						<th>공연명</th>
						<th>공연좌석</th>
						<th>가격</th>
						<th>예약일</th>
						<th>결제완료상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>
							<td style="display: none;">${vo.ssr_no}</td>
							<td style="display: none;">${vo.show_no}</td>
							<td><a href="#">${vo.show_title}</a></td>
							<td>${vo.ssr_seat}</td>
							<td>${vo.ssr_price}</td>
							<td>${vo.ssr_date}</td>

							<c:choose>

								<c:when test="${vo.ssr_payset eq 'Y'}">
									<td>${vo.ssr_payset}</td>
								</c:when>

								<c:otherwise>
									<td>${vo.ssr_payset}
										<button type="button" class="btn btn-outline-info step3">결제하기</button>
										<button type="button" class="btn btn-outline-info">취소하기</button>
									</td>
								</c:otherwise>
							</c:choose>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>


</body>
</html>