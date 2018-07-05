<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page session="false"%>
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
	<form id="form1" action="admin_delete_item_chk.do" method="post">
		<h1 class="h2">물품관리</h1>
		</div>

		<div class="table-responsive">
			<a href="#" id="btn-insert-item"
				class="btn btn-sm btn-outline-secondary">물품추가</a> <input
				type="button" id="btn-dalete-all"
				class="btn btn-sm btn-outline-secondary" value="전체삭제">
			<!-- <a href="#" class="btn btn-sm btn-outline-secondary">전체삭제</a> -->
			<a href="#" class="btn btn-sm btn-outline-secondary">전체수정</a>
			<table class="table table-striped table-sm">
				<thead align="center">
					<tr>
						<th><input type="checkbox" id="chk1"></th>
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
								<th><input type="checkbox" name='chk2[]'
									value="${iDAO.itm_no}" class="chk2"></th>
								<td class="td-itm-no">${iDAO.itm_no}</td>
								<td>${iDAO.itm_name}</td>

								<c:choose>
									<c:when test="${fn:length(iDAO.itm_content)>10}">
										<td><c:out value="${fn:substring(iDAO.itm_content,0,10)}" />
											....</td>
									</c:when>
									<c:otherwise>
										<td>${iDAO.itm_content}</td>
									</c:otherwise>
								</c:choose>

								<td><fmt:formatNumber value="${iDAO.itm_price}"
										pattern="#,###" />원</td>
								<td>${iDAO.itm_qty}</td>
								<td><img
									src="item-select-img.do?itm_no=${iDAO.itm_no}&itm_img_idx=1"
									width="50px" /></td>
								<td><img
									src="item-select-img.do?itm_no=${iDAO.itm_no}&itm_img_idx=2"
									width="50px" /></td>
								<td><img
									src="item-select-img.do?itm_no=${iDAO.itm_no}&itm_img_idx=3"
									width="50px" /></td>
								<td>${iDAO.itm_date}</td>

								<td>
								<a href="#" id="btn-update-item" class="btn btn-sm btn-outline-secondary btn-update">수정</a> 
								<a href="#" class="btn btn-sm btn-outline-secondary btn-delete">삭제</a></td>
							</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>
	</form>

	<jsp:include page="admin_item_insert.jsp" />
	<jsp:include page="admin_item_edit.jsp" />

	<script>
	$(function() {
		
		//물품추가
		$('#btn-insert-item').click(function() {
			$('#insert-item-modal').modal('show');
		});
		
	
		//물품 개별 수정
		$('.btn-update').click(function() {

			var idx = $(this).index('.btn-update');
			var itm_no = $('.td-itm-no').eq(idx).text();
			//alert(itm_no);
			 
			$('#update-item-modal').modal('show');
			
			 $('#update-item-modal').on('shown.bs.modal', function() {

				 $.get('admin_ajax_item_one.do?itm_no='+itm_no, function(data) {
					//var tmp=data.ret;
					 $.each(data, function(idx, val) {
					
							$('#edit_itm_no').val(val.itm_no);
							$('#edit_itm_name').val(val.itm_name);
							$('#edit_itm_content').val(val.itm_content);
							$('#edit_itm_price').val(val.itm_price);
							$('#edit_itm_qty').val(val.itm_qty);
							$('#edit_itm_date').val(val.itm_date);
							
							$('#edit_itm_img1').attr('src','item-select-img.do?itm_no='+val.itm_no+'&itm_img_idx=1');
							$('#edit_itm_img2').attr('src','item-select-img.do?itm_no='+val.itm_no+'&itm_img_idx=2');
							$('#edit_itm_img3').attr('src','item-select-img.do?itm_no='+val.itm_no+'&itm_img_idx=3');
							

	
					    
					//$('#itm_no').val(data.itm_no);
					/* $('#itm_name').val(data.itm_name);
					$('#itm_content').val(data.itm_content);
					$('#itm_price').val(data.itm_price);
					$('#itm_qty').val(data.itm_qty);
					$('#itm_img1').attr('src','item-select-img.do?itm_no='
							+$('#itm_no').val(data.itm_no)+'&itm_img_idx=1'); */
				}, 'json'); 
			});  
		});
		
		});
	
		 var dummy=[1,2,3];
		 $.each(dummy, function(i,v){
		 	$('#edit_itm_img'+v).click(function(){
				$('#edit_itm_imgs'+v).click();
			});
		 	
		 	$('#edit_itm_imgs'+v).change(function(){
				 var img = this;
				 if(img.files && img.files[0]){
					 var reader = new FileReader();
					 reader.onload = function(e){
						$('#edit_itm_img'+v).attr('src', e.target.result);	 
					 };
					 reader.readAsDataURL(img.files[0]);
				 }
			 });
		 });

		 
		
		//물품 개별삭제
		$('.btn-delete').click(function(){
			 var idx = $(this).index('.btn-delete');
			 
			 //val() - input,teatarea, select
			 //text() - 태그사이의 값
			 var itm_no = $('.td-itm-no').eq(idx).text();
			 //alert(itm_no);
			 
			 swal({
				  title: '삭제',
				  text: "삭제할건가요?",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '지울겁니다'
				}).then((result) => {
				  if (result.value) {
					  //alert(itm_no);
					  window.location.href ="admin_delete_item_one.do?itm_no="+itm_no;
				  }
				});
			 
		});	
			
				

		//체크박스 전체체크 및 해제
		$('#chk1').change(function() {
			if ($(this).is(":checked")) {
				$('.chk2').prop('checked', true);
			}else{
				$('.chk2').prop('checked', false);
			}
		});
		
		
		
		//전체삭제
		$('#btn-dalete-all').click(function() {
			swal({
				  title: '삭제',
				  text: "삭제할건가요?",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '지울겁니다'
				}).then((result) => {
				  if (result.value) {
				    $('#form1').submit();
				  }
				})
		});
		
		

	});
</script>
</body>

</html>