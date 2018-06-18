<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>
	<%
		String title = (String) request.getAttribute("title");
	%> <%=title%>

</title>

</head>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<form action="boardview.do" method="post">
		<div class="container" align="center" style="border: 1px solid pink;">
			<h4><%=title%></h4>

			<table>

				<tr>
					<th width="100px">글번호</th>
					<td>${vo.brd_no}</td>
				</tr>
				<tr>
					<th width="100px">제목</th>
					<td>${vo.brd_title}</td>
				</tr>
				<tr>
					<th width="100px">작성자</th>
					<td>${vo.brd_writer}</td>
				</tr>
				<tr>
					<th width="100px">내용</th>
					<td>${vo.brd_content}</td>
				</tr>
				<tr>
					<th width="100px">이미지</th>
					<td><img src="${vo.brd_file}" width="90%" /></td>
				</tr>
				<tr>
					<th width="100px">조회수</th>
					<td>${vo.brd_hit}</td>
				</tr>
				<tr>
					<th width="100px">날짜</th>
					<td>${vo.brd_date}</td>
				</tr>
				<tr>

					<td colspan='2' align="center"><a class="btn btn-primary"
						href="boardlist.do">글목록</a> 
						
						<c:if test="${pno!= 0}">
							<a class="btn btn-primary" href="boardview.do?no=${pno}">이전글</a>

						</c:if> <c:if test="${pno== 0}">
							<a class="btn btn-primary disabled"  href="boardview.do?no=${pno}">이전글</a>
						</c:if> 
						
						<c:choose>
							<c:when test="${nno != 0}"> 
								<a class="btn btn-primary" href="boardview.do?no=${nno}">다음글</a>  
							</c:when>
							<c:when test="${nno == 0}"> 
								<a class="btn btn-primary disabled" href="boardview.do?no=${nno}">다음글</a>  
							</c:when>
						</c:choose>
						
						<a class="btn btn-primary" href="#">글수정</a> 
						<a class="btn btn-primary" href="#">글삭제</a></td>
				</tr>

			</table>

		</div>
	</form>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 200, // 기본 높이값
				minHeight : null, // 최소 높이값(null은 제한 없음)
				maxHeight : null, // 최대 높이값(null은 제한 없음)
				focus : true, // 페이지가 열릴때 포커스를 지정함
				lang : 'ko-KR' // 한국어 지정(기본값은 en-US)

			});
		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>