<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/mypage_menu.jsp" %>
<script>
$(document).ready(function(){
	
	// 회원정보수정 - 비밀번호 확인
	$("#btnOk").click(function(){
		var userpw = $("#confirmPw").val();
		var sData = { "userpw" : userpw };
		var url = "/mypage/confirmPw";
		$.post(url, sData, function(rData){
			console.log(rData);
			if(rData == "true"){
				location.href="/mypage/mypageModify";
			}else{
				alert("비밀번호가 일치하지않습니다.");
				return;
			}
		});
	});
	
	
});
</script>
		<!-- 회원정보수정 비밀번호 입력 -->
		<div id="userpwCheck" style="text-align:center; padding:100px 0px 250px;">
			<div style="padding-left:300px">
				<h2><strong>비밀번호 재확인</strong></h2>
				<h5>회원님의 정보를 안전하게 보호하기 위해 한번 더 비밀번호를 입력해주세요.</h5>
				<div class="form-group">
					<label for="loginId" style="color:#666666; font-weight:bold; font-size:18px">
						아이디 
					</label>
					<input type="text" id="loginId" name="loginId" value="${userVo.userid }" style="border:none;" readonly/>
				</div>
				<div class="form-group">
					<label for="confirmPw" style="color:#666666; font-weight:bold; font-size:18px">
						비밀번호 
					</label>
					<input type="password" id="confirmPw" name="confirmPw"/>
				</div>
				<div style="text-align: center;">
					<button id="btnOk" type="button" class="btn btn-primary" style="background:#666666; height:50px; width:120px; display:inline-block; font-size:20px">
						확인
					</button>
				</div>
			</div>
		</div>

</div>

<%@ include file="../include/m_footer.jsp" %>