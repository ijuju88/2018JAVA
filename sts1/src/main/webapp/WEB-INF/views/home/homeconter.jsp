<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content" id="content">
		<div
			class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
			<h1 class="display-4">Page</h1>
			<p class="lead">Quickly build an effective pricing table for your
				potential customers with this Bootstrap example. It's built with
				default Bootstrap components and utilities with little
				customization. )/o_o/)</p>
		</div>

		<div class="container">
			<c:if test="${empty list}">
			</c:if>
			<c:if test="${! empty list}">
				<div class="card-deck mb-3 text-center">

					<c:forEach var="iDAO" items="${list}" varStatus="status">
						<div class="card mb-4 box-shadow">

							<form action="cart.do" method="get" class="form1">
								<div class="card-header">
									<h4 class="my-0 font-weight-normal">${iDAO.itm_name}</h4>
									<input type="hidden" name="itm_no" value="${iDAO.itm_no}">

									<div class="slider-nav" id="slides${status.count}">
									
										<div>
											<img class="card-img-top"
												src="item-select-img.do?itm_no=${iDAO.itm_no}&itm_img_idx=1" />
										</div>
										<div>
											<img class="card-img-top"
												src="item-select-img.do?itm_no=${iDAO.itm_no}&itm_img_idx=2" />
										</div>
										<div>
											<img class="card-img-top"
												src="item-select-img.do?itm_no=${iDAO.itm_no}&itm_img_idx=3" />
										</div>


									</div>
								</div>
								<div class="card-body">
									<h1 class="card-title pricing-card-title">
										<fmt:formatNumber value="${iDAO.itm_price}" pattern="#,###" />
										원 <small class="text-muted">/개당</small>
									</h1>
									<ul class="list-unstyled mt-3 mb-4">
										<li>${iDAO.itm_content}</li>
									</ul>
									<a href="#" class="btn btn-outline-primary btn_order"> 구매하기</a>
									<input type="button" class="btn btn-outline-primary btn_cart"
										value="장바구니">
								</div>
							</form>

						</div>


					</c:forEach>
					<c:if test="${size == 1}">
						<c:forEach begin="1" end="1" step="1">
							<div class="card mb-4 box-shadow" style="display: block;">
								<p>준비중입니다</p>
							</div>
						</c:forEach>
					</c:if>

				</div>
			</c:if>

		</div>
	</div>

</body>
</html>