<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>MW</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" href="/main_temp/css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" href="/main_temp/css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="/main_temp/css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="/main_temp/images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="/main_temp/css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<!-- Javascript files-->
<script src="/main_temp/js/jquery.min.js"></script>
<script src="/main_temp/js/bootstrap.bundle.min.js"></script>
<script src="/main_temp/js/jquery-3.0.0.min.js"></script>
<!-- sidebar -->
<!-- <script src="/main_temp/js/jquery.mCustomScrollbar.concat.min.js"></script> -->
<!-- <script src="/main_temp/js/custom.js"></script> -->
<!-- 스크립트 시작 -->
<script>
$(document).ready(function(){
	// 상단 메뉴 active
 	  var path = window.location.href;
 	  var lastIndex = path.lastIndexOf("/");
 	  var secondIndex = path.indexOf("/", 7);
 	  var category = path.substring(secondIndex, lastIndex+1);
	  var main_category = path.substring(lastIndex+1);
 	  if (category.includes("#")) { // 새로고침 눌렀을 때 #...이 붙음
 		  var sharpIndex = category.lastIndexOf("#");
 		  category = category.substring(0, sharpIndex);
 	  };
 	  var nowCtg;
 	  switch (category) {
 	  case "/main/": 
 		  if(main_category=="home_form"){
 			nowCtg = $("#ctgHome");
 		  }else if(main_category=="create_form"){
	   		 nowCtg = $("#ctgCreate");
 		  }
 		  break;
 	  case "/vendor/":
 		  nowCtg = $("#ctgPlanner");
 		  break;
 	  case "/create/":
 		  nowCtg = $("#ctgCreate");
 		  break;
 	  case "/tempH/":
 		  nowCtg = $("#ctgCreate");
 		  break;
 	  case "/qna/":
 		  nowCtg = $("#ctgQna");
 		  break;
 	  case "/guest/":
		  nowCtg = $("#ctgCreate");
		  break;
 	  }
	  var activeCtg = $(".nav-item.active");
	  if (activeCtg.length == 1) {
		  activeCtg.removeClass("active");
	  }
	  nowCtg.addClass("active");
});
</script>
<style>
p{
	color:#E76F64;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-menu {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 100px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-menu a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-menu a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-menu {
  display: block;
}

		
</style>
</head>
<!-- body -->
<body class="main-layout">
	<!-- loader  -->
	<!--       <div class="loader_bg"> -->
	<!--          <div class="loader"><img src="/images/loading.gif" alt="#"/></div> -->
	<!--       </div> -->
	<!-- end loader -->
	<!-- header -->
	<header class="full_bg">
		<!-- header inner -->
		<div class="header">
			<div class="container">
				<div class="row">
					<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
						<div class="full">
							<div class="center-desk">
								<div class="logo">
									<a href="/main/home_form">MW</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
						<nav class="navigation navbar navbar-expand-md navbar-dark ">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample04"
								aria-controls="navbarsExample04" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarsExample04">
								<ul class="navbar-nav mr-auto">
									<li class="nav-item" id="ctgHome"><a class="nav-link"
										href="/main/home_form">Home</a></li>
									<li class="nav-item" id="ctgPlanner"><a class="nav-link"
										href="/vendor/list">Planner</a></li>
									<li class="nav-item" id="ctgCreate"><a class="nav-link"
										href="/main/create_form">Create My Page</a></li>
									<li class="nav-item" id="ctgQna"><a class="nav-link"
										href="/qna/qnaList">QnA</a></li>
									<c:choose>
										<c:when test="${empty loginInfo}">
										<!-- 로그인이 되어 있지 않은 경우 -->
											<li class="nav-item">
											<a href="/user/login"><i class="nav-link fa fa-user"
												id="loginpage" aria-hidden="true">Login</i></a>
											</li>
										</c:when>
										<c:otherwise>
											<!-- 로그인이 된 경우 -->
											<!-- 관리자인 경우 -->
											<c:choose>
												<c:when test="${loginInfo.userid eq 'admin'}">
													<div class="dropdown">
														<ul class="navbar-nav mr-auto">
															<li class="nav-item"><a href="#" class="nav-link" style="color:#E76F64">관리자님 환영합니다.&nbsp<i class="fa fa-sort-desc" aria-hidden="true"></i></a>
														<ul class="dropdown-menu" style="right:0">
															<li><a href="/admin/list">관리자페이지로 가기</a></li>
															<li><a href="/user/logout">로그아웃</a></li>
														</ul>
														</li>
														</ul>
													</div>
												</c:when>
												<c:otherwise>
													<div class="dropdown">
														<ul class="navbar-nav mr-auto">
															<li class="nav-item"><a href="#" class="nav-link" style="color:#E76F64">${loginInfo.username}님 환영합니다.&nbsp<i class="fa fa-sort-desc" aria-hidden="true"></i></a>
														<ul class="dropdown-menu" style="right:0">
															<li><a href="/mypage/mypageMain">마이페이지</a></li>
															<li><a href="/user/logout">로그아웃</a></li>
														</ul>
														</li>
														</ul>
													</div>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- end header inner -->
		<!-- end header -->
		<!-- banner -->
		<section class="banner_main">
			<div id="myCarousel" class="carousel slide banner"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container">
							<div class="carousel-caption  banner_po">
								<div class="row">
									<div class="col-lg-8 col-md-9 ">
										<div class="build_box">
											<h1>
												<span class="orang">Merry</span><span class="orang">
													Wedding</span>
											</h1>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit, sed do eiusmod tempor incididunt ut laboreLorem ipsum
												dolor sit amet, consectetur adipiscing elit, sed do eiusmod
												tempor incididunt ut labore</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#myCarousel" role="button"
					data-slide="prev"> <i class="fa fa-angle-left"
					aria-hidden="true"></i> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#myCarousel" role="button"
					data-slide="next"> <i class="fa fa-angle-right"
					aria-hidden="true"></i> <span class="sr-only">Next</span>
				</a>
			</div>
		</section>
	</header>
	<!-- end banner -->
	<!-- play -->
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-md-2 col-sm-8 offset-sm-2"></div>
			</div>
		</div>
	</div>
	<div class="row" style="padding:20px">
		<div class="col-md-4">
			<div class="plan_bax text_align_center">
				<figure>
					<img src="/main_temp/images/WeddingPlanner.jpg" alt="#" style="height:334px;"/>
				</figure>
				<div id="ho_plan" class="plan_text" style="padding-bottom:75px; height:250px"> 
					<h3>웨딩플래너</h3>
					<p>스튜디오, 드레스, 메이크업, 예식장 등 결혼식에 필요한 것을 쉽게 찾고 저장하며 볼 수 있습니다.</p>
					<a class="read_more" href="/vendor/list">Read More</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="plan_bax text_align_center">
				<figure>
					<img src="/main_temp/images/CoupleViewingLaptop.jpg" alt="#"
						style="height: 334px;">
				</figure>
				<div id="ho_plan" class="plan_text" style="padding-bottom:75px; height:250px">
					<h3>사이트 제작</h3>
					<p>쉽고 편하게 사이트를 만들고 바래지 않는 추억을 남기세요</p>
					<a class="read_more" href="/main/create_form">Read More</a>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="plan_bax text_align_center">
				<figure>
					<img src="/main_temp/images/CreateTemplate.jpg" alt="#"
						style="height: 334px;">
				</figure>
				<div id="ho_plan" class="plan_text" style="padding-bottom:75px; height:250px">
					<h3>특별한 청첩장</h3>
					<p>결혼식에 오시는 손님들께 우리들의 이야기를 전해요.</p>
					<a class="read_more" href="/main/create_form">Read More</a>
				</div>
			</div>
		</div>
	</div>
	<!-- says -->
	<div class="says">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="titlepage">
						<h2>사이트 만든 후기를 남겨주세요</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div id="proj" class="carousel slide says_ban" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#proj" data-slide-to="0" class="active"></li>
							<li data-target="#proj" data-slide-to="1"></li>
							<li data-target="#proj" data-slide-to="2"></li>
							<li data-target="#proj" data-slide-to="3"></li>
							<li data-target="#proj" data-slide-to="4"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="container">
									<div class="carousel-caption relative3">
										<div class="row">
											<div class="col-md-12">
												<div class="readert">
													<div class="readert_img text_align_center">
														<figure>
															<img src="/main_temp/images/review1.jpg" alt="#" />
														</figure>
													</div>
													<div class="readert_text">
														<h3>도깨비 신부가 되었습니다.</h3>
														<p>
															우리 도깨비 남편 잠 잘생겼죠?<br> 도깨비 신부라서 너무 행복해요
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="container">
									<div class="carousel-caption relative3">
										<div class="row">
											<div class="col-md-12">
												<div class="readert">
													<div class="readert_img text_align_center">
														<figure>
															<img src="/main_temp/images/review2.jpg" alt="#" />
														</figure>
													</div>
													<div class="readert_text">
														<h3>너무 예쁜 결혼식이었어요</h3>
														<p>
														쉽고 빠르게 우리 결혼식 사진을 사이트에 담아서 너무 좋았습니다.
														<br>
													    친구들도 결혼식 할 때 사이트를 직접 만들어 보고 싶다고 했어요. 
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="container">
									<div class="carousel-caption relative3">
										<div class="row">
											<div class="col-md-12">
												<div class="readert">
													<div class="readert_img text_align_center">
														<figure>
															<img src="/main_temp/images/review3.jpg" alt="#" />
														</figure>
													</div>
													<div class="readert_text">
														<h3>너무 예쁜 결혼식이었어요</h3>
														<p>
														쉽고 빠르게 우리 결혼식 사진을 사이트에 담아서 너무 좋았습니다.
														<br>
													    친구들도 결혼식 할 때 사이트를 직접 만들어 보고 싶다고 했어요. 
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="container">
									<div class="carousel-caption relative3">
										<div class="row">
											<div class="col-md-12">
												<div class="readert">
													<div class="readert_img text_align_center">
														<figure>
															<img src="/main_temp/images/review4.png" alt="#" />
														</figure>
													</div>
													<div class="readert_text">
														<h3>말랑콩떡♥</h3>
														<p>
															인마이포켓 언제 들어올래? <br> 언제든지 열려있는데....★
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="container">
									<div class="carousel-caption relative3">
										<div class="row">
											<div class="col-md-12">
												<div class="readert">
													<div class="readert_img text_align_center">
														<figure>
															<img src="/main_temp/images/review5.jpg" alt="#" />
														</figure>
													</div>
													<div class="readert_text">
														<h3>보스베이비</h3>
														<p>
															우리 갓기! <br> 귀여워...
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<a class="carousel-control-prev" href="#proj" role="button"
								data-slide="prev"> <i class="fa fa-arrow-left"
								aria-hidden="true"></i> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#proj" role="button"
								data-slide="next"> <i class="fa fa-arrow-right"
								aria-hidden="true"></i> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end says -->
	<!--  contact -->
	<div class="contact">
		<div class="container">
			<div class="row"></div>
		</div>
	</div>
	<!-- end contact -->
	<!--  footer -->
	<footer>
		<div class="footer">
			<div class="copyright">
				<div class="container">
					<div class="row">
						<div class="col-md-8 offset-md-2">
                  	      <p>© 2023. All Right Reserved. Design by 울산kh정보교육원 자바클래스</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- end footer -->

</body>
</html>