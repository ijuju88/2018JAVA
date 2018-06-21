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

			<table class="table">

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

				<c:choose>
					<c:when test="${vo.brd_file != null}">
						<tr>
							<th width="100px">이미지</th>
							<td><img src="${vo.brd_file}" width="90%" /></td>
						</tr>
					</c:when>
					<c:when test="${vo.brd_file == null}">
					</c:when>
				</c:choose>

				<tr>
					<th width="100px">조회수</th>
					<td>${vo.brd_hit1}</td>
				</tr>
				<tr>
					<th width="100px">날짜</th>
					<td>${vo.brd_date}</td>
				</tr>
				<tr>

					<td colspan='2' align="center"><a class="btn btn-primary"
						href="boardlist.do">글목록</a> <c:if test="${pno!= 0}">
							<a class="btn btn-primary" href="boardview.do?no=${pno}">이전글</a>

						</c:if> <c:if test="${pno== 0}">
							<a class="btn btn-primary disabled" href="boardview.do?no=${pno}">이전글</a>
						</c:if> <c:choose>
							<c:when test="${nno != 0}">
								<a class="btn btn-primary" href="boardview.do?no=${nno}">다음글</a>
							</c:when>
							<c:when test="${nno == 0}">
								<a class="btn btn-primary disabled"
									href="boardview.do?no=${nno}">다음글</a>
							</c:when>
						</c:choose> <a class="btn btn-primary" id="btn-update" href="#">글수정</a> <a
						href="#" id="btn-delete" class="btn btn-success">글삭제</a>
				</tr>
			</table>
		</div>

	</form>

	<form action="boarupdate.do" method="post"
		enctype="multipart/form-data">
		<div class="modal fade" id="updateModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-lebel="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div style="margin-bottom: 5px">
							<input type="text" name="no" class="form-control"
								placeholder="글번호" id="brd_no" name="brd_no" readonly />
						</div>
						<div style="margin-bottom: 5px">
							<input type="text" name="brd_title" class="form-control"
								id="brd_title" placeholder="제목" />
						</div>
						<div style="margin-bottom: 5px">
							<textarea rows="6" cols="75%" class="summernote" id="brd_content"
								name="brd_content"></textarea>
						</div>

						<div style="margin-bottom: 5px">
							<input type="text" class="form-control" name="brd_writer"
								id="brd_writer" readonly />
						</div>

						<div style="margin-bottom: 5px">
							<a href="#"> <img src="default.png" width="90%" id="brd_file" />
							</a> <input type="file" class="form-control" name="brd_file"
								id="imgfile" style="display: none;" />
						</div>

						<div style="margin-bottom: 5px">
							<input type="text" class="form-control" name="brd_hit1"
								id="brd_hit1" readonly />
						</div>

						<div style="margin-bottom: 5px">
							<input type="text" class="form-control" name="brd_date"
								id="brd_date" readonly />
						</div>

					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="수정" />
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<form action="boardelete.do" method="get">
		<div class="modal fade" id="deleteModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-lebel="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="no" value="${vo.brd_no}" /> <label>삭제하시겠습니까</label>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" value="삭제" />
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>


	<script>
		$(function() {

			$('.brd_content').summernote({
				height : 200, // 기본 높이값
				minHeight : null, // 최소 높이값(null은 제한 없음)
				maxHeight : null, // 최대 높이값(null은 제한 없음)
				focus : true, // 페이지가 열릴때 포커스를 지정함
				lang : 'ko-KR' // 한국어 지정(기본값은 en-US)

			});

			//삭제 모듈창
			$('#btn-delete').click(function() {
				$('#deleteModal').modal('show');
			});

			//수정모듈창
			$('#btn-update').click(function() {
				//alert("${sessionScope.SID}");
				if ("${sessionScope['SID'] == null}"=="true") {
					alert("로그인한 사람만 가능합니다!!");
					return false;
				} else if("${sessionScope.SID}" != "${vo.brd_writer}"){
					alert("작성자만 수정 가능합니다!!");
					return false;
				}else
					$('#updateModal').modal('show');
				return true;

			});

			//수정 모듈창이 화면에 표시되면....
			$('#updateModal').on('shown.bs.modal', function() {
				$.get('ajaxboarddone.do?no=' + '${vo.brd_no}', function(data) {

					$('#brd_no').val(data.brd_no);
					$('#brd_title').val(data.brd_title);
					$('#brd_content').val(data.brd_content);

					// @param {String} text
					$('.summernote').summernote('code', data.brd_content);

					$('#brd_writer').val(data.brd_writer);
					$('#brd_hit1').val(data.brd_hit1);
					$('#brd_date').val(data.brd_date);

					if (typeof data.brd_file != "undefined") {
						$('#brd_file').attr('src', data.brd_file);
					}
				}, 'json');
			});

			$('#brd_file').click(function() {
				$('#imgfile').click();

			});

			$('#imgfile').change(function() {
				var img = this;

				//파일첨부시
				if (img.files && img.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#brd_file').attr('src', e.target.result);
					};

					reader.readAsDataURL(img.files[0]);

				}

			});

		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>