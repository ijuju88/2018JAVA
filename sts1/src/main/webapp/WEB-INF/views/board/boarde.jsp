<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/dashboard.css">

<link rel="stylesheet" href="resources/css/bootstrap.min.css?var=2">
<script src="resources/js/jquery-3.2.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js?var=2"></script>
<script src="resources/js/bootstrap.min.js"></script>

<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<title>Insert title here</title>

</head>

<body>
	<!-- 물품개별수정 모달창  -->
	<form:form action="boardu.do" method="post" modelAttribute="vo">
		<div class="modal fade bd-example-modal-lg" id="update-board-modal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">게시판수정</h5>
					</div>
					<div class="modal-body">
						 <div class="form-group">
							글번호
							<form:input type="text" class="form-control" name="brd_update_no"  path="brd_no" readonly="true" />
						</div>
						 <div class="form-group">
							글제목
							<form:input type="text" class="form-control"
								name="brd_update_title" path="brd_title" />
						</div>
						 <div class="form-group">
							글쓴이
							<form:input type="text" class="form-control"
								name="brd_update_writer" path="brd_writer" readonly="true" />
						</div>
						 <div class="form-group">
							글내용
							<form:textarea rows="6" class="form-control"
								name="brd_update_content" path="brd_content"></form:textarea>

						</div>

						 <div class="form-group">
							작성일
							<form:input type="text" class="form-control"
								name="brd_update_date" path="brd_date" readonly="true" />
						</div>

						<div class="modal-footer">
							<input type="submit" id="btn_update1"
								class="btn btn-sm btn-outline-secondary" value="글수정" /> <input
								type="reset" class="btn btn-sm btn-outline-secondary"
								value="초기화" />
						</div>

					</div>

				</div>
			</div>
		</div>
	</form:form>

</body>
<script>
	$(function() {

		$('#btn_update1').click(function() {
			alert("${sessionScope.SID}");
			if ("${sessionScope.SID}" != "${vo.brd_writer}") {
				alert("작성자만 수정 가능합니다!!");
				return false;
			}
			return true;
		});
	});
</script>
</html>