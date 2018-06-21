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
	
		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>