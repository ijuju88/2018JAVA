<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.swing.ImageIcon"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<title>Touch support</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="resources/admin/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
<script src="resources/admin/codebase/jquery.form.js" type="text/javascript"></script>

<!-- 달력 및 파일 라이브러리  https://docs.dhtmlx.com/-->
<script src="resources/admin/codebase/dhtmlxscheduler.js"
	type="text/javascript"></script>
<script src="resources/admin/codebase/dhtmlxscheduler_timeline.js"
	type="text/javascript"></script>

<script type="text/javascript"
	src="resources/admin/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
	src="resources/admin/plugins/timepicker/bootstrap-datetimepicker.js"
	type="text/javascript"></script>

<%
	String picurls = null;
	ImageIcon icon = new ImageIcon(picurls);
	String imgsrc = application.getRealPath("/img");
	File imgFile = new File(imgsrc);
%>
<script type="text/javascript" charset="utf-8">


var formatDate = scheduler.date.date_to_str("%Y-%m-%d %H:%i");

//달력나오는 부분
function init() {
	scheduler.clearAll(); //clears all events
	scheduler.config.drag_move = false; //drop막기
	
	//계단식 자료보기 설정
	scheduler.config.cascade_event_display = true;
	scheduler.config.cascade_event_count = 4;     
	scheduler.config.cascade_event_margin = 30; 
	
	scheduler.keys.edit_save = 32; //enter을 사용하기 위해 save버튼을 다른곳으로 돌림
	scheduler.config.xml_date = "%Y-%m-%d %H:%i";
	scheduler.config.details_on_dblclick = true; 
	scheduler.config.details_on_create = true;
	
	var sections=[
		  {key:1, label:"Room A"},
		  {key:2, label:"Room B"},
		  {key:3, label:"Room C"}
		];

		scheduler.createTimelineView({
		  name: "timeline1",
		  x_unit: "month",
		  x_date: "%M",
		  x_step: 1,
		  x_size: 12,
		  y_unit: sections,
		  y_property: "section_id",
		  render: "bar"
		});
		scheduler.date.timeline1_start = function(date){
		  return new Date(date.getFullYear(), 0, 1, 0, 0);
		};

		scheduler.createTimelineView({
		  name: "timeline2",  
		  x_unit: "day",
		  x_date: "%M %d",
		  x_step: 1,
		  x_size: 7,
		  y_unit: sections,
		  y_property: "section_id",
		  render: "bar"
		});
		scheduler.date.timeline2_start = function(date){
		  return new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay(), 0, 0);
		};

		scheduler.createTimelineView({
		  name:	"timeline3",
		  x_unit: "hour",
		  x_date: "%H:%i",
		  x_step: 2,
		  x_size: 8,
		  x_length: 12,
		  y_unit: sections,
		  y_property: "section_id",
		  render: "bar"
		});
		scheduler.date.timeline3_start = function(date){
		  return new Date(date.getFullYear(), date.getMonth(), date.getDate(), 8, 0);
		};


		scheduler.locale.labels.timeline1_tab = "Month";
		scheduler.locale.labels.timeline2_tab = "Week";
		scheduler.locale.labels.timeline3_tab = "Day";


		var last_used = new Date();
		document.querySelector("#scheduler_here").addEventListener("wheel", function(e){
		  //prevent too fast scrolling
		  var time = new Date();
		  if (time - last_used < 200) return;
		  last_used = time;
		  
		  //change mode
		  var state = scheduler.getActionData(e);
		  var mode = scheduler.getState().mode;
		  var num = mode.substr(8,1);
		  
		  if (state && state.date){
		    if (e.deltaY < 0)
		      num++;
		    else
		      num--;
		    
		    if (num>0 && num<4)
		      scheduler.setCurrentView(state.date, "timeline"+num);
		  }
		}); 

		scheduler.config.fix_tab_position = false;
		scheduler.init("scheduler_here",new Date(2017,7,16),"timeline1");

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
					"show_img1" :jdata[i].show_img1,
					"show_img2" :jdata[i].show_img2,
					"start_date" : (jdata[i].show_startdate).substring(0, 16),
					"end_date" : (jdata[i].show_enddate).substring(0, 16),
					"show_vipprice" :jdata[i].show_vipprice,
					"show_rprice" :jdata[i].show_rprice,
					"show_sprice" :jdata[i].show_sprice,
					"show_aprice" :jdata[i].show_aprice,
				} ];
				scheduler.parse(JSON.stringify(contentStr), "json");
				//alert(JSON.stringify(contentStr));
			}

		}
	});

};

