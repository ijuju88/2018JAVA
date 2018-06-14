<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<!-- 메뉴불러오기 -->
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<%
		//받는곳은
		String a = (String) request.getAttribute("title");
		int b = (int) request.getAttribute("num");
	%>

	<form action="join.do" method="post">
		<div class="box600">
			<h4><%=a%>:<%=b%></h4>
			<hr />


			<div class="form-inline">
				<div style="width: 100px">
					<label>아이디</label>
				</div>
				<div style="margin-right: 10px;">
					<input type="text" class="inputidcss" placeholder="아이디"
						name="joinId" id="Id">
				</div>
				<div>
					<input type="button" class="btn btn-primary" value="중복확인"
						name="joinIdCh">
				</div>
			</div>

			<div class="form-inline">
				<div style="width: 100px">
					<label>비번</label>
				</div>
				<div style="margin-right: 10px; width: 100px;">
					<input type="password" class="inputcss" placeholder="비번"
						name="joinPw1" id="Pw">
				</div>
			</div>

			<div class="form-inline">
				<div style="width: 100px">
					<label>비번확인</label>
				</div>
				<div style="margin-right: 10px; width: 100px;">
					<input type="password" class="inputcss" placeholder="비번확인"
						name="joinPw2" id="PwConfirm">
				</div>
			</div>

			<div class="form-inline">
				<div style="width: 100px">
					<label>이름</label>
				</div>
				<div style="margin-right: 10px; width: 100px;">
					<input type="text" class="inputcss" placeholder="이름"
						name="joinName" id="Name">
				</div>
			</div>

			<div class="form-inline">
				<div style="width: 100px">
					<label>나이</label>
				</div>
				<div style="margin-right: 10px; width: 100px;">
					<input type="number" class="inputcss" placeholder="나이" min="1"
						max="150" name="joinAge" id="Age">
				</div>
			</div>

			<div class="form-inline">
				<div style="width: 100px">
					<label>이메일</label>
				</div>
				<div style="margin-right: 10px;">
					<input type="text" class="inputemailcss" placeholder="이메일"
						name="joinEmail1" id="Email">
				</div>
				@
				<div style="margin-right: 10px;">
					<select type="choice" name="joinEmail2" id="EmailDomain"
						style="height: 38px; width: 120px;" name="이메일주소">
						<option value="ch1" selected>없음</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</div>
			</div>

			<div class="out">
				<input type="submit" class="btn btn-success" value="회원가입"
					id="btn_join"> <input type="reset" class="btn btn-success"
					value="초기화">
			</div>
		</div>
	</form>

	<script>
		$(function() {
			$("#btn_join").click(
					function() {

						var id = $('input[name=joinId]').val();
						var pw = $('input[name=joinPw1]').val();
						var pwConfirm = $('input[name=joinPw2]').val();
						var name = $('input[name=joinName]').val();
						var age = $('input[name=joinAge]').val();
						var email1 = $('input[name=joinEmail1]').val();
						var email2 = $('#joinEmail2 option:selected').text();

						alert($('input[name=joinId]').attr('placeholder'));

						var joinAry = new Array(id, pw1, pw2, name, age,
								email1, email2);

						JoinChk(joinAry);

					});
		});

		function JoinChk(joinAry) {

			for (var i = 0; i < joinAry.length; i++) {

			}
		}
	</script>
	<!-- 메뉴불러오기 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>