<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/mypage_menu.jsp" %>
<style>
hr{
	border: 0px;
	border-top: 5px solid #BBAEA0;
}
h2{
	text-align:center;
}
</style>
<script>
function withdraw() {
	if("${withdraw_result}" == "false"){
		alert("회원탈퇴에 실패하였습니다.");
	}
	
	var result = confirm("정말 탈퇴하시겠습니까?");
	if(result){
		location.href="/mypage/withdraw";
	}else{
		return false;
	}
}

</script>

		
	<!-- 회원탈퇴 -->
	<div style="padding:150px 300px 250px 600px">
		<h1><strong>회원 탈퇴</strong></h1>
		<hr>
		<h2>회원 탈퇴를 하면 더 이상 이용하실 수 없습니다.</h2>
		<h2>회원 탈퇴를 진행하시겠습니까?</h2>
		<div style="text-align:center; padding-top:30px">
			<button type="button" class="btn btn-primary" onclick="withdraw()" style="background:#666666; height:50px; width:120px; display:inline-block; font-size:20px">
				탈퇴하기
			</button>
		</div>
	</div>

</div>

<%@ include file="../include/m_footer.jsp" %>