<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>

<!-- Custom styles for this template -->
<link href="resources/css/pricing.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">


<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/js/jquery.slides.js"></script>
<script src="resources/js/holder.min.js"></script>
<script src="resources/js/bootstrap.js"></script>

</head>

<body>

	<jsp:include page="home/hometitle.jsp" />

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
						<div class="card mb-3 box-shadow">
							<div class="card-header">
								<h4 class="my-0 font-weight-normal">${iDAO.itm_name}</h4>

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

									<%--  <div>
									<img class="card-img-top"
										src="item_img.do?itm_no=${iDAO.itm_no}" />
								</div>  --%>
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
								<a type="button" href="#" class="btn btn-outline-primary">
									구매하기</a> <a type="button" href="#" class="btn btn-outline-primary">
									장바구니</a>
							</div>
						</div>
					</c:forEach>
			</c:if>

		</div>
	</div>


	<jsp:include page="home/homefooter.jsp" />
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script>
		Holder.addTheme('thumb', {
			bg : '#55595c',
			fg : '#eceeef',
			text : 'Thumbnail'
		});
	</script>

	<script>
		$(function() {
			var headers = $('.slider-nav');
			for (var i = 1; i <= headers.length; i++) {
				//alert(i);
				$('#slides' + i).slidesjs({
					width : 940,
					height : 650,
					navigation : {
						active : false
					// 네비게이션 사용 유무(이전 다음 보기 버튼)

					},
					play : {
						//active : true, // 버튼 사용유무
						auto : true, //자동재생
						interval : 4000, //4초
						pauseOnHover : true, //마우스 올릴때 슬라이드 멈추기
						restartDelay : 2500
					//마우스 올렸다가 벗어날때 재작동 신간
					}
				});
			}

		});
	</script>
</body>
</html>
