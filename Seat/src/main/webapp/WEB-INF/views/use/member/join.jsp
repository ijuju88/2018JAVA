<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<style type="text/css">
.error {
	color: red;
}

.button {
	color: #000;
}

</style>
</head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="resources/js_jsp/join.js"></script>

<body>

	<form:form action="homejoin.do" method="post" modelAttribute="smVO"
		autocomplete="off">
		<!-- 아이디 -->
		<div class="form-group row mb-4">
			<label for="m_id" class="col-sm-2 col-form-label">ID(4~10 이내)</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" placeholder="id" id="m_id"
					name="m_id" value="${smVO1.m_id}" />
			</div>
			<div class="col-sm-5">
				<input type="button" class="btn btn-info" id="idck" value="아이디 체크">
			</div>
		</div>

		<div class="col-sm-10">
			<form:errors path="m_id" cssClass="error"></form:errors>
		</div>

		<!-- 비번 -->

		<div class="form-group row mb-4">
			<label for="m_pw" class="col-sm-2 col-form-label">Pw(6~12 이내)</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="m_pw" name="m_pw"
					placeholder="Password" value="${smVO1.m_pw}" />
			</div>
			<div class="col-sm-10">
				<form:errors path="m_pw" cssClass="error"></form:errors>
			</div>
		</div>

		<!-- 이름 -->
		<div class="form-group row mb-4">
			<label for="m_name" class="col-sm-2 col-form-label">Name</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="m_name" name="m_name"
					placeholder="name" value="${smVO1.m_name}"/>
			</div>
			<div class="col-sm-10">
				<form:errors path="m_name" cssClass="error" />
			</div>
		</div>

		<!-- 나이 및 생년월일 -->
		<div class="form-group row mb-4">
			<label for="m_jumin1" class="col-sm-2 col-form-label">생년월일(181011)</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="m_jumin1"
					name="m_jumin1" placeholder="180101"value="0" />
			</div>
			<div class="col-sm-10">
				<form:errors path="m_jumin1" cssClass="error" />
			</div>
		</div>


		<!-- 전화번호 -->
		<div class="form-group row mb-4">
			<label for="m_tel" class="col-sm-2 col-form-label">Tel</label>
			<div class="col-sm-10">
				<input type="tel" class="form-control" id="m_tel" name="m_tel"
					placeholder="010-0000-0000" value="${smVO1.m_tel}"/>
			</div>
			<div class="col-sm-10">
				<form:errors path="m_tel" cssClass="error" />
			</div>
		</div>


		<!-- Email -->
		<div class="form-group row mb-4">
			<label for="m_email" class="col-sm-2 col-form-label">Email</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="m_email" name="m_email"
					placeholder="Email" value="${smVO1.m_email}"/>
			</div>
			<div class="col-sm-10">
				<form:errors path="m_email" cssClass="error" />
			</div>

		</div>

		<!-- 주소 -->
		<div class="form-group row mb-4">
			<label for="m_zip" class="col-sm-2 col-form-label">우편번호</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="m_zip" name="m_zip"
					readonly />
			</div>
			<div class="col-sm-5">
				<input type="button" class="btn btn-info"
					onclick="openDaumPostcode()" value="주소검색">
			</div>
		</div>

		<div class="form-group row mb-4">
			<label class="col-sm-2 col-form-label">주소</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="m_addr1" name="m_addr1"
					placeholder="간략주소" readonly />
			</div>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="m_addr2" name="m_addr2"
					placeholder="상세주소" />
			</div>
			<div class="col-sm-10">
				<form:errors path="m_zip" cssClass="error" />
			</div>
			<div class="col-sm-10">
				<form:errors path="m_addr1" cssClass="error" />
			</div>
			<div class="col-sm-10">
				<form:errors path="m_addr2" cssClass="error" />
			</div>
		</div>



		<div class="form-group row mb-5">
			<div class="mx-auto">
				<input type="submit" class="btn btn-success joinok" value="전송" /> &nbsp;
				&nbsp; <input type="reset" class="btn" value="취소" />
			</div>
		</div>
	</form:form>
</body>


</html>

