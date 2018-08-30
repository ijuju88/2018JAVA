<<<<<<< HEAD
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<head>
<style>
/* 지정석구분용 */
#tblV {
	background-color: #A5BCDA;
}

#tblR {
	background-color: #A3A8AE;
}

#tblS {
	background-color: #bbdefb;
}

#tblVA {
	background-color: #F9FBFB;
}

table.w3ls-table td {
	background-color: #fff;
}

/*checkbox 지정*/
input[type=checkbox] {
	width: 13px;
	margin-right: 14px;
	cursor: pointer;
}

input[type=checkbox]:before {
	content: "";
	width: 25px;
	height: 18px;
	border-radius: 5px;
	/* Safari 3-4, iOS 1-3.2, Android 1.6- */
	-webkit-border-radius: 5px;
	/* Firefox 1-3.6 */
	-moz-border-radius: 5px;
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	border: 3px solid #372F2C;
	box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
	-moz-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
		0px rgba(255, 255, 255, .8);
	-webkit-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
		0px rgba(255, 255, 255, .8);
	background-color: #ffffff;
}

input[type=checkbox]:checked:before {
	background-color: Green;
	font-size: 15px;
}
</style>
<meta charset='UTF-8'>
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/homeshowseat.css">

</head>
<body onload="onLoaderFunc()">
	<div class="container">

		<h3>Step 2</h3>
		<p>좌석선택</p>
		<div class="inputForm">
			<input type="hidden" id="Username" required value="${show_no}">
			<input type="hidden" id="Numseats" required min="0"
				value="${show_seatchoice}"> <input type="hidden" id="sc"
				required value="${scVOseatscVO1}"> <input type="hidden"
				id="row" required value="${scVOseatRow}"> <input
				type="hidden" id="col" required value="${scVOseatCol}">
			scVO1
		</div>

		<!-- seat layout -->

		<div class="seatStructure txt-center" style="overflow-x: auto;">
			<p id="notification"></p>
			<div class="screen">
				<h2 class="alert alert-warning" style="text-align: center;">Screen</h2>
			</div>
			<table id="seatsBlock" class="table">

				<tr>
					<td></td>

					<c:forEach var="i" begin="1" end="20" step="1">
						<td>${i}</td>
					</c:forEach>

					<td></td>
					<%-- <c:forEach var="j" begin="6" end="10" step="1">
						<td>${j}</td>
					</c:forEach> --%>

				</tr>

				<c:forEach var="seat" items="${AlphaArray}">


					<td>${seat}</td>
					<c:forEach var="i" begin="1" end="${fn:length(scVOseatCol)}"
						step="1" varStatus="status">
						<c:forEach var="j" begin="1" end="${fn:length(scVOseatRow)}"
							step="1">
							<c:if test="${status.index%5==0 && status.index!=0}">
								<td class="seatGap"></td>
							</c:if>
							<td>${i}${j}</td>
							<c:if test="${status.last}">
								</tr>
								<tr>
							</c:if>

						</c:forEach>
					</c:forEach>

					<%
					String[] group= null;
					if(request.getParameterValues("group") != null) group = request.getParameterValues("group") ;
					
					if(group != null && group.length > 0)
					{
					for(int inx = 0; inx < group.length; inx++)
					{
					out.println(group[inx]);
					}
					}
					%>
										<script>
					function tempTest()
					{
					var setdata = new Array(); 
					setdata[0] = new Array("test"); 
					setdata[1] = new Array("test__@");
					//이렇게 2차원 배열로 선언하고 선언된 배열에 값을 넣은 후에
					var url = "temp_test.jsp?group="+setdata;
					window.open(url); 
					
					}
					</script>

					<!-- <script>
			var sc=("#sc").val();
			var row=("#row").val();
			var col=("#col").val();
			
			for (int i = 0; i < sc.size(); i++) {
			for (int i2 = 0; i2 < sc.get(i).getSs_seatrow(); i2++) {
				/* for (int j2 = 1; j2 < scVO1.get(i).getSs_seatcol() + 1; j2++) {	
					col[i2][j2 - 1] = j2;	
					System.out.print(col[i2][j2 - 1] + " ");	
					}	
				System.out.println(); */
				}
			}
			
			</script> -->


					<%-- <c:forTokens items="${scVOseatRow}" delims="," var="name">
					
					</c:forTokens> --%>

					<%-- <c:forTokens items="${scVOseatCol}" delims="," var="name">
						<c:out value="${name}" />
						<p>
					</c:forTokens> --%>



					<%-- <c:forEach items="${scVOseatCol}" var="i" varStatus="status">
						<c:forEach var="j" items="${i}" >
							<c:if test="${status.index%5==0 && status.index!=0}">
								<td class="seatGap"></td>
							</c:if>
							<td>${j}</td>
							<c:if test="${status.last}">
								</tr>
								<tr>
							</c:if>

						</c:forEach>
					</c:forEach>  --%>

					<%-- <c:forEach var="i" items="${scVOseatCol}">
						<c:forEach var="j" items="${scVOseatCol[i]}" varStatus="status">
							<c:if test="${status.index%5==0 && status.index!=0}">
								<td class="seatGap"></td>
							</c:if>
							<td>${scVOseatCol[i][j]}</td>
							<c:if test="${status.last}">
								</tr>
								<tr>
							</c:if>

						</c:forEach>
					</c:forEach> --%>

					<%-- 	<c:forEach var="i" items="${scVOseatRow}">
						<c:set var="tempCnt">obj_${i}</c:set>
						<input type="text" id="obj" value="{obj[tempCnt]}" />
					</c:forEach>
 --%>

					<%-- <c:forEach var="movie" items="${scVOseatCol}" varStatus="status">
						<c:if test="${status.index%5==0 && status.index!=0}">
							<td class="seatGap"></td>
						</c:if>
						<td>${movie}</td>
								<c:if test="${status.last}">
							</tr><tr>
						</c:if></c:forEach> --%>

					<%-- <c:forEach items="${scVOseatRow}" varStatus="loop">
						<tr>
							<c:forEach items="${scVOseatCol}" varStatus="loop2">
								<td>${loop2.count+1}*${loop.count}=${(loop2.count+1)*loop.count}</td></c:forEach>
						</tr>
					</c:forEach> --%>



					<%-- 	<c:forEach var="snum" items="${scVOseatCol}">
						<td><c:set var="data" value="${seat}${snum}" /> <input
							type="checkbox" class="seats" name="${seat}${snum}"
							value="${seat}${snum}"
							<c:forEach var="array" items="${seatArray}" step="1">
								<c:if test="${data eq array}">checked="checked"</c:if></c:forEach>></td>
					</c:forEach> --%>

					<%-- <td><c:set var="data" value="${seat}${snum}" /> <input
									type="checkbox" class="seats" name="${seat}${snum}"
									value="${seat}${snum}"
									<c:forEach var="array" items="${seatArray}" step="1">
								<c:if test="${data eq array}">checked="checked"</c:if></c:forEach>></td> --%>


					<%-- <c:forEach var="snum" begin="1" end="${scVO1.ss_seatcol}" step="1">
								<td><c:set var="data" value="${seat}${snum}" />
								<input type="checkbox" class="seats" name="${seat}${snum}"
								value="${seat}${snum}"
								<c:forEach var="array" items="${seatArray}" step="1">
								<c:if test="${data eq array}">checked="checked"</c:if></c:forEach>	></td>
							</c:forEach>
							<td class="seatGap"></td> --%>

					<%-- <c:forEach var="snum2" begin="6" end="10" step="1">
								<td><c:set var="data2" value="${seat}${snum2}" />
								 <input type="checkbox" class="seats" name="${seat}${snum2}"
									value="${seat}${snum2}"
									<c:forEach var="array2" items="${seatArray}" step="1">
									<c:if test="${data2 eq array2}">checked="checked"</c:if></c:forEach>	></td>
							</c:forEach> --%>
					<!-- <td class="seatGap"></td> -->
					</tr>
				</c:forEach>
			</table>
			<button onclick="updateTextArea()">좌석선택하기</button>
			<button onclick="clearTextArea()">다시선택하기</button>
		</div>
		<!-- //seat layout -->
		<!-- details after booking displayed here -->
		<form action="homeshowseat2.do" method="post" id="step2form">
			<div class="displayerBoxes txt-center" style="overflow-x: auto;">
				<input type="hidden" id="show_id" name="show_no" required
					value="${show_no}">
				<table class="Displaytable w3ls-table" width="100%">
					<tr>
						<th>Number of Seats</th>
						<th>Seats</th>
					</tr>
					<tr>
						<td><textarea id="NumberDisplay" name="NumberDisplay"></textarea></td>
						<td><textarea id="seatsDisplay" name="seatsDisplay"></textarea></td>
					</tr>
				</table>
			</div>
		</form>
		<!-- //details after booking displayed here -->

		<ul class="list-inline pull-right">
			<li><button type="button" class="btn btn-default prev-step">Previous</button></li>
			<li><button type="button" class="btn btn-primary next-step">Save
					and continue</button></li>
		</ul>
	</div>
	</div>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>

	<script>
		$(function() {

			//버튼클릭시(이전, 다음)
			$(".prev-step").click(function() {
				history.back();
			});

			$(".next-step").click(function() {
				$("#step2form").submit();
			});

			//초기설정
			$(".inputForm").prop("disabled", true);
			$(".seatStructure").prop("disabled", false);
			document.getElementById("notification").innerHTML = "<b style='margin-bottom:0px;background:#ff9800;letter-spacing:1px;'>"
					+ " 좌석을 선택하여 주십시요!!</b>";

			$('#nameDisplay').attr("readonly", true);
			$('#NumberDisplay').attr("readonly", true);
			$('#seatsDisplay').attr("readonly", true);

			$('#seatsBlock :checked').each(function() {
				$("#seatsBlock :checked").prop("disabled", true);
			});

			//다음버튼숨기기
			$(".next-step").hide();
		});

		//처음설정 숨김글자 수정불가
		function onLoaderFunc() {
			$(".seatStructure").prop("disabled", true);
			$(".displayerBoxes").prop("disabled", true);
		}

		//다시선택하기 버튼클릭시
		function clearTextArea() {
			window.location.reload();
			//밑에 결과나오는 부분(text) 지우기
			//$('#nameDisplay').val("");
			//$('#NumberDisplay').val("");
			//$('#seatsDisplay').val("");

			//다음버튼비활성화
			//$(".next-step").hide();

			//$('.seats').prop("disabled", false);
			//$('.seats').prop('checked', false);
			onLoaderFunc();

		}

		//좌석선택하기 버튼클릭시
		function updateTextArea() {
			var allNameVals = [];
			var allNumberVals = [];
			var allSeatsVals = [];

			if ($("input:checked").length > 0) {
				$(".seatStructure").prop("disabled", true);

				$('.seats').prop("disabled", true);

				$('#seatsBlock :checked').each(function() {

					allSeatsVals.push($(this).val());
				});

				<c:forEach var="array" items="${seatArray}" varStatus="i">
				//allSeatsVals[${i.index}] = '${array}';
				allSeatsVals.splice(allSeatsVals.indexOf("${array}"), 1);
				</c:forEach>

				//alert(allSeatsVals);
				//Storing in Array
				allNumberVals.push(allSeatsVals.length);

				if (allNumberVals == 0) {
					alert("Please select 0 seats");
					window.location.reload();
				}
				//밑에 결과나오는 부분(text)
				$('#NumberDisplay').val(allNumberVals);
				$('#seatsDisplay').val(allSeatsVals);

				//다음버튼보이기
				$(".next-step").show();

			} else {
				alert("Please select 0 seats");
				window.location.reload();
			}
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<head>
<style>
/* 지정석구분용 */
tr:nth-child(2), tr:nth-child(3) {
	background-color: #A5BCDA;
}

tr:nth-child(4), tr:nth-child(5), tr:nth-child(6) {
	background-color: #A3A8AE;
}

tr:nth-child(7), tr:nth-child(8), tr:nth-child(9) {
	background-color: #bbdefb;
}

tr:nth-child(10), tr:nth-child(11), tr:nth-child(12), tr:nth-child(13) {
	background-color: #F9FBFB;
}

table.w3ls-table td {
	background-color: #fff;
}

/*checkbox 지정*/
input[type=checkbox] {
	width: 13px;
	margin-right: 14px;
	cursor: pointer;
}

input[type=checkbox]:before {
	content: "";
	width: 25px;
	height: 18px;
	border-radius: 5px;
	/* Safari 3-4, iOS 1-3.2, Android 1.6- */
	-webkit-border-radius: 5px;
	/* Firefox 1-3.6 */
	-moz-border-radius: 5px;
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	border: 3px solid #372F2C;
	box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
	-moz-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
		0px rgba(255, 255, 255, .8);
	-webkit-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
		0px rgba(255, 255, 255, .8);
	background-color: #ffffff;
}

input[type=checkbox]:checked:before {
	background-color: Green;
	font-size: 15px;
}
</style>
<meta charset='UTF-8'>
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/homeshowseat.css">

</head>
<body onload="onLoaderFunc()">
	<div class="container">

		<h3>Step 2</h3>
		<p>좌석선택</p>
		<div class="inputForm">
			<input type="hidden" id="Username" required value="${show_no}">
			<input type="hidden" id="Numseats" required min="1"
				value="${show_seatchoice}">
		</div>

		<!-- seat layout -->

		<div class="seatStructure txt-center" style="overflow-x: auto;">
			<p id="notification"></p>
			<div class="screen">
				<h2 class="alert alert-warning" style="text-align: center;">Screen</h2>
			</div>
			<table id="seatsBlock" class="table">

				<tr>
					<td></td>

					<c:forEach var="i" begin="1" end="5" step="1">
						<td>${i}</td>
					</c:forEach>

					<td></td>
					<c:forEach var="j" begin="6" end="10" step="1">
						<td>${j}</td>
					</c:forEach>

				</tr>

				<c:forEach var="seat" items="${AlphaArray}" step="1">
					<tr>
						<td>${seat}</td>

						<c:forEach var="snum" begin="1" end="5" step="1">
							<td><input type="checkbox" class="seats"
								value="${seat}${snum}"></td>
						</c:forEach>
						<td class="seatGap"></td>

						<c:forEach var="snum2" begin="6" end="10" step="1">
							<td><input type="checkbox" class="seats"
								value="${seat}${snum2}"></td>
						</c:forEach>

					</tr>
				</c:forEach>

			</table>
			<button onclick="updateTextArea()">좌석선택하기</button>
			<button onclick="clearTextArea()">다시선택하기</button>
		</div>
		<!-- //seat layout -->
		<!-- details after booking displayed here -->
		<div class="displayerBoxes txt-center" style="overflow-x: auto;">
			<table class="Displaytable w3ls-table" width="100%">
				<tr>
					<th>Name</th>
					<th>Number of Seats</th>
					<th>Seats</th>
				</tr>
				<tr>
					<td><textarea id="nameDisplay"></textarea></td>
					<td><textarea id="NumberDisplay"></textarea></td>
					<td><textarea id="seatsDisplay"></textarea></td>
				</tr>
			</table>
		</div>
		<!-- //details after booking displayed here -->

		<ul class="list-inline pull-right">
			<li><button type="button" class="btn btn-default prev-step">Previous</button></li>
			<li><button type="button" class="btn btn-primary next-step">Save
					and continue</button></li>
		</ul>
	</div>
	</div>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>

	<script>
		$(function() {

			//버튼클릭시(이전, 다음)
			$(".prev-step").click(function() {
				history.back();
			});

			$(".next-step").click(function() {
				window.location.href="homeshowseat3.do";
			});

			//초기설정
			$(".inputForm").prop("disabled", true);
			$(".seatStructure").prop("disabled", false);
			document.getElementById("notification").innerHTML = "<b style='margin-bottom:0px;background:#ff9800;letter-spacing:1px;'>"
					+ " 좌석을 선택하여 주십시요!!</b>";

			$('#nameDisplay').attr("readonly", true);
			$('#NumberDisplay').attr("readonly", true);
			$('#seatsDisplay').attr("readonly", true);

			//다음버튼숨기기
			$(".next-step").hide();
		});

		//처음설정
		function onLoaderFunc() {
			$(".seatStructure").prop("disabled", true);
			$(".displayerBoxes").prop("disabled", true);
		}

		//다시선택하기 버튼클릭시
		function clearTextArea() {
			//밑에 결과나오는 부분(text) 지우기
			$('#nameDisplay').val("");
			$('#NumberDisplay').val("");
			$('#seatsDisplay').val("");

			//다음버튼비활성화
			$(".next-step").hide();

			onLoaderFunc();
			$('.seats').prop("disabled", false);
			$('.seats').prop('checked', false);
		}

		//좌석선택하기 버튼클릭시
		function updateTextArea() {
			//alert($("input:checked").length);
			if ($("input:checked").length > 0) {
				$(".seatStructure").prop("disabled", true);

				$('.seats').prop("disabled", true);

				var allNameVals = [];
				var allNumberVals = [];
				var allSeatsVals = [];

				//Storing in Array
				allNameVals.push($("#Username").val());
				allNumberVals.push($("input:checked").length);
				$('#seatsBlock :checked').each(function() {
					allSeatsVals.push($(this).val());
				});

				//밑에 결과나오는 부분(text)
				$('#nameDisplay').val(allNameVals);
				$('#NumberDisplay').val(allNumberVals);
				$('#seatsDisplay').val(allSeatsVals);

				//다음버튼보이기
				$(".next-step").show();

			} else {
				alert("Please select " + ($("input:checked").length) + " seats")
			}
		}

		//선택한좌석수 구하기
		function myFunction() {
			alert($("input:checked").length);
>>>>>>> refs/remotes/origin/master
		}
	</script>
	<!-- //script for seat selection -->


</body>
</html>