<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<head>
<meta charset='UTF-8'>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/homeshowseat.css">
<link rel="stylesheet" href="resources/style2.css">
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

</head>
<body style="font-size: 16px;">


	<div class="container">
		<h3>Step 1 - 정보확인</h3>
<<<<<<< HEAD
		<form action="homeshowseat1.do" method="post" id="stepform">
			<section class="mbr-section content6 cid-r061BHo7mB" id="content6-0"
				style="background-color: #efefef;">
				<div class="container">
					<div class="media-container-row">
						<div class="col">
							<div class="media-container-row">
								<div class="mbr-figure" style="width: 70%;">
									<img src="homeimgtitle.do?show_no=${ssplVO1.show_no}&idx=2"
										alt="Mobirise">
								</div>
								<div class="media-content">
									<div class="mbr-section-text">
										<p class="mbr-text mb-0 mbr-fonts-style display-7">
											<input type="hidden" id="show_no" name="show_no"
												value="${ssplVO1.show_no}"> <strong>공연명:${ssplVO1.show_title}</strong>
											<br /> 장&nbsp;&nbsp;&nbsp;&nbsp;소:0000공연장
											${ssplVO1.show_id_name} <br />
											날&nbsp;&nbsp;&nbsp;&nbsp;짜:${fn:substring(ssplVO1.show_startdate,0,13)}시
											~ ${fn:substring(ssplVO1.show_enddate,0,13)}시 <br />
										<table class="table table-sm table-primary">
											<thead>
												<tr>
													<th scope="col">좌석종류</th>
													<th scope="col">가격</th>
													<th scope="col">남은좌석수</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="item" items="${scVO1}" varStatus="status">

													<tr>
														<td>${item.ss_seattype}석</td>
														<td>${item.ss_seatpay}원</td>
														<td>${item.ss_seatrow * item.ss_seatcol}</td>
													</tr>
									
													</c:forEach>
											</tbody>
										</table>

										</p>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</section>
			<hr>
			<ul class="list-inline pull-right">
				<li><button type="button" class="btn btn-primary next-step1">Save
						and continue</button></li>
			</ul>
		</form>
	</div>

	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
	<script src="resources/js/sweetalert2.min.js"></script>

	<script>
		$(function() {

			//다음버튼클릭시
			$(".next-step1").on("click", function() {
				//alert($("#show_seatchoice option:selected").val());
=======

		<section class="mbr-section content6 cid-r061BHo7mB" id="content6-0"
			style="background-color: #efefef;">
			<div class="container">
				<div class="media-container-row">
					<div class="col">
					<form action="homeshowseat1.do" method="post" id="stepform">
						<div class="media-container-row">
							<div class="mbr-figure" style="width: 70%;">
								<img src="homeimgtitle.do?show_no=${ssplVO1.show_no}&idx=2"
									alt="Mobirise">
							</div>
							<div class="media-content">
								<div class="mbr-section-text">
									<p class="mbr-text mb-0 mbr-fonts-style display-7">
										<input type="hidden" id="show_no" name="show_no"
											value="${ssplVO1.show_no}"> <strong>공연명:${ssplVO1.show_title}</strong>
										<br /> 장&nbsp;&nbsp;&nbsp;&nbsp;소:0000공연장
										${ssplVO1.show_id_name} <br />
										날&nbsp;&nbsp;&nbsp;&nbsp;짜:${fn:substring(ssplVO1.show_startdate,0,13)}시
										~ ${fn:substring(ssplVO1.show_enddate,0,13)}시 <br />
									<table class="table table-sm table-primary">
										<thead>
											<tr>
												<th scope="col">좌석종류</th>
												<th scope="col">가격</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>vip석</td>
												<td>${ssplVO1.show_vipprice}원</td>
											</tr>

											<tr>
												<td>r석</td>
												<td>${ssplVO1.show_rprice}원</td>
											</tr>

											<tr>
												<td>s석</td>
												<td>${ssplVO1.show_sprice}원</td>
											</tr>

											<tr>
												<td>a석</td>
												<td>${ssplVO1.show_aprice}원</td>
											</tr>
											
											<tr>
												<td colspan="2">
												<select class="custom-select" id="show_seatchoice" name="show_seatchoice" disabled multiple>
													<option value="1">VIP석 ${scVO1.sc_vipseat}석 남음</option>
													<option value="2">R석 ${scVO1.sc_rseat}석 남음</option>
													<option value="3">S석 ${scVO1.sc_sseat}석 남음</option>
													<option value="4">A석 ${scVO1.sc_aseat}석 남음</option>
												</select>
												
												</td>
											</tr>

										</tbody>
									</table>

									</p>

								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</section>

		<hr>
		<ul class="list-inline pull-right">
			<li><button type="button" class="btn btn-primary next-step1">Save
					and continue</button></li>
		</ul>
	</div>

	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
<script src="resources/js/sweetalert2.min.js"></script>

	<script>
		$(function() {
			
			//다음버튼클릭시
			$(".next-step1").on("click", function(){
				 //alert($("#show_seatchoice option:selected").val());
>>>>>>> refs/remotes/origin/master
				/* if($("#show_seatchoice option:selected").val() === undefined){
					swal('예약할 좌석을 선택해주세요');
				}else{
					$("#stepform").submit();
				} */
				$("#stepform").submit();
			});
		});
	</script>

</body>
</html>