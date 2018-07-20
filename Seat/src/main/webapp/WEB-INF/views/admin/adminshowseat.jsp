<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<title>Touch support</title>

<!-- Terrace skin -->
<!-- <link rel="stylesheet" href="resources/admin/codebase/dhtmlxscheduler.css"
	type="text/css" media="screen" title="no title" charset="utf-8"> -->
<link rel="stylesheet"
	href="resources/admin/codebase/dhtmlxscheduler_flat.css"
	type="text/css" media="screen" title="no title" charset="utf-8">
<link
	href="resources/admin/plugins/timepicker/bootstrap-datetimepicker.css"
	rel="stylesheet">
</head>
<style type="text/css" media="screen">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow: auto;
}

/*lightbox style
https://forum.dhtmlx.com/viewtopic.php?f=6&t=29526
*/

/*labels*/
.dhx_cal_light {
	font-size: 100%;
}

/*textarea*/
.dhx_cal_light textarea {
	background-color: rgb(238, 240, 246);
}

/*selects*/
.dhx_cal_light select {
	background-color: rgb(238, 240, 246);
	font-size: 30%;
}
</style>

<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/admin/codebase/dhtmlxscheduler.js"
	type="text/javascript"></script>


<script type="text/javascript"
	src="resources/admin/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
	src="resources/admin/plugins/timepicker/bootstrap-datetimepicker.js"
	type="text/javascript"></script>


