<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/m_header.jsp" %>
<style>
.a{
	height:500px;
}
.contact{
 min-height: 700px;
}
</style>
<script>
$(document).ready(function(){
	$("#userid").keyup(function(){
		$("#checkid").text("");
	});
	$("#username").keyup(function(){
		$("#checkname").text("");
	});
	$("#email").keyup(function(){
		$("#checkemail").text("");
	});
	
	$("#btnFindPw").click(function() {
		
		if($("#userid").val().trim() == ""){
			$("#checkid").text("아이디를 입력해주세요.").css("color", "red");
			$("#userid").focus();
			return false;
		} else if($("#username").val().trim() == ""){
			$("#checkname").text("이름을 입력해주세요.").css("color", "red");
			$("#username").focus();
			return false;
		} else if($("#email").val().trim()==""){
			$("#checkemail").text("이메일을 입력해주세요.").css("color", "red");
			$("#email").focus();
			return false;
		}
		
		
		var userid = $("#userid").val();
		var username = $("#username").val();
		var email = $("#email").val();
		var sData = {
			"userid" : userid,
			"username" : username,
			"email" : email
		};
		var url = "/user/findPw";
		$.post(url, sData, function(rData) {
			console.log(rData);
			if (rData == "") {
				alert("가입된 정보가 없습니다.");
				return;
			} else if (rData != "") {
				$("#userid").hide();
				$("#username").hide();
				$("#email").hide();
				$("#btnFindPw").hide();
				$("#div1").text("회원가입시 사용한 비밀번호는");
				$("#div2").text(rData + "입니다.");
			}
		});
	});

});
</script>
      <!-- end banner -->
      <div class="back_re">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     <h2>비밀번호 찾기</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!--  contact -->
      <div class="contact" style="padding-top:80px">
         <div class="container">
            <div class="row d_flex">
            <div class="col-md-3"></div>
               <div class="col-md-6" style="border:2px solid; padding:50px; text-align:center">
                  <form id="request" class="main_form">
                     <div class="row">
                        <div class="col-md-12" id="div1" style="color:#818383; font-weight:bold; font-size:20px">
                           <input class="contactus" placeholder="아이디" type="text" id="userid" name="userid"> 
                        </div>
                        <div id="checkid" style="padding-left:20px"></div>
                        
                        <div class="col-md-12" id="div2" style="color:#818383; font-weight:bold; font-size:20px">
                           <input class="contactus" placeholder="이름" type="text" id="username" name="username"> 
                        </div>
                        <div id="checkname" style="padding-left:20px"></div>
                        
                        <div class="col-md-12">
                           <input class="contactus" placeholder="이메일" type="email" id="email" name="email">                          
                        </div>
                        <div id="checkemail" style="padding-left:20px"></div>
                        
                       	<div class="col-md-12" style="padding-bottom:10px"><button type="button" id="btnFindPw" class="send_btn" style="max-width:580px; border-radius:20px;">비밀번호 찾기</button></div>
                     </div>
                  </form>
                  <div style="text-align:center">
			        <ul>
			          <li>
				          <a href="/user/findId" style="color:#E86B64; font-weight:bold; font-size:16px;">아이디 찾기</a>
				          <span style="color:#E86B64; padding-left:20px; padding-right:20px">/</span>
				          <a href="/user/login" style="color:#E86B64; font-weight:bold; font-size:16px">로그인</a>
				          <span style="color:#E86B64; padding-left:20px; padding-right:20px">/</span>
				          <a href="/user/register" style="color:#E86B64; font-weight:bold; font-size:16px">회원가입</a>
				      </li>
			        </ul>
			      </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end contact -->
<%@ include file="../include/m_footer.jsp" %>