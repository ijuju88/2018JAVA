<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page session="false"%>
<html>
<head>
<title>관리자페이지</title>
</head>



<link rel="stylesheet" href="resources/css/dashboard.css">
<!-- Icons -->
<script src="resources/js/feather.min.js"></script>


<link rel="stylesheet" href="resources/css/dashboard.css">

<link rel="stylesheet" href="resources/css/bootstrap.min.css?var=2">
<script src="resources/js/jquery-3.2.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js?var=2"></script>
<script src="resources/js/bootstrap.min.js"></script>

<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
<body>
	</div>
	<h1 class="h2">회원관리</h1>
	<input type="button" class="btn btn-primary" id="admin_member_update_batch" value="전체수정">
	<div class="table-responsive">

		<form:form action="admin_member_update_batch.do" method="post" modelAttribute="mlist" id="form_admin_member_update_batch">
			<table class="table table-striped table-sm"  >
				<thead align="center">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>나이</th>
						<th>이메일주소</th>
						<th>관심사</th>
						<th>가입일</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody align="center">
					<tr>
						<c:if test="${empty mlist.list}">
							<td colspan="7">내용없음!!</td>
					</tr>
					</c:if>
					<c:if test="${! empty mlist.list}">
						<c:forEach var="mDAO" items="${mlist.list}" varStatus="i">
							<td><form:input type="text" id="admin_mem_id"
									path="list[${i.index}].mem_id" readonly="true"/></td>
							<td><form:input type="text" id="admin_mem_name"
									path="list[${i.index}].mem_name" /></td>
							<td><form:input type="text" id="admin_mem_age"
									path="list[${i.index}].mem_age" /></td>
							<td><form:input type="text" id="admin_mem_email"
									path="list[${i.index}].mem_email" /></td>
							<td><form:input type="text" id="admin_mem_item"
									path="list[${i.index}].mem_item" readonly="true" /></td>
							<td><form:input type="text" id="admin_mem_date"
									path="list[${i.index}].mem_date" readonly="true" /></td>
							<td><a href="#" class="btn btn-sm btn-outline-secondary">차단</a>
								<a href="#" class="btn btn-sm btn-outline-secondary">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</form:form>
	</div>
	<script>
	$(function() {
	
		$('#admin_member_update_batch').click(function(){
 
			 swal({
				  title: '수정',
				  text: "수정할건가요?",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '할겁니다'
				}).then((result) => {
				  if (result.value) {
					  alert("!!!");
					$("#form_admin_member_update_batch").submit();
				  }
				});
			 
		});	
		
	});
</script>
</body>

</html>