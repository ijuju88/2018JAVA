<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<div class="container" align="center" style="border: 1px solid pink; ">
			<h4><%=title%></h4>

			<table >
				<tr>
					<th width="100px">글번호</th>
					<td>1</td>
				</tr>
				<tr>
					<th width="100px">작성자</th>
					<td>1212</td>
				</tr>
				<tr>
					<th width="100px">내용</th>
					<td>cxcxzczcxc
						<p>1212121212121212
					</td>
				</tr>
				<tr>
					<th width="100px">조회수</th>
					<td>2</td>
				</tr>
				<tr>
					<th width="100px">날짜</th>
					<td>2018/06/15 10:10:10</td>
				</tr>
				<tr>

					<td  colspan='2'align="center">
						<a class="btn btn-primary" href="boardlist.do">글목록</a>
						<a class="btn btn-primary" href="#">이전글</a>
						<a class="btn btn-primary" href="#">다음글</a>
						<a class="btn btn-primary" href="#">글수정</a>
						<a class="btn btn-primary" href="#">글삭제</a>
					</td>
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