<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>

<link href="resources/css/pricing.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet"href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" />

<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/js/jquery.slides.js"></script>
<script src="resources/js/holder.min.js"></script>
<script src="resources/js/bootstrap.js"></script>


</head>
<body>
	<jsp:include page="../home/hometitle.jsp" />

	<div class="container">
		<form id="boardForm" name="boardForm" method="post">
			<table class="table table-striped table-hover" id="tablepage">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${list}" varStatus="status">
						<tr>
							<td>${result.brd_no}</td>
							<td><a href='boardv.do?brd_no=${result.brd_no}'>${result.brd_title}</a></td>
							<td>${result.brd_writer}</td>
							<td>${result.brd_hit}</td>
							<td>${result.brd_date}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="listPager"></div>

			<div>
				<a href='boardw.do' class="btn btn-primary">글쓰기</a>
			</div>
		</form>
		<div class="container"></div>
		<jsp:include page="../home/homefooter.jsp" />

		<script
			src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script
			src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
		<script>
/*  http://egloos.zum.com/purunjong/v/2493803 */
    $(function() {
    	$('#tablepage').DataTable({
    		"order" : [[0, "desc"]]
    		,"aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]]
    		,"language" : lang_kor
    	  
    	});
    });
		
		
    // Korean
    var lang_kor = {
    		   "sEmptyTable":     "데이터가 없습니다",
    		   "sInfo":           "_START_ - _END_ / _TOTAL_",
    		   "sInfoEmpty":      "0 - 0 / 0",
    		   "sInfoFiltered":   "(총 _MAX_ 개)",
    		   "sInfoPostFix":    "",
    		   "sInfoThousands":  ",",
    		   "sLengthMenu":     "페이지당 줄수 _MENU_",
    		   "sLoadingRecords": "읽는중...",
    		   "sProcessing":     "처리중...",
    		   "sSearch":         "검색:",
    		   "sZeroRecords":    "검색 결과가 없습니다",
    		   "oPaginate": {
    		       "sFirst":    "처음",
    		       "sLast":     "마지막",
    		       "sNext":     "다음",
    		       "sPrevious": "이전"
    		   },
    		   "oAria": {
    		       "sSortAscending":  ": 오름차순 정렬",
    		       "sSortDescending": ": 내림차순 정렬"
    		   }
    		}

 </script>
</body>
</html>
