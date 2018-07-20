<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="resources/css/order.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="home/hometitle.jsp" />

	<div class="container">

<form action="order.do" method="post">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<script async
						src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
					<!-- e commers -->
					<ins class="adsbygoogle" style="display: block"
						data-ad-client="ca-pub-9155049400353686" data-ad-slot="5554792257"
						data-ad-format="auto"></ins>
					<script>
						(adsbygoogle = window.adsbygoogle || []).push({});
					</script>
					<div class="preview col-md-6">
						<input type="hidden" id="itm_no" name="itm_no" value="${vo.itm_no}">
						<div class="preview-pic tab-content">
							<div class="tab-pane active" id="pic-1">
								<img src="item-select-img.do?itm_no=${vo.itm_no}&itm_img_idx=1" />
							</div>
							<div class="tab-pane" id="pic-2">
								<img src="item-select-img.do?itm_no=${vo.itm_no}&itm_img_idx=2" />
							</div>
							<div class="tab-pane" id="pic-3">
								<img src="item-select-img.do?itm_no=${vo.itm_no}&itm_img_idx=3" />
							</div>
							<div class="tab-pane" id="pic-4">
								<img
									src="item-select-img.do?itm_no=${result.itm_no}&itm_img_idx=3" />
							</div>
							<div class="tab-pane" id="pic-5">
								<img
									src="item-select-img.do?itm_no=${result.itm_no}&itm_img_idx=3" />
							</div>


						</div>
						<ul class="preview-thumbnail nav nav-tabs">
							<li class="active"><a data-target="#pic-1" data-toggle="tab">
									<img src="item-select-img.do?itm_no=${vo.itm_no}&itm_img_idx=1" />
							</a></li>
							<li><a data-target="#pic-2" data-toggle="tab"> <img
									src="item-select-img.do?itm_no=${vo.itm_no}&itm_img_idx=2" />
							</a></li>
							<li><a data-target="#pic-3" data-toggle="tab"> <img
									src="item-select-img.do?itm_no=${vo.itm_no}&itm_img_idx=3" />
							</a></li>
							<li><a data-target="#pic-4" data-toggle="tab"> <img
									src="item-select-img.do?itm_no=${vo.itm_no}&itm_img_idx=3" />
							</a></li>
							<li><a data-target="#pic-5" data-toggle="tab"> <img
									src="item-select-img.do?itm_no=${vo.itm_no}&itm_img_idx=3" />
							</a></li>

						</ul>

					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${vo.itm_name}</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span> <span
									class="fa fa-star checked"></span> <span
									class="fa fa-star-half-full checked"></span> <span
									class="fa fa-star"></span> <span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<p class="product-description">${vo.itm_content}</p>
						<h4 class="price">
							가격: <span>11,111원</span>
						</h4>
						<div class="form-inline">
							<label style="width: 100px">종류</label> 
							<select class="form-control" id="cate1">
								<option value="0">종류를 선택하세요</option>
							</select>
						</div>

						<div class="form-inline">
							<label style="width: 100px">사이즈</label> 
							<select class="form-control" id="cate2">
								<option value="0">종류를 선택하세요</option>
							</select>
						</div>

						<div class="form-inline">
							<label style="width: 100px">수량</label> <select
								class="form-control"  name="ord_cnt">
								<c:forEach var="i" begin="1" end="${vo.itm_qty}" step="1">
									<option value="${i}" >${i}</option>
								</c:forEach>
							</select>
						</div>

						<div class="action">
							<input type="submit" class="btn btn-primary" value="구매하기" />
						</div>

					</div>
				</div>
			</div>
		</div>
</form>
	</div>

	<script async
		src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<ins class="adsbygoogle" style="display: block; text-align: center;"
		data-ad-format="fluid" data-ad-layout="in-article"
		data-ad-client="ca-pub-9155049400353686" data-ad-slot="7825539155"></ins>
	<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
     
    
     $(function() {
     	$.post('ajax_get_cate1.do', {itm_no:'${param.itm_no}'}, function(data) {
     		//console.iog(data);
     		var len=data.length;
     		for(var i=0; i<len; i++){
     			$('#cate1').append(
     					"<option value='"+data[i].cate_no+
     					"'>"+data[i].cate_name+"</option>");
     		}
     	}, 'json');
     	
  

     	$('#cate1').change(function(){
			var no = $('#cate1').val();
			
			if(no <= 0){
				$('#cate2').attr('disabled', true);
			}
			else { //항목이 선택된 경우
				$('#cate2').attr('disabled', false);
				$('#cate2').empty(); //항목을 모두 지움
				$.post('ajax_get_cate2.do', {cate_no:no}, function(data1){
					var len1 = data1.length;
					$('#cate2').append(
					"<option value='0'>종류를 선택하세요</option>");
					for(var i=0;i<len1;i++){
						$('#cate2').append(
							"<option value='"+data1[i].cate_no1+"'>"+ data1[i].cate_name + "</option>");
					}
				},'json');
			}
		});

     	
     });

    
</script>
</body>
</html>
