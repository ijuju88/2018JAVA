<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="resources/js/jquery-3.2.1.js"></script>
</head>
<body>
<c:choose>
			<c:when test="${sessionScope.SID eq null}">
			<h3>잘못된 접근입니다...</h3>
			</c:when>
			<c:otherwise>

	<jsp:include page="../admintitle.jsp"></jsp:include>
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0 text-dark">회원관리</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
							<li class="breadcrumb-item active">회원관리</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">회원정보</h3>

					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>순번</th>
									<th>아이디</th>
									<th>회원명</th>
									<th>회원나이</th>
									<th>전화번호</th>
									<th>생년월일</th>
									<th>우편번호</th>
									<th>주소</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="vo" items="${Memberlist}" varStatus="status">
								<tr>
									<th>${vo.m_no}</th>
									<th>${vo.m_id}</th>
									<th>${vo.m_name}</th>
									<th>${vo.m_age}</th>
									<th>${vo.m_tel}</th>
									<th>${vo.m_jumin1}</th>
									<th>${vo.m_zip}</th>
									<th>${vo.m_addr1}</th>
									<th>${vo.m_date}</th>
								</tr>
							</c:forEach>
							</tbody>
						
						</table>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col -->
		</div>
</div>

<a class="btn btn-primary btn-block toggle-vis" style="color: white;" data-column="1">아이디</a> 
<a class="btn btn-primary btn-block toggle-vis" style="color: white;" data-column="2">회원명</a>  
<a class="btn btn-primary btn-block toggle-vis" style="color: white;" data-column="3">회원나이</a>  
<a class="btn btn-primary btn-block toggle-vis" style="color: white;" data-column="4">전화번호</a> 
			
<a class="btn btn-primary btn-block toggle-vis" style="color: white;" data-column="5">생년월일</a>
<a class="btn btn-primary btn-block toggle-vis" style="color: white;" data-column="6">우편번호</a>
<a class="btn btn-primary btn-block toggle-vis" style="color: white;" data-column="7">주소</a>
<a class="btn btn-primary btn-block toggle-vis" style="color: white;" data-column="8">가입일</a>
</section>

	</div>


	<jsp:include page="../adminfooter.jsp"></jsp:include>
	</c:otherwise></c:choose>
	<!-- DataTables -->
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<!-- page script -->
	<script>
		$(function() {
			var table = $('#example1').DataTable({
				"autoWidth" : false,
				"order" : [ [ 0, "desc" ] ],
				"aLengthMenu" : [ [ 5, 10, 25, -1 ], [ 5, 10, 25, "All" ] ],
				"language" : lang_kor,
				"columnDefs": [
		            {
		                "targets": [ 3 ],
		                "visible": false,
		                "searchable": false
		            },
		            {
		                "targets": [ 4 ],
		                "visible": false,
		                "searchable": false
		            },
		            {
		                "targets": [ 5 ],
		                "visible": false,
		                "searchable": false
		            },
		            {
		                "targets": [ 6 ],
		                "visible": false,
		                "searchable": false
		            },
		            {
		                "targets": [ 8 ],
		                "visible": false,
		                "searchable": false
		            }
		        ]
			
			});
			
	
			$('a.toggle-vis').on( 'click', function (e) {
			  e.preventDefault();
			 
			  // Get the column API object
			  var column = table.column( $(this).attr('data-column') );
			 
			  // Toggle the visibility
			  column.visible( ! column.visible() );
			} );
			
			
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