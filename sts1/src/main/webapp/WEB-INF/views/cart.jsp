<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
</head>

<body>
	<jsp:include page="home/hometitle.jsp" />
<div class="container">
	<form id="form1" action="#" method="post">
		<h1 class="h2">장바구니</h1>

		<div class="table-responsive">

			<!-- 	<a href="#" id="btn-insert-item"
				class="btn btn-sm btn-outline-secondary">물품추가</a> <input
				type="button" id="btn-dalete-all"
				class="btn btn-sm btn-outline-secondary" value="전체삭제">
			<a href="#" class="btn btn-sm btn-outline-secondary">전체삭제</a>
			<a href="#" class="btn btn-sm btn-outline-secondary">전체수정</a> -->

			<table class="table table-striped table-sm">
				<thead style="margin: auto; text-align: center;">
					<tr>
						<th><input type="checkbox" id="chk1"></th>
						<th>물품명</th>
						<th>가격</th>
						<th>선택수량</th>
						<th>합계</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody style="margin: auto; text-align: center;">
				<c:if test="${empty list}">
					<tbody style="margin: auto; text-align: center;">
						<tr>
							<td colspan="11">내용없음!!</td>
						</tr>
				</c:if>
				<c:if test="${! empty list}">
					<c:forEach var="cDAO" items="${list}">
							<tbody style="margin: auto; text-align: center;">
							<tr>
								<td style="margin: auto; text-align: center;">
								<input type="checkbox" name='chk2[]'
									value="${cDAO.crt_no}" class="chk2"></td>

								<td><input type="hidden" name="itm_no"
									id="cart_itm_no"
									style="border: none; border-right: 0px; border-top: 0px; 
									boder-left: 0px; boder-bottom: 0px;"
									value="${cDAO.itm_no}"> <input type="text"
									name="itm_name" id="cart_itm_name"
									style="border: none; border-right: 0px; border-top: 0px; 
									boder-left: 0px; boder-bottom: 0px; background: #f2f2f2;"
									value="${cDAO.itm_name}"></td>

								<td><fmt:formatNumber value="${cDAO.itm_price}"
										pattern="#,###" />원</td>


								<td>
								<select name="itm_cnt" id="cart_itm_cnt" class="select_cnt">
										<c:forEach var="i" begin="1" end="50" step="1">
											<option value="${i}" ${cDAO.crt_cnt == i ? 'selected="selected"' : '' }>${i}</option>
										</c:forEach>
								</select>
								</td>
								
								<td>
									<input type="text" name="itm_pricesum" id="cart_itm_pricesum"
									style="border: none; border-right: 0px; background: #f2f2f2; 
									border-top: 0px; boder-left: 0px; boder-bottom: 0px;"
									readonly>
								</td>
								
								<td>
								
								</td>
								
							</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>
	</form>
</div>



	<jsp:include page="home/homefooter.jsp" />
</body>


<script>
$(function() {
	//체크박스 전체체크 및 해제
	$('#chk1').change(function() {
		if ($(this).is(":checked")) {
			$('.chk2').prop('checked', true);
		}else{
			$('.chk2').prop('checked', false);
		}
	});
	
	//합계 확인
	$('.select_cnt').change(function() {
		var sum=$(this).index('#cart_itm_cnt option:selected').val();
		alert(sum);
	
	});
});

</script>
</html>