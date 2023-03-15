<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
   <!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
   <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
   <!-- Javascript files-->
   <script src="/main_temp/js/jquery.min.js"></script>
   <script src="/main_temp/js/bootstrap.bundle.min.js"></script>
   <script src="/main_temp/js/jquery-3.0.0.min.js"></script>
<!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>		 -->
   <!-- sidebar -->
<!--    <script src="/main_temp/js/jquery.mCustomScrollbar.concat.min.js"></script> -->
<!--    <script src="/main_temp/js/custom.js"></script> -->
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
   	  case "/check/":
   		  nowCtg = $("#ctgPlanner");
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
	.full_bg{
 		background:#BBAEA0; 
	}
	p{
		color:white;
	}
	.inputs {
	display: block;
	width: 100%;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.inputs::placeholder{
	color: #ced4da;
}

.inputs-m {
	display: inline;
	width: 49.5%;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.inputs-m::placeholder,
.inputs-s::placeholder{
	color: #ced4da;
}
	
.inputs-s {
	display: inline;
	width: 15%;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-group2 {
	margin: 0px 0px 25px
}

.btn-red {
  color: #fff;
  background-color: #E76F64;
  border-color: #E76F64;
}

.btn-gray {
  color: #fff;
  background-color: #ced4da;
  border-color: #ced4da;
}

.img_dark {
	width: 100%;
    margin-bottom: 25px;
    vertical-align: middle;
    filter: brightness(1);
    transition: 1s;
}

.wrapdiv_dark {
	width: 100%;
	position: relative;
}

.text_dark{
	position: absolute;
	top: 50%;
	left: 50%;
	width: 50%;
	transform: translate(-50%, -50%);
	text-align:center;
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
	                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
	                  <span class="navbar-toggler-icon"></span>
	                  </button>
	                  <div class="collapse navbar-collapse" id="navbarsExample04">
	                     <ul class="navbar-nav mr-auto">
	                        <li class="nav-item" id="ctgHome">
	                           <a class="nav-link" href="/main/home_form">Home</a>
	                        </li>
	                        <li class="nav-item" id="ctgPlanner">
	                           <a class="nav-link" href="/vendor/list">Planner</a>
	                        </li>
	                        <li class="nav-item" id="ctgCreate">
	                           <a class="nav-link" href="/main/create_form">Create My Page</a>
	                        </li>
	                        <li class="nav-item" id="ctgQna">
	                           <a class="nav-link" href="/qna/qnaList">QnA</a>
	                        </li>
	                        <c:choose>
										<c:when test="${empty loginInfo}">
										<!-- 로그인이 되어 있지 않은 경우 -->
											<li class="nav-item" id="ctgLogin">
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
</header>
	  