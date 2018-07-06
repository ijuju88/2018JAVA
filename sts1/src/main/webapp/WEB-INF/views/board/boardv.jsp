<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<jsp:include page="../home/hometitle.jsp" />
	<div class="container" style="width: 60%;">

		<div
			class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-light border-bottom box-shadow">

			<nav class="my-2 my-md-0 mr-md-3">글보기</nav>

		</div>
		<table class="table">
			<tr>
				<td>글번호</td>
				<td class="form-control" id="brd_view_no">${vo.brd_no}</td>
			</tr>

			<tr>
				<td>글제목</td>
				<td class="form-control" id="brd_view_no">${vo.brd_no}</td>
			</tr>

			<tr>
				<td>글번호</td>
				<td class="form-control" id="brd_view_title">${vo.brd_title}</td>
			</tr>

			<tr>
				<td>글제목</td>
				<td class="form-control" id="brd_view_writer">${vo.brd_writer}</td>
			</tr>

			<tr>
				<td>글내용</td>
				<td class="form-control" id="brd_view_content">
				${fn:replace(vo.brd_content, newLineChar, "<br />")}
				</td>
			</tr>

			
			<tr>
				<td>조회수</td>
				<td class="form-control" id="brd_view_hit">
					<fmt:formatNumber value="${vo.brd_hit}" pattern="#,###" />
				</td>
			</tr>
			
			<tr>
				<td>조회수</td>
				<td class="form-control" id="brd_view_date">
				<c:set var="dt" value="${fn:split(vo.brd_date, ' ')}"/>
				날짜 : ${dt[0]}
				</td>
			</tr>

			<tr>
				<td colspan="2" class="text-center">
				<a href="#" id="btn_update" class="btn btn-sm btn-outline-secondary">글수정</a>
				<a href="#" id="btn_delete" class="btn btn-sm btn-outline-secondary">글삭제</a>
				</td>	
			</tr>
		</table>
	</div>
	<jsp:include page="../home/homefooter.jsp" />

	<script>
$(function () {
	$('#btn_update').click(function() {
		$('#update-board-modal').modal('show');
	});
	
	 $('#btn_delete').click(function() {
			//alert("${sessionScope.SID}");
			
			
			if("${sessionScope.SID}" != "${vo.brd_writer}"){
				alert("작성자만 삭제 가능합니다!!");
				return false;
			}
			
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
					  window.location.href ="boardd.do?brd_no="+${vo.brd_no};
				  }
				});
			
			
		});  
	
});


</script>
	<jsp:include page="boarde.jsp" />
</body>

</html>