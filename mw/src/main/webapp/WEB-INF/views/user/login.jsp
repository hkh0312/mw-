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
	if("${register_result}" == "success"){
		alert("회원가입되었습니다. 로그인해주세요.");
	}
	
	if("${login_result}" =="fail"){
		alert("아이디 혹은 비밀번호가 맞지 않습니다.");
	}
	
	if("${withdraw_result}" == "true"){
		alert("회원탈퇴가 완료되었습니다.");
	}


});
  </script>
      <!-- end banner -->
      <div class="back_re">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     <h2>LOGIN</h2>
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
               <div class="col-md-6">
                  <form id="request" class="main_form" action="/user/login" method="post">
                     <div class="row">
                        <div class="col-md-12 ">
                           <input class="contactus" placeholder="아이디" type="text" name="userid" value="${cookie.userid.value}"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="비밀번호" type="password" name="userpw">                          
                        </div>
                        <div class="col-md-12" style="color:#818383; font-weight:bold; font-size:16px">
                        	<input type="checkbox" id="idCheck" name="saveId"
                        		<c:if test="${not empty cookie.userid }">
                        		checked
                        		</c:if>
                        	>
                        	<label>아이디 저장</label></div>
                       	<div class="col-md-12" style="padding-bottom:10px"><button type="submit" class="send_btn" style="max-width:580px; border-radius:20px;">로그인</button></div>
                     </div>
                  </form>
                  <div style="text-align:center">
			        <ul>
			          <li>
				          <a href="/user/register" style="color:#E86B64; font-weight:bold; font-size:16px;">회원가입</a>
				          <span style="color:#E86B64; padding-left:20px; padding-right:20px">/</span>
				          <a href="/user/findId" style="color:#E86B64; font-weight:bold; font-size:16px">아이디 찾기</a>
				          <span style="color:#E86B64; padding-left:20px; padding-right:20px">/</span>
				          <a href="/user/findPw" style="color:#E86B64; font-weight:bold; font-size:16px">비밀번호 찾기</a>
				      </li>
			        </ul>
			      </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end contact -->
<%@ include file="../include/m_footer.jsp" %>