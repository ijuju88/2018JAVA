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
						name="joinIdCh" id="dtn-idchk">
				</div>
			</div>

			<div class="form-inline">
				<div style="width: 100px">
					<label>비번</label>
				</div>
				<div style="margin-right: 10px; width: 100px;">
					<input type="password" class="inputcss" placeholder="비번"
						name="joinPw1" id="Pw1">
				</div>
			</div>

			<div class="form-inline">
				<div style="width: 100px">
					<label>비번확인</label>
				</div>
				<div style="margin-right: 10px; width: 100px;">
					<input type="password" class="inputcss" placeholder="비번확인"
						name="joinPw2" id="Pw2">
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
					<select type="choice" name="joinEmail2" id="EmailAddress"
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

						var id = $("#Id").val();
						var pw = $("#Pw1").val();
						var pwConfirm = $("#Pw2").val();
						var name = $("#Name").val();
						var age = $("#Age").val();
						var email = $("#Email").val();
						var emailAddress = $("#EmailAddress option:selected")
								.text();

						var joinAry = new Array(id, pw, pwConfirm, name, age,
								email, emailAddress);
						//alert(joinAry[0]+"/"+joinAry[1]);

						for (var i = 0; i < joinAry.length; i++) {
							if (joinAry[i] == "") {
								alert("I don't have a(n)" + join[i]
										+ "!! Please enter!");
								join[i].focus();
								return false;
							} else if (joinAry[1] != joinAry[2]) {
								alert("Your password is different.");
								join[i].focus();
								return false;
							} else if (joinAry[6].toString() == 'ch1') {
								alert('Please select an email address --;');
								return false;
							}
						}
						return;

						//JoinChk(joinAry);
					});

			/*
			xml과 json
			<xml>
				<data>abc</data>
				<id>iii</id>
			</xml>
			
			{"data":"abc", "id":"iii"}
			
			 */
			//doGet 호출
			$('#Id').keyup(function() {
				var idchk = $('#Id').val();
				//alert(idchk);
				if (idchk.length > 0) {
					$.get('ajaxidcheck.do?Id=' + idchk, function(data) {
						//document.write( "data: " + data );
						//console.log(data);

						if (data.ret == 'y') {
							$('#dtn-idchk').val('사용가능');
							$('#dtn-idchk').attr('class', 'btn btn-success');
						} else if (data.ret == 'n') {
							$('#dtn-idchk').val('사용불가');
							$('#dtn-idchk').attr('class', 'btn btn-warning');
						}
						console.log(data);
					}, 'json');
				} else {
					$('#dtn-idchk').val('중복확인');
					$('#dtn-idchk').attr('class', 'btn btn-primary');
				}

				/* 	//doPost 호출
					$.post('서버주소','전달값',function(data){
						
					},'json');
				 */

			});

		});

		/* 
		 function JoinChk(joinAry) {
		
		 for (var i = 0; i < joinAry.length; i++) {
		 if (join[i] == "") {
		 alert("I don't have a(n)"+join[i]+"!! Please enter!");
		 join[i].focus();
		 return false;
		 }else(join[1]!=join[2]){
		 alert("Your password is different.");
		 join[i].focus();
		 return false;
		 }else(join[6].toString()=='ch1'){
		 alert('Please select an email address --;');
		 return false;
		 }
		 return;
		 }
		
		 }    */
	</script>
	<!-- 메뉴불러오기 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>