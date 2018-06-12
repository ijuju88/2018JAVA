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
						name="joinIdCh" onclick="idChk(this.form);">
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
					<input type="password" class="inputcss" placeholder="비번"
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
					<select type="choice" name="EmailDomain" id=""
						EmailDomain"
						style="height: 38px; width: 120px;"
						name="이메일주소">
						<option value="ch1" selected>없음</option>
						<option value="ch2">naver.com</option>
						<option value="ch3">gmail.com</option>
					</select>
				</div>
			</div>

			<div class="out">
				<!-- <input type="submit" class="btn btn-success" value="회원가입"
					onclick="joinCheck();" >  -->
					<input type="submit" class="btn btn-success" value="회원가입"
					id="btn_join"> 
					<input type="reset"
					class="btn btn-success" value="초기화">
			</div>
		</div>
	</form>

	<script>
		$(function() {
			$("#btn_join").click(function () {
				
			});
		});
	
		/* function joinCheck() {
			var id = document.getElementById("Id");
			var pw1 = document.getElementById("Pw");
			var pw2 = document.getElementById("PwConfirm");
			var name = document.getElementById("Name");
			var age = document.getElementById("Age");
			var email1 = document.getElementById("Email")
			var email2 = document.getElementById("EmailDomain");

			var emailSelect = email2.options[email2.selectedIndex].value;

			var joinAry = new Array(id, pw1, pw2, name, age, email1,
					emailSelect);
			chk(joinAry);

			//var idCheck=document.getElementById("joinIdCh");

			/*
			var idReg =/^[a-z0-9_-]\w{6,15}$/;//영어소문자 + 숫자 6-15자 이내
			var AgeReg=/[0-9]{2,3}/; //나이 유효성검사 실습함
			
			if( !idReg.test(id) ) {
			    alert("아이디는 영문자로 시작하는 6~15자 영문자 또는 숫자이어야 합니다.");
			    return;
			}
			
			 */

			return;
		}

		function chk(joinAry){
			alert(joinAry[4].value);
			for(var i in joinAry){
				if(joinAry[i].value==""){
					alert(""+joinAry[i].name+" 입력 안됨");
					joinAry[i].focus();
					return;
				}else if(joinAry[1].value!=joinAry[2].value){
					alert("비번이 다름");
					joinAry[1].focus();
					return;
				}
				
			}
			if(joinAry[6].toString()=='ch1'){
				alert("이메일주소 입력 안됨");
				joinAry[5].focus();
				return;
			}
			
		} */
	</script>

	<!-- 메뉴불러오기 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>