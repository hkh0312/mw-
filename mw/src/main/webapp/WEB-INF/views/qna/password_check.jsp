<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/m_header.jsp" %>
<%@ include file="../include/pageParam.jsp" %>
<script>
$(document).ready(function(){
	
	$(".btnSubmit").click(function(){
		var c_no = $("#frmPaging").find("input[name=c_no]").val();
		console.log(c_no);
		$("input[name=c_no]").attr("value", c_no);
		var c_password=$("#c_password").val();
		console.log(c_password);
		
		var url = "/qna/password";
		var sData = {
				"c_password" : c_password,
				"c_no" : c_no
		};
		$.post(url, sData, function(rData){
			console.log(rData.c_password);
			if(rData.c_password == c_password){
				console.log("success");
				location.href="detail?c_no="+c_no;
			}
			else if(rData.c_password != c_password){
				console.log("fail");
				alert("비밀번호가 일치하지 않습니다.");
			}
		});
		
		
	});
		
		
});
</script>

<div class="container-fluid" style="padding:200px">
	<div class="row">
		<div class="col-md-12" style="padding:50px">
<!-- 		<form action="/qna/password_check" method="post"> -->
<!-- 		<input type="hidden" name="c_no" value=""/> -->
		
			<table class="table" style="width:550px; margin:auto; position:relative;">
				<thead>
					<tr >
						<th>
							<h2 style="text-align:center">비밀글입니다.</h2>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<p style="text-align:center; color:black" >비밀글 기능으로 보호된 글입니다.<br><strong>비밀번호를 입력해주세요.</strong></p>
						</td>
					</tr>
					<tr>
						<td>
						 <div class="form-inline form-group" >
							<label for="c_password" style="padding-right:10px">비밀번호 : </label>
							<input type="password" name="c_password" id="c_password" class="form-control" style="width:200px">
							<button type="submit" class="btn btn-primary btnSubmit">
								확인
							</button>
							<a href="/qna/qnaList"><button type="button" class="btn btn-secondary">목록으로</button></a>
							
						</div>
						</td>
					</tr>
					
				</tbody>
			</table>
			
<!-- 		</form> -->
		</div>
	</div>
</div>

<%@ include file="../include/m_footer.jsp" %>