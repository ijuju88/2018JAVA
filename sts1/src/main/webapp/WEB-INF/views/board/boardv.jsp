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
<body>
	<jsp:include page="../home/hometitle.jsp" />
	<div class="container" style="width: 60%;">

		<div
			class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-light border-bottom box-shadow">

			<nav class="my-2 my-md-0 mr-md-3">글보기</nav>

		</div>
		<form action="boardd.do" method="get" class="formBorad">
		<table class="table">
			<tr>
				<td style="width: 20%;">글번호</td>
				<td class="form-control">
				<input type="text" name="brd_view_no"
						id="brd_view_no"class="input-reploy-writer"
						style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"
						value="${vo.brd_no}"> 
						
			 </td>
			</tr>

			<tr>
				<td style="width: 20%;">글번호</td>
				<td class="form-control" id="brd_view_title">${vo.brd_title}</td>
			</tr>

			<tr>
				<td style="width: 20%;">글쓴이</td>
				<td class="form-control" id="brd_view_writer">${vo.brd_writer}</td>
			</tr>

			<tr>
				<td style="width: 20%;">글내용</td>
				<td class="form-control" id="brd_view_content">
					${fn:replace(vo.brd_content, newLineChar, "<br />")}</td>
			</tr>


			<tr>
				<td style="width: 20%;">조회수</td>
				<td class="form-control" id="brd_view_hit"><fmt:formatNumber
						value="${vo.brd_hit}" pattern="#,###" /></td>
			</tr>

			<tr>
				<td style="width: 20%;">날짜</td>
				<td class="form-control" id="brd_view_date"><c:set var="dt"
						value="${fn:split(vo.brd_date, ' ')}" /> ${dt[0]}</td>
			</tr>

			<tr>
				<td colspan="2" class="text-center"><a href="#" id="btn_update"
					class="btn btn-sm btn-outline-secondary">글수정</a> <a href="#"
					id="btn_delete" class="btn btn-sm btn-outline-secondary btn-board-delete">글삭제</a> <c:if
						test="${prev !=0}">
						<a href="boardv.do?brd_no=${prev}" class="btn btn-sm btn-primary">이전글</a>
					</c:if> <c:if test="${next !=0}">
						<a href="boardv.do?brd_no=${next}" class="btn btn-sm btn-primary">다음글</a>
					</c:if></td>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		</form>
		
		
		<form action="board_relpy_one.do" method="post">
			<textarea class="form-control" rows="3" id="prl_content"
				placeholder="댓글"></textarea>
			<input type="text" class="form-control" style="width: 50%;"
				id="prl_writer" value="${sessionScope.SID}" readonly> <input
				type="button" class="btn btn-sm btn-primary" id="btn_reply"
				value="작성">
		</form>

		<c:forEach var="vo" items="${rplist}" varStatus="status">
			<div class="card" style="margin-top: 5px; margin-bottom: 5px">
				<div class="card-body">
					${vo.prl_date} - <input type="text" name="prl_writer"
						id="prl_writer" class="input-reploy-writer"
						style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"
						value="${vo.prl_writer}"> <input type="hidden"
						name="prl_no" id="prl_no" value="${vo.prl_no}"
						class="input-reploy-no"> <a href="#"
						class="btn btn-sm btn-danger btn-delete-reploy">삭제</a>
					<hr />
					${vo.prl_content}

				</div>
			</div>

		</c:forEach>
	</div>
	<jsp:include page="../home/homefooter.jsp" />

	<script>
$(function () {
	$('#btn_update').click(function() {
		$('#update-board-modal').modal('show');
	});
	
	
	//글삭제
	 $('.btn-board-delete').click(function() {
			//alert("${sessionScope.SID}");
			 var idx=$(this).index('.btn-board-delete');
			
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
					   $('.formBorad').eq(idx).submit();
					  //window.location.href ="boardd.do?brd_no="+${vo.brd_no};
				  }
				});
			
			
		});  
	 
	 //글수정
	 $('#btn_reply').click(function () {
		 var bn=${vo.brd_no}; //글번호
		 var co=$('#prl_content').val(); //답글내용
		 var wr=$('#prl_writer').val(); //답글작성자
	
		$.post('board_relpy_one.do',{brd_no:bn, prl_content:co, prl_writer:wr}, function(data) {

			 if(data.ret == 'y'){
					window.location.reload(); //F5 refresh
				}	
			
			console.log(data);
				
			}, 'json');  
	});
	 
	  $('.btn-delete-reploy').click(function() {
			 var idx=$(this).index('.btn-delete-reploy');
			 var br_no = $('.input-reploy-no').eq(idx).val();
			 var br_wirter = $('.input-reploy-writer').eq(idx).val();
			 //alert("${sessionScope.SID}"+"/"+br_wirter);

				 if("${sessionScope.SID}" != br_wirter){
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
						  window.location.href ="board_relpy_delete_one.do?prl_no="+br_no+"&brd_no="+${vo.brd_no};
					  }
					});
					
				

		}); 
	
});


</script>
	<jsp:include page="boarde.jsp" />
</body>

</html>