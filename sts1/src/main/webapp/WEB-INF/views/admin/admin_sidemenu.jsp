<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ page session="false"%>
<html>
<head>
</head>

<!-- Icons -->
<script src="resources/js/feather.min.js"></script>

<link rel="stylesheet" href="resources/css/bootstrap.min.css?var=2">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js?var=2"></script>
<script src="resources/js/bootstrap.min.js"></script>

<script>
	$(function() {
		feather.replace();

	});
</script>
<body>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">

					<!-- 옆메뉴 -->
					<ul class="nav flex-column">
						<li class="nav-item"><a
							${param.menu==0 || param.menu eq null ? 'class="nav-link active"' : 'class="nav-link"'}
							href="admin.do?menu=0"> <span data-feather="home"></span>
								Home <span class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a
							${param.menu==1 ? 'class="nav-link active"' : 'class="nav-link"'}
							href="admin.do?menu=1"> <span data-feather="shopping-cart"></span>
								물품관리
						</a></li>

						<li class="nav-item"><a
							${param.menu==2 ? 'class="nav-link active"' : 'class="nav-link"'}
							href="admin.do?menu=2"> <span data-feather="users"></span>
								회원관리
						</a></li>


					</ul>

				</div>
			</nav>
</body>

</html>