//삽입부분 
var html = function(id) { return document.getElementById(id); }; //just a helper

	scheduler.showLightbox = function(id) {
		var d = new Date();

		var day_no = d.getFullYear() + "" + (d.getMonth() + 1)
				+ "" + d.getDate() + "" + d.getHours() + ""
				+ d.getMinutes() + "" + d.getSeconds();

		
		var ev = scheduler.getEvent(id);
		scheduler.startLightbox(id, html("my_form"));
		
		var sd=scheduler.getEvent(id).start_date;
		var ed=scheduler.getEvent(id).end_date;
		
		if (!(ev.text == "New event")) {
			alert(ev.show_img1);
			$("#show_no").val(ev.show_no);
			$("#show_title").val(scheduler.getEvent(id).text);
			$("#show_content").text(ev.content);
			
			var sd1=formatDate(sd);
			var ed1=formatDate(ed);
			
			$("#show_vipprice").val(ev.show_vipprice);
			$("#show_sprice").val(ev.show_sprice);
			$("#show_rprice").val(ev.show_rprice);
			$("#show_aprice").val(ev.show_aprice);
			
			$("#start_date").val(sd1);
			$("#end_date").val(ed1);

			$("#file_img1").val(ev.show_img1);
			$("#file_img2").val(ev.show_img2);


		} else {
			$("#show_no").val(day_no);
		}
		return true;

		$("#show_title").focus();
	};

	function save_form() {

		if (!$("#show_title").val()) {
			alert("Text must not be empty");
			return false;
		} else {
			//달력에 보일 일정 text설정
			alert($('#list_table tr td').eq(0).text());

			$('#realForm').submit();

		}
		return true;

		scheduler.endLightbox(true, html("my_form"));
	}
	function close_form() {
		$("#show_no").val("");
		$("#show_title").val("");
		$("#show_content").text("");

		$("#show_vipprice").val("");
		$("#show_rprice").val("");
		$("#show_sprice").val("");
		$("#show_aprice").val("");

		$("#start_date").val("");
		$("#end_date").val("");
		$("#grade").val("");
		$("#price").val("");
		$('#list_table tr td').remove();
		scheduler.endLightbox(false, html("my_form"));

	}

	function delete_event() {
		var event_id = scheduler.getState().lightbox_id;
		location.href = "adminshowseatdelete.do?show_no=" + $("#show_no").val();
		scheduler.endLightbox(false, html("my_form"));
		scheduler.deleteEvent(event_id);

	}
</script>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-11031269-1', 'auto');
	ga('send', 'pageview');
</script>

<script src="https://cdn.ravenjs.com/3.10.0/raven.min.js"></script>
<script>
	Raven.config('https://b506cc95e6244203a69070d518196d06@sentry.dhtmlx.ru/7')
			.install()
</script>
</head>



<body class="hold-transition sidebar-mini" onload="init();">
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


	<div id="scheduler_here" class="dhx_cal_container" style="width:100%; height:100%;">
	<div class="dhx_cal_navline">
		<div class="dhx_cal_prev_button">&nbsp;</div>
		<div class="dhx_cal_next_button">&nbsp;</div>
		<div class="dhx_cal_today_button"></div>
		<div class="dhx_cal_date"></div>
		<div class="dhx_cal_tab" name="timeline3_tab" style="left:140px;"></div>
		<div class="dhx_cal_tab" name="timeline2_tab" style="left:76px;"></div>
        <div class="dhx_cal_tab" name="timeline1_tab" style="left:4px;"></div>
	</div>
	<div class="dhx_cal_header">
	</div>
	<div class="dhx_cal_data">
	</div>
</div>
	<jsp:include page="adminfooter.jsp"></jsp:include>
	<jsp:include page="adminshowmodel.jsp"></jsp:include>
</body>
</html>