<script type="text/javascript" charset="utf-8">
	$(function() {
		init();
	});
	var formatDate = scheduler.date.date_to_str("%Y-%m-%d %H:%i");

	//달력나오는 부분
	function init() {
		scheduler.clearAll(); //clears all events
		scheduler.keys.edit_save = 32; //enter을 사용하기 위해 save버튼을 다른곳으로 돌림
		scheduler.config.xml_date = "%Y-%m-%d %H:%i";
		scheduler.config.details_on_dblclick = true;
		scheduler.config.details_on_create = true;

		scheduler.init('scheduler_here', new Date(), "month");

		var contentStr = "";
		//달력에 데이터 넣기
		$.ajax({
			type : 'POST',
			url : 'ajax_adminshowseatlist.do', //데이터를 요청할 페이지
			dataType : 'json', //데이터 유형
			success : function(jdata) { //성공시 처리 함수, 인수는 위에서 data를 사용한 경우

				for (var i = 0; i < jdata.length; i++) {
					contentStr = [ {
						"text" : jdata[i].show_title,
						"show_no" : jdata[i].show_no,
						"content" : jdata[i].show_content,
						"start_date" : (jdata[i].show_startdate).substring(0,
								16),
						"end_date" : (jdata[i].show_enddate).substring(0, 16),
					} ];
					scheduler.parse(JSON.stringify(contentStr), "json");
					//alert(JSON.stringify(contentStr));
				}

			}
		});
	};

	//label 변경
	scheduler.locale.labels.section_ShowTitle = '공연명';
	scheduler.locale.labels.section_ShowContent = '공연내용';

	//다운로드칸 만들기
	scheduler.form_blocks["vault"] = {
		render : function(sns) { // sns - section configuration object
			return "";
		},
		set_value : function(node, value, ev, config) {
			// node - HTML object related to HTML defined above
			// value - value defined by the "map_to" property
			// ev - event object
			scheduler.form_blocks.vault.upload(config.name, ev.id);
			Â
		},
		get_value : function(node, ev) {
			// node - HTML object related to HTML defined above
			// event object
			return;
		},
		focus : function(node) {
			// node - HTML object related to HTML defined above
			Â
		},
		/*for initialization of Vault*/
		upload : function(name, event_id) {
			// name - container name
			// event_id - id of event
		}
	}
	//Lightbox 나오기전
	scheduler.attachEvent("onBeforeLightbox",
					function(id) {
						var d = new Date();

						var day_no = d.getFullYear() + "" + (d.getMonth() + 1)
								+ "" + d.getDate() + "" + d.getHours() + ""
								+ d.getMinutes() + "" + d.getSeconds();

						var ev = scheduler.getEvent(id);
						//alert(ev.text);

						if (!(ev.text == "New event")) {
							scheduler.getEvent(id).ShowNO = ev.show_no;
							scheduler.getEvent(id).ShowTitle = scheduler
									.getEvent(id).text;
							scheduler.getEvent(id).ShowContent = scheduler
									.getEvent(id).content;

							scheduler.updateEvent(id);
							//alert(parent_id);
						} else {
							scheduler.getEvent(id).ShowNO = day_no;
						}
						return true;

						return true;
					});

	//ShowNO 수정불가하게 설정(Lightbox 열려있을때)
	scheduler.attachEvent("onLightbox", function() {
		var section = scheduler.formSection("ShowNO");
		section.control.disabled = true;
	});

	scheduler.config.lightbox.sections = [ {
		name : "ShowNO",
		height : 30,
		map_to : "ShowNO",
		type : "textarea",
		focus : true
	}, {
		name : "ShowTitle",
		height : 50,
		map_to : "ShowTitle",
		type : "textarea",
		focus : true
	}, {
		name : "ShowContent",
		height : 200,
		type : "textarea",
		map_to : "ShowContent"
	},{
		name : "ShowFile",
		height : 200,
		type : "vault",
		map_to : "ShowFile"
	},

	{
		name : "ShowTime",
		height : 72,
		type : "time",
		time_format : [ '%Y', '%m', '%d', '%H:%i' ],
		map_to : 'ShowTime'
	} ];

	//save를 누르면...
	scheduler.attachEvent("onEventSave", function(id, ev, is_new) {

		if (!ev.ShowTitle) {
			alert("Text must not be empty");
			return false;
		} else {

			//달력에 보일 일정 text설정
			ev.text = ev.ShowTitle;

			var form = {
				"show_no" : ev.ShowNO,
				"show_title" : ev.ShowTitle,
				"show_content" : ev.ShowContent,
				"show_startdate" : formatDate(ev.start_date),
				"show_enddate" : formatDate(ev.end_date),
			};

			/* 저장*/
			$.ajax({
				type : 'POST',
				url : 'ajax_adminshowseat.do', //데이터를 요청할 페이지
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP_Method-Override" : "POST"
				},
				data : JSON.stringify(form), //요청할 페이지에 전송할 파라메터
				success : function(result) { //성공시 처리 함수, 인수는 위에서 data를 사용한 경우 
					location.replace("adminshowseat.do");
				}
			});

		}
		return true;
	});

	//삭제버튼을 클릭하면
	scheduler.attachEvent("onEventDeleted", function(id, ev) {
		var show_no = ev.ShowNO;
		location.href = "adminshowseatdelete.do?show_no=" + show_no;
	});
</script>

<body class="hold-transition sidebar-mini">
	<jsp:include page="admintitle.jsp"></jsp:include>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Calendar</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
							<li class="breadcrumb-item active">Calendar</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>


		<div id="scheduler_here" class="dhx_cal_container"
			style='width: 100%; height: 100%;'>
			<div class="dhx_cal_navline">
				<div class="dhx_cal_prev_button">&nbsp;</div>
				<div class="dhx_cal_next_button">&nbsp;</div>
				<div class="dhx_cal_today_button"></div>
				<div class="dhx_cal_date"></div>
				<div class="dhx_cal_tab" name="day_tab" style="right: 204px;"></div>
				<div class="dhx_cal_tab" name="week_tab" style="right: 140px;"></div>
				<div class="dhx_cal_tab" name="month_tab" style="right: 76px;"></div>
			</div>
			<div class="dhx_cal_header"></div>
			<div class="dhx_cal_data"></div>
		</div>

	</div>
	<jsp:include page="adminfooter.jsp"></jsp:include>

</body>
</html>
