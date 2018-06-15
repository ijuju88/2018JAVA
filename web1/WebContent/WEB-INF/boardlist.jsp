<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		${aaa}<br /> ${vo.brd_no} ${vo.brd_title} ${vo.brd_content}
		<table class="table">
			<thead>
				<tr align="center">
					<c:forEach var="tmp" items="${str}">
						<th>${tmp}</th>
					</c:forEach>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list}">
					<tr align="center">
						<td>${vo.brd_no}</td>

						<!-- 제목 글자수 제한 -->
						<c:choose>
							<c:when test="${fn:length(vo.brd_title)>10}">
								<td><a href="boardview.do?no=${vo.brd_no}"> 
								<c:out value="${fn:substring(vo.brd_title,0,10)}" /> ....
								</a></td>
							</c:when>
							<c:otherwise>
								<td><a href="boardup.do?no=10">${vo.brd_title}</a></td>
							</c:otherwise>
						</c:choose>
						<td>${vo.brd_writer}</td>
						<td>${vo.brd_hit}</td>
						<td>${vo.brd_date}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="boardwrite.do" class="btn btn-primary">글쓰기</a>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>