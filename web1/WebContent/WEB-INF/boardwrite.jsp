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
	<form action="boardwrite.do" method="post">
	<div class="box600">
		<h4><%=title%></h4>
		<div style="margin-bottom: 5px">
			<input type="text" name="title" class="form-control" placeholder="제목" />
		</div>
		<div style="margin-bottom: 5px">
			<textarea rows="6" cols="75%" name="content" id="summernote"></textarea>
		</div>

		<div style="margin-bottom: 5px">
			<input type="text" class="form-control" name="writer" placeholder="작성자" />
		</div>

		<div style="margin-bottom: 5px;">
			<input type="submit" class="btn btn-primary" value="글쓰기" /> <a
				class="btn btn-light" href="boardlist.do">글목록</a>
		</div>
	</div>
</form>	
  <script>
    $(document).ready(function() {
    	  $('#summernote').summernote({
    		  height: 200,          // 기본 높이값
    	      minHeight: null,      // 최소 높이값(null은 제한 없음)
    	      maxHeight: null,      // 최대 높이값(null은 제한 없음)
    	      focus: true,          // 페이지가 열릴때 포커스를 지정함
    	      lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
    		    
    		  });
    });
  </script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>