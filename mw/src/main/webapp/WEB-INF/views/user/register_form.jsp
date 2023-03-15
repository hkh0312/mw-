<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/m_header.jsp" %>    
<link rel="stylesheet" href="/css_hkh/user/register_form.css"/>
<script>
$(document).ready(function(){
	var regId = /^[a-z0-9]{3,20}$/;
	var regPw = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var regPhone = /^01([0|1|6|7|8|9]?)?([0-9])?([0-9]){9}$/;
	
	var register_result = "${register_result}";
	console.log(register_result);
	if(register_result == "fail"){
		alert("회원가입에 실패했습니다. 다시 시도해주세요.");
	}
	  
	
	// 아이디 유효성 검사
	$("#userid").keyup(function(){
		var userid = $("#userid").val();
		if(!regId.test(userid)){
			$("#checkid").text("3~20자를 입력해주세요.");
			$("#checkid").css("color", "red");
			$("#btnCheckDup").css("top", "15px");
			return false;
		} else{
			$("#checkid").text("");
			$("#btnCheckDup").css("top", "40px");
		}
	});
	
	// 아이디 중복 체크
	$("#btnCheckDup").click(function(){
		var userid = $("#userid").val();
		console.log(userid);
		if(userid.trim()==""){
			$("#checkid").text("아이디를 입력해주세요.");
			$("#checkid").css("color", "red");
			$("#userid").focus();
			$("#btnCheckDup").css("top", "15px");
			return;
		}
		if(!regId.test(userid)){
			$("#checkid").text("3~20자를 입력해주세요.");
			$("#checkid").css("color", "red");
			$("#btnCheckDup").css("top", "15px");
			$("#userid").focus();
			return;
		}
		var sData = {
				"userid" : userid
		};
		var url = "/user/checkDupId";
		$.post(url, sData, function(rData){
			console.log(rData);
			if(rData == 0){
				console.log("가능");
				$("#checkid").text("사용할 수 있는 아이디");
				$("#checkid").css("color", "blue");
				$("#btnCheckDup").attr("data-id", userid);
			}else if(rData == 1){
				console.log("불가능");
				$("#checkid").text("사용할 수 없는 아이디");
				$("#checkid").css("color", "red");
				$("#btnCheckDup").removeAttr("data-id");
			}
		});
		$("#btnCheckDup").css("top", "15px");
	}); // $("#btnCheckDup").click
	
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
	
	// 폼 전송
	$("#frmRegister").submit(function(){
		if($("#userid").val().trim() == ""){
			$("#checkid").text("아이디를 입력해주세요.").css("color", "red");
			$("#btnCheckDup").css("top", "15px");
			$("#userid").focus();
			return false;
		} else if($("#userpw").val().trim() == ""){
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
		
		var data_id = $("#btnCheckDup").attr("data-id");
		var userid = $("#userid").val();
		console.log(data_id);
		console.log(userid);
		if(data_id != userid){
			$("#checkid").text("아이디 중복 체크를 해주세요.");
			$("#checkid").css("color", "red");
			$("#userid").focus();
			$("#btnCheckDup").css("top", "15px");
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
	
	
	
	
});	// $(document).ready


</script>

    <div class="back_re">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="title">
						<h2>회원가입</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  contact -->
	
		<div class="container-fluid" style="padding:20px;">
		<div class="row">
			<div class="col-md-12">
				<form role="form" id="frmRegister" action="/user/register" method="post">
					<div style="text-align:center"><h3 style="color:#666666; padding-bottom:30px; font-weight: bold;">아래의 항목을 빠짐없이 입력해주세요.</h3></div>
					<div style="padding-left:100px">
					<div class="form-group userid">
						<label for="userid" style="color:#666666; font-weight:bold; font-size:18px">
							아이디
						</label>
						
						<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디 입력(3~20자)"/>
						<button type="button" id="btnCheckDup">중복 확인</button>
						<div id="checkid"></div>
					</div>
					
					
					<div class="form-group">
						<label for="userpw" style="color:#666666; font-weight:bold; font-size:18px">
							비밀번호
						</label>
						<input type="password" class="form-control" id="userpw" name="userpw" placeholder="비밀번호 입력(문자, 숫자, 특수문자 포함 8~20자)"/>
						<div id="checkpassword"></div>
					</div>
					
					<div class="form-group">
						<label for="checkuserpw" style="color:#666666; font-weight:bold; font-size:18px">
							비밀번호 확인
						</label>
						<input type="password" class="form-control" id="checkuserpw" placeholder="비밀번호 재입력"/>
						<div id="checkpw"></div>
					</div>
					
					<div class="form-group">
						<label for="username" style="color:#666666; font-weight:bold; font-size:18px">
							이름
						</label>
						<input type="text" class="form-control" id="username" name="username" placeholder="이름을 입력해주세요"/>
						<div id="checkname"></div>
					</div>
					
					<div class="form-group">
						<label for="email" style="color:#666666; font-weight:bold; font-size:18px">
							이메일
						</label>
						<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요"/>
						<div id="checkemail"></div>
					</div>
					
					<div class="form-group">
						<label for="phonenum" style="color:#666666; font-weight:bold; font-size:18px">
							전화번호
						</label>
						<input type="text" class="form-control" id="phonenum" name="phonenum" placeholder="휴대폰 번호 입력('-'제외 11자리 입력)"/>
						<div id="checknum"></div>
					</div>
					
					<div class="form-group">
						<label for="url" style="color:#666666; font-weight:bold; font-size:18px">
							홈페이지 주소 입력
						</label>
						<input type="text" class="form-control" id="url" name="url" placeholder="홈페이지 주소를 입력해주세요(예:kim-and-song)"/>
						<div id="checkurl"></div>
					</div>
					
					</div>
					<div style="text-align: center;">
						<button type="submit" class="btn btn-primary" style="background:#666666; height:50px; width:120px; display:inline-block; font-size:20px">
							가입하기
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
    
<%@ include file="../include/m_footer.jsp" %>