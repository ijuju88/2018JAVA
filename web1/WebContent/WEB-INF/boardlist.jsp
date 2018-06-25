<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- jquery pagination plugin -->
<script src="js/jquery.twbsPagination-1.3.1_bs4.js"></script>

<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<title>${aaa}</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="form-inline justify-content-end">

			<select class="form-control" id="type-search" style="margin: 5px;">
				<option value="brd_title">제목</option>
				<option value="brd_content">내용</option>
				<option value="brd_writer">작성자</option>
			</select> <input type="text" class="form-control" placeholder="검색어 입력"
				id="text-search" /> <input type="submit" class="btn btn-success"
				value="검색 " />
		</div>


		${aaa}<br /> ${vo.brd_no} ${vo.brd_title} ${vo.brd_content}
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr align="center">
					<c:forEach var="tmp" items="${str}">
						<th>${tmp}</th>
					</c:forEach>

				</tr>
			</thead>
			<tbody class="thead-light">
				<c:forEach var="vo" items="${list}">
					<tr align="center">
						<td>${vo.brd_no}</td>

						<!-- 제목 글자수 제한 -->
						<c:choose>
							<c:when test="${fn:length(vo.brd_title)>10}">
								<td><a href="boardup.do?no=${vo.brd_no}"> <c:out
											value="${fn:substring(vo.brd_title,0,10)}" /> ....
								</a></td>
							</c:when>
							<c:otherwise>
								<td><a href="boardup.do?no=${vo.brd_no}">${vo.brd_title}</a></td>
							</c:otherwise>
						</c:choose>
						<td>${vo.brd_writer}</td>
						<td>${vo.brd_hit1}</td>
						<td>${vo.brd_date}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>

		<%-- <nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center" >
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				
				<c:forEach var="i" begin="1" end="${cnt}" step="1">
					<li class="page-item"><a class="page-link" href="boardlist.do?page=${i}">${i}</a></li>
				</c:forEach>
				
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav> --%>


		<ul id="pagination" class="pagination justify-content-center"></ul>

		<a href="boardwrite.do" class="btn btn-primary" id="boardwritechk">글쓰기</a>
	</div>

	<script>
		//페이징 라이브러리 사용
		$(function() {
			//페이징 라이브러리 사용
			$('#pagination').twbsPagination({
				totalPages : '${cnt}',
				visiblePages : 10,
				href : '?page={{number}}'
			});
			
			//id가 text-search인 곳에 키를 눌러지면..
			//event는 반환값
			$('#text-search').keyup(function(event){
				
				//아스코코드값으로 Enter에대한 번호를 찾아..
				//http://skmagic.tistory.com/66
				if(event.which == 13){
					//alert("Enter키");
					//var typeSearch = $("#type-search option:selected").text();  //이렇게 하면 선택한 내용이 나옴
					var typeSearch = $('#type-search').val();
					var textSearch = $('#text-search').val();
					
					//a태그를 발생시킴
					window.location.href="boardlist.do?page="+page+"&type="+typeSearch+"&text="+textSearch;
				}
				
			});

		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>