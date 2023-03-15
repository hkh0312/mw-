<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/m_header.jsp" %>    
<link rel="stylesheet" href="/css_hkh/mypage/mypage.css"/>

<script>
$(document).ready(function(){
	var path = window.location.href;
	console.log(path);
	var lastIndex = path.lastIndexOf("/");
	console.log(lastIndex);
	var category = path.substring(lastIndex + 1);
	console.log(category);
	switch(category){
	case "mypageMain" :
		$("ul.tabs li a").removeClass("active");
		$("#main").addClass("active");
		break;
	case "passwordCheck" :
		$("ul.tabs li a").removeClass("active");
		$("#modify").addClass("active");
		break;
	case "mypageModify" :
		$("ul.tabs li a").removeClass("active");
		$("#modify").addClass("active");
		break;
	case "mypageWithdraw" :
		$("ul.tabs li a").removeClass("active");
		$("#withdraw").addClass("active");
		break;
	}
	
	$(".li a").click(function(){
		var name = $(this).text();
		console.log(name);
		if(name=="나의 게시글"){
			location.href="/mypage/mypageMain";
		}else if(name=="회원정보수정"){
			location.href="/mypage/passwordCheck";
		}else if(name == "회원탈퇴"){
			location.href="/mypage/mypageWithdraw";
		}
	});
	
	
});
</script>
    
 <!-- end banner -->
 <div class="back_re">
    <div class="container">
       <div class="row">
          <div class="col-md-12">
             <div class="title">
                <h2>MYPAGE</h2>
             </div>
          </div>
       </div>
    </div>
 </div>
 <!--  contact -->
<div class="contact tabbable" style="background:white">
	<ul class="tabs" id="ul">
		<li style="padding:8px 16px; font-weight:bold; font-size:20px"><span style="color:#E77075">${loginInfo.username }</span>님 반갑습니다.</li>
		<li class="li"><a class="" id="main" data-toggle="tab" href="#">나의 게시글</a></li>
		<li class="li"><a class="" id="modify" href="#" data-toggle="tab">회원정보수정</a></li>
		<li class="li"><a class="" id="withdraw" href="#" data-toggle="tab">회원탈퇴</a></li>
	</ul>
    