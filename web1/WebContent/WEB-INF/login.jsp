<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 메뉴불러오기 -->
	<jsp:include page="header.jsp"></jsp:include>

	<form action="login.do" method="post">
		<div class="box600">
			<h4>로그인</h4>
			<hr />


			<div class="form-inline">
				<div style="width: 100px">
					<label>아이디</label>
				</div>
				<div style="margin-right: 10px; width: 60px;">
					<input type="text" class="inputcss" placeholder="아이디" name="id">
				</div>
			</div>

			<div class="form-inline">
				<div style="width: 100px">
					<label>비번</label>
				</div>
				<div style="margin-right: 10px; width: 60px;">
					<input type="password" class="inputcss" placeholder="비번" name="pw">
				</div>
			</div>


			<div class="out">
				<input type="submit" class="btn btn-success" value="로그인"
					id="btn_login"> <input type="reset" class="btn btn-success"
					value="초기화">
			</div>
		</div>
	</form>

	<script>
	//id가  btn_login인 개체를 찾고 클릭이 되는 경우
	$(function() {
		$("#btn_login").click(function () {
			
			//input 태그중 name값이 id와 pw의 입력값을 가져와 저장.
			var id= $('input[name=id]').val();
			var pw= $('input[name=pw]').val();
			
			//console창 출력
			console.log("입력값확인"+id+"/"+pw);
			
			
			if(id==''){
				//alert('아이디입력해주세요');
				
				swal({
					  type: 'error',
					  title: 'Oops...',
					  text: '아이디입력해주세요',
					  //footer: '<a href>Why do I have this issue?</a>',
				});
					
					
				$('input[name=id]').focus();
				return false;
			}if(pw==''){
				swal({
					  type: 'error',
					  title: 'Oops...',
					  text: '비번입력해주세요',
					  //footer: '<a href>Why do I have this issue?</a>',
				});
				
				$('input[name=pw]').focus();
				return false;
			}else
				
				return true;
			
		});
	});
	
	</script>
	<!-- 메뉴불러오기 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>