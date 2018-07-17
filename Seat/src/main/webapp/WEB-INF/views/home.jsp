<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>


<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<script src="resources/js/jquery-3.2.1.js"></script>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.slides.js"></script>
<script src="resources/js/holder.min.js"></script>

<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
<script type="text/javascript">
	
		 function callAjax() {
		        $.ajax({
		           url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20171110",
		           success : function(result) {
		           //영화 제목과 순위출력
		            for(var i=0; i<result['boxOfficeResult']['weeklyBoxOfficeList'].length; i++){
		                 document.write(result['boxOfficeResult']['weeklyBoxOfficeList'][i]['rank']+"위 : "+result['boxOfficeResult']['weeklyBoxOfficeList'][i]['movieNm'] +"<br>")
		            }
		           }
		        });
		     }

</script>
<button onclick="callAjax()">클릭</button>
</body>
</html>
