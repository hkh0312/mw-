<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/m_header.jsp" %>
<link rel="stylesheet" href="/css_hkh/qna/register.css"/>
<script>
$(document).ready(function(){
	var check = "";
	$("#c_secret").click(function(){
		if($("#c_secret").prop("checked")) {
			console.log("check");
			$("#c_password").show();
			check=true;
		}else if($("#c_secret").prop("checked")==false){
			$("#c_password").hide();
			check=false;
		}	
	});
	
	$("#frmRegister").submit(function(){
		
		if($("#c_title").val().trim() == ""){
			alert("제목을 입력해주세요");
			$("#c_title").focus();
			return false;
		} else if($("#c_content").val().trim() == ""){
			alert("내용을 입력해주세요");
			$("#c_content").focus();
			return false;
		}else if(check==true){
			if($("#c_password").val().trim() == ""){
				alert("비밀번호를 입력해주세요");
				$("#c_password").focus();
				return false;
			}
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
                     <h2>고객 문의</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- blog -->
      <div class="blog">
        <div class="container" id="container">
	    <form id="frmRegister" method = "post" action = "/qna/register">
        <table  style="padding-top:50px; margin:auto; width:800px; border:0; cellpadding:2 ">
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white> 글쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                        <tr>
                        <th>제목</th>
                        <td><input type="text" id="c_title" name="c_title" placeholder="제목을 입력하세요." size=60></td>
                        </tr>
 
                        <tr>
                        <th>작성자</th>
                        <td><input type="text" id="c_id" name="c_id" placeholder="이름을 입력하세요." value="${loginInfo.userid }" readonly></td>
                        </tr>
 
                        <tr>
                        <th>내용</th>
                        <td><textarea cols=85 rows=15 id="c_content" name="c_content" placeholder="내용을 입력하세요."></textarea></td>
                        </tr>
 
                        <tr>
                        <th>비밀번호</th>
                        <td><input type="checkbox" id="c_secret" name="c_secret" style="margin-left:5px">비밀글 설정
                        <input type="password" size=10 maxlength=10 name="c_password" id="c_password" placeholder="비밀번호입력" style="display:none"></td>
                        </tr>
                        </table>
                </td>
                </tr>
        </table>
        <div class="col-sm-12" style="padding-bottom:100px">
        <div class="row"  style="float:right; margin-right:220px">
       		<a href="/qna/qnaList"><button type="button" style="background-color:#ccc">목록으로</button></a>
		    <button type="submit" id="btnSubmit">작성완료</button>
		</div>
		</div>
        </form>
         </div>
      </div>

<%@ include file="../include/m_footer.jsp" %>