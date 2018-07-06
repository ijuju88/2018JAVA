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

	<!-- 물품개별수정 모달창  -->
	<form action="admin-item-edit.do" method="post"
		enctype="multipart/form-data" >
		<div class="modal fade bd-example-modal-lg" id="update-list-modal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">물품수정</h5>
					</div>
					<div class="modal-body">
						<div class="form-inline">
							<label>물품번호</label> <input type="text" name="itm_no" id="edit_itm_no"
								class="form-control" readonly value="${iVO.itm_no}">
						</div>

						<div class="form-inline">
							<label>물품이름</label> <input type="text" name="itm_name"
								id="edit_itm_name" class="form-control">
						</div>

						<div class="form-inline">
							<label>물품설명</label>
							<textarea name="itm_content" id="edit_itm_content" rows="6"
								style="width: 400px"></textarea>
						</div>

						<div class="form-inline">
							<label>물품가격</label> <input type="text" name="itm_price"
								id="edit_itm_price" class="form-control">
						</div>

						<div class="form-inline">
							<label>재고수량</label> <select name="itm_qty" id="edit_itm_qty">
								<c:forEach var="i" begin="1" end="1000" step="1">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-inline">
							<label>이미지들</label>
							<c:forEach var="i" begin="1" end="3" step="1">

								<img alt="#" src="#" style="width: 25%; margin-right: 5px;"
									id="edit_itm_img${i}" name="itm_img${i}">
								<input type="file" name="itm_imgs${i}" id="edit_itm_imgs${i}"
									class="form-control" class="form-control-file"
									style="display: none;">

							</c:forEach>
						</div>

						<div class="form-inline">
							<label>등록일자</label> <input type="text" name="itm_date"
								id="edit_itm_date" class="form-control" readonly>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary btn-update" value="등록">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>

				</div>

			</div>
		</div>
	</form>

</body>
</html>