<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/edit.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<body>

	<div class="container">
		<div
			class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-light border-bottom box-shadow">

			<nav style="float: none; margin: 0 auto;">

				<p class="text-primary h5">
					<a class="btn btn-outline-primary" href="home.do">home</a> 회원정보수정
				</p>
			</nav>

		</div>


		<ul class="nav nav-mytabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">회원수정</a></li>
			<li class="nav-item"><a class="nav-link" id="history-tab"
				data-toggle="tab" href="#history" role="tab" aria-controls="history"
				aria-selected="false">아이디찾기</a></li>
		</ul>
		<div class="tab-content mytab-content" id="myTabContent">

			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<div class="container" style="width: 60%;">


					<form action="edit.do" method="post">

						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-user"></i>
								</span>
							</div>
							<input name="mem_id" class="form-control" type="text"
								value="${vo.mem_id}" readonly>
						</div>

						<!-- pw -->
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-lock"></i>
								</span>
							</div>
							<input class="form-control" placeholder="Create password"
								type="password" name="mem_pw">
						</div>

						<!-- name -->
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-child"></i>
								</span>
							</div>
							<input name="mem_name" class="form-control" placeholder="name"
								type="text" value="${vo.mem_name}">
						</div>

						<!-- age -->
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i
									class="fa fa-user-clock"></i>
								</span>
							</div>
							<input name="mem_age" class="form-control" placeholder="age"
								type="number" min="1" max="150" name="joinAge"
								value="${vo.mem_age}">
						</div>

						<!-- email -->
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-envelope"></i>
								</span>
							</div>
							<input name="mem_email" class="form-control"
								placeholder="Email address" type="email" value="${vo.mem_email}">
						</div>

						<!-- date -->
						<div class="form-group input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fas fa-calendar-alt"></i>
								</span>
							</div>
							<input name="mem_date" class="form-control" type="text"
								value="${vo.mem_date}" readonly>
						</div>

						<!-- form-group// -->
						<div class="form-group">
							<input type="submit" class="btn btn-primary btn-block"
								value="회원수정" id="btn_edit"> <input type="reset"
								class="btn btn-primary btn-block" value="초기화">
						</div>
					</form>
				</div>
			</div>


			<div class="tab-pane fade" id="history" role="tabpanel"
				aria-labelledby="history-tab">bbb</div>

		</div>
	</div>
</body>

<script>
$(function() {
	  let url = location.href.replace(/\/$/, "");
	 
	  if (location.hash) {
	    const hash = url.split("#");
	    $('#myTab a[href="#'+hash[1]+'"]').tab("show");
	    url = location.href.replace(/\/#/, "#");
	    history.replaceState(null, null, url);
	    setTimeout(() => {
	      $(window).scrollTop(0);
	    }, 400);
	  } 
	   
	  $('a[data-toggle="tab"]').on("click", function() {
	    let newUrl;
	    const hash = $(this).attr("href");
	    if(hash == "#home") {
	      newUrl = url.split("#")[0];
	    } else {
	      newUrl = url.split("#")[0] + hash;
	    }
	    newUrl += "/";
	    history.replaceState(null, null, newUrl);
	  });
	});
	
</script>
</html>