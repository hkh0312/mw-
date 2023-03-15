<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/mypage_menu.jsp" %>
<script>
$(document).ready(function(){
	var regPw = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var regPhone = /^01([0|1|6|7|8|9]?)?([0-9])?([0-9]){9}$/;
	
	var userModify_result = "${userModify_result}";
	if(userModify_result == "true"){
		alert("회원정보를 수정하였습니다.");
	}else if (userModify_result == "false"){
		alert("회원정보 수정에 실패했습니다.");
	}
	
	// 비밀번호 유효성검사
	$("#userpw").keyup(function(){
		var userpw = $("#userpw").val();
		if(!regPw.test(userpw)){
			$("#checkpassword").text("문자, 숫자, 특수문자 포함 8~20자를 입력해주세요.").css("color", "red");
			return false;
		} else{
			$("#checkpassword").text("");
		}
	});
	
	// 비밀번호 일치 여부
	$("#checkuserpw").keyup(function(){
		var userpw = $("#userpw").val();
		var checkuserpw = $("#checkuserpw").val();
		if(userpw == checkuserpw){
			$("#checkpw").css("color", "blue");
			$("#checkpw").text("비밀번호가 일치합니다.");
		}else{
			$("#checkpw").css("color", "red");
			$("#checkpw").text("비밀번호가 일치하지 않습니다.");
		}
	});
	
	// 전화번호 유효성 검사
	$("#phonenum").keyup(function(){
		var phonenum = $("#phonenum").val();
		if(!regPhone.test(phonenum)){
			$("#checknum").text("'-'제외 11자리 입력").css("color", "red");
			return false;
		} else{
			$("#checknum").text("");
		}
	});
	
	$("#frmRegister").submit(function(){
		if($("#userpw").val().trim() == ""){
			$("#checkpassword").text("비밀번호를 입력해주세요.").css("color", "red");
			$("#userpw").focus();
			return false;
		} else if($("#userpw").val().trim() != $("#checkuserpw").val().trim()){
			$("#checkpw").text("비밀번호가 일치하지 않습니다.").css("color", "red");
			$("#userpw").focus();
			return false;
		} else if($("#username").val().trim() == ""){
			$("#checkname").text("이름을 입력해주세요.").css("color", "red");
			$("#username").focus();
			return false;
		} else if($("#email").val().trim()==""){
			$("#checkemail").text("이메일을 입력해주세요.").css("color", "red");
			$("#email").focus();
			return false;
		} else if($("#phonenum").val().trim()==""){
			$("#checknum").text("전화번호를 입력해주세요.").css("color", "red");
			$("#phonenum").focus();
			return false;
		} else if($("#url").val().trim()==""){
			$("#checkurl").text("홈페이지 주소를 입력해주세요.").css("color", "red");
			$("#url").focus();
			return false;
		}
	});
	
	$("#username").keyup(function(){
		$("#checkname").text("");
	});
	$("#email").keyup(function(){
		$("#checkemail").text("");
	});
	$("#url").keyup(function(){
		$("#checkurl").text("");
	});
	
});
</script>
	<!-- 회원정보수정 -->
	<div id="userModify" style="padding:50px 400px 30px 650px">
		<form role="form" id="frmRegister" action="/mypage/modify" method="post">
				<div style="text-align:center"><h1 style="color:#666666; padding-bottom:10px;"><strong>회원정보수정</strong></h1></div>
				<hr>
				<div style="padding-left:150px">
				<div class="form-group userid">
					<label for="userid" style="color:#666666; font-weight:bold; font-size:18px">
						아이디 : 
					</label>
					<input type="text" id="userid" name="userid" value="${userVo.userid }" style="border:none;" readonly/>
				</div>
				
				<div class="form-group">
					<label for="username" style="color:#666666; font-weight:bold; font-size:18px">
						이름 : 
					</label>
					<input type="text" id="username" name="username" value="${userVo.username }"/>
				</div>
				
				<div class="form-group">
					<label for="userpw" style="color:#666666; font-weight:bold; font-size:18px">
						비밀번호 : 
					</label>
					<input type="password" id="userpw" name="userpw" placeholder="문자, 숫자, 특수문자 포함 8~20자 입력"/>
					<div id="checkpassword" style="padding-left:180px"></div>
				</div>
				
				<div class="form-group">
					<label for="checkuserpw" style="color:#666666; font-weight:bold; font-size:18px">
						비밀번호 확인 : 
					</label>
					<input type="password" id="checkuserpw" placeholder="비밀번호 재입력"/>
					<div id="checkpw" style="padding-left:180px"></div>
				</div>
				
				<div class="form-group">
					<label for="email" style="color:#666666; font-weight:bold; font-size:18px">
						이메일 : 
					</label>
					<input type="email" id="email" name="email" value="${userVo.email }"/>
					<div id="checkemail" style="padding-left:180px"></div>
				</div>
				
				<div class="form-group">
					<label for="phonenum" style="color:#666666; font-weight:bold; font-size:18px">
						전화번호 : 
					</label>
					<input type="text" id="phonenum" name="phonenum" placeholder="'-'제외 11자리 입력" value="${userVo.phonenum }"/>
					<div id="checknum" style="padding-left:180px"></div>
				</div>
				
				<div class="form-group">
					<label for="url" style="color:#666666; font-weight:bold; font-size:18px">
						홈페이지 주소 입력 : 
					</label>
					<input type="text" id="url" name="url" placeholder="예:kim-and-song" value="${userVo.url }"/>
					<div id="checkurl" style="padding-left:180px"></div>
				</div>
				
				</div>
				<div style="text-align: center;">
					<button type="submit" id="btnModify" class="btn btn-primary" style="background:#666666; height:50px; width:120px; display:inline-block; font-size:20px">
						수정하기
					</button>
				</div>
			</form>
	</div>

</div>

<%@ include file="../include/m_footer.jsp" %>