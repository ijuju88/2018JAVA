<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//받는곳은
		String[] str=(String[])request.getAttribute("str");
	%>


	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<table class="table">
			<thead>
			<%for (String tmp:str) {%>
				<th><%=tmp%></th>
			<%} %>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < 10; i++) {
				%>
				<tr align="center">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>

				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<a href="boardwrite.do" class="btn btn-primary" >글쓰기</a>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>