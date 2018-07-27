<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<style>
#my_form {
	position: absolute;
	top: 100px;
	left: 200px;
	z-index: 10001;
	display: none;
	background-color: white;
	border: 2px outset gray;
	padding: 20px;
	font-family: Tahoma;
	font-size: 12pt;
	width: 60%;
	height: 80%;
	overflow: auto;
}

.labels{
width : 30%;
}

.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
</style>
<link href="resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="resources/admin/plugins/timepicker/bootstrap-datetimepicker.css"
	rel="stylesheet">
<title>Touch support</title>


<script src="resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="resources/js/bootstrap.min.js"></script>
<script
	src="resources/admin/plugins/timepicker/bootstrap-datetimepicker.js"
	type="text/javascript"></script>
</head>
<script>
$(function () {
	
	//파일명 입력시 text 파일명으로 바꾸기
	$("input[name=show_img1]").on("change", function () {

	    var file = this.files[0],
	    fileName = file.name,
	    fileSize = file.size;
	   //alert("Uploading: " + fileName + " @ " + fileSize + "bytes");
	    $("#file_img1").val($("#show_no").val()+"_"+fileName);
	});
	
	$("input[name=show_img2]").on("change", function () {

	    var file2 = this.files[0],
	    fileName2 = file2.name,
	    fileSize2 = file2.size;
	    //alert("Uploading: " + fileName + " @ " + fileSize + "bytes");
	    $("#file_img2").val($("#show_no").val()+"_"+fileName2);
	});
	

});

</script>
<body>

	<div id="my_form">

		<form action="adminshowseatedit.do" id="realForm" method="POST"
			enctype="multipart/form-data" style="text-align: center;">

			<div class="form-group row">
				<label for="show_no" class="col-sm-2 col-form-label labels">공연장</label>
				<div class="col">
				<select class="custom-select" name="show_id" id="show_id">
				    <option value="1">Main Hell</option>
				    <option value="2">Hell 1</option>
				    <option value="3">Hell 2</option>
				</select>
				</div>
				
				<div class="col">
					<input type="hidden" readonly class="form-control" id="show_no"
						name="show_no" style="display: none;">
				</div>
			</div>
	
			<div class="form-group row">
				<label for="show_title" class="col-sm-2 col-form-label labels">공연명</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="show_title"
						name="show_title" placeholder="공연명입력">
				</div>
			</div>

			<div class="form-group row">
				<label for="show_title" class="col-sm-2 col-form-label labels">VIP석가격</label>
				<div class="col-sm-10"><input type="text" class="form-control" id="show_vipprice"
						name="show_vipprice" placeholder="VIP석가격"></div>
			</div>
			
			<div class="form-group row">
				<label for="show_title" class="col-sm-2 col-form-label labels">R석가격</label>
				<div class="col-sm-10"><input type="text" class="form-control" id="show_rprice"
						name="show_rprice" placeholder="R석가격"></div>
			</div>
			
			<div class="form-group row">
				<label for="show_title" class="col-sm-2 col-form-label labels">S석가격</label>
				<div class="col-sm-10"><input type="text" class="form-control" id="show_sprice"
						name="show_sprice" placeholder="S석가격"></div>
			</div>
			
			<div class="form-group row">
				<label for="show_title" class="col-sm-2 col-form-label labels">A석가격</label>
				<div class="col-sm-10"><input type="text" class="form-control" id="show_aprice"
						name="show_aprice" placeholder="A석가격"></div>
			</div>

			<div class="form-group row">
				<label for="show_content" class="col-sm-2 col-form-label labels">공연설명</label>
				<div class="col-sm-10">
					<textarea rows="5" class="form-control" id="show_content"
						name="show_content"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label for="start_date" class="col-sm-2 col-form-label labels">시간</label>
			<div class="col">
					<input type='text' class="form-control" id='start_date' name="start_date" />
				<script type="text/javascript">
					$(function() {
						$('#start_date').datetimepicker();
					});
				</script>
				</div>~
				<div class="col">
					<input type='text' class="form-control" id='end_date' name="end_date" />
				<script type="text/javascript">
					$(function() {
						$('#end_date').datetimepicker();
					});
				</script>
				</div>
			</div>


			<div class="form-group row">
				<label for="show_img1" class="col-sm-2 col-form-label labels">파일</label>
				<div class="col">
				<label class="btn btn-primary btn-file"> 파일추가
					<input type="file" class="form-control" id="show_img1" name="show_img1" /> 
				</label>
				 <input type='text' class="form-control" id='file_img1' name="file_img1" readonly />
				 </div>
				 <div class="col">
				<label class="btn btn-primary btn-file"> 파일추가	
					<input type="file" class="form-control" id="show_img2" name="show_img2"/>
				</label>
				<input type='text' class="form-control" id='file_img2' name="file_img2" readonly/>
				</div>
			</div>

			<input type="button" class="btn btn-dark" name="save" value="Save"
				id="save" style='width: 100px;' onclick="save_form()"> <input
				type="button" class="btn btn-dark" name="close" value="Close"
				id="close" style='width: 100px;' onclick="close_form()"> <input
				type="button" class="btn btn-dark" name="delete" value="Delete"
				id="delete" style='width: 100px;' onclick="delete_event()">

		</form>
	</div>
</body>
</html>