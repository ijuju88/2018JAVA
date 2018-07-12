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
</head>

<body>

	<jsp:include page="home/hometitle.jsp" />
	<jsp:include page="home/homeconter.jsp" />
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
			
			$(".btn_cart").click(function() {
				 var idx=$(this).index('.btn_cart');
				 swal({
					  title: '장바구니',
					  text: "추가할가요?",
					  type: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '예'
					}).then((result) => {
					  if (result.value) {
						  //alert(itm_no);
						  $('.form1').eq(idx).submit();
					  }
					});
					
			});
			

		});
	</script>
</body>
</html>
