<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/m_header.jsp" %>
<link rel="stylesheet" href="/css_hkh/qna/detail.css"/>
<script>
$(document).ready(function(){
	var modify_result = "${modify_result}";
	if(modify_result == "true"){
		alert("수정되었습니다.");
	}

	
	$("#btnModify").click(function(){
		$(this).hide();
		$("#btnModifyRun").show();
		$("#btnDelete").hide();
		$("#c_title").prop("readonly", false);
		$("#c_content").prop("readonly", false);
	});
	
	
	
	$("#btnDelete").click(function(){
		if(confirm("게시글을 삭제하겠습니까?") == true){
			alert("게시글이 삭제되었습니다.");
			location.replace("/qna/delete?c_no=${qnaVo.c_no }&page=${pagingDto.page}&perPage=${pagingDto.perPage}");
		}
	});
	
	if(${qnaVo.re_seq} == 1 && ${userVo.userid}!="admin"){
		$("#btnDelete").hide();
		$("#btnModify").hide();
		$("#btnReply").hide();
	}
	
	
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
	    <form id="frm" method="post" action="/qna/modify">
        <table  style="padding-top:50px; margin:auto; width:800px; border:0; cellpadding:2 ">
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white>문의 내용</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                		<tr>
                        <th>글번호</th>
                        <td colspan="3"><input type="number" id="c_no" name="c_no" style="border: none; background: transparent;" value="${qnaVo.c_no }" readonly></td>
                        </tr>
 
                        <tr>
                        <th>작성자</th>
                        <td><input type="text" id="c_id" name="c_id" placeholder="이름을 입력하세요." value="${qnaVo.c_id }" style="border: none; background: transparent;" readonly></td>
                        <th  width="100">작성일</th>
                        <td><input type="text" id="c_date" name="c_date" value="${qnaVo.c_date }" style="border: none; background: transparent;" readonly></td>
                        </tr>
                        
                        <tr>
                        <th>제목</th>
                        <td colspan="3"><input type="text" id="c_title" name="c_title" placeholder="제목을 입력하세요." size=60 value="${qnaVo.c_title }" style="border: none; background: transparent;" readonly></td>
                        </tr>
                        
                        <tr>
                        <th>내용</th>
                        <td colspan="4"><textarea cols=85 rows=15 id="c_content" name="c_content" placeholder="내용을 입력하세요." style="border: none; background: transparent;" readonly>${qnaVo.c_content }</textarea></td>
                        </tr>
 
                        </table>
                </td>
                </tr>
        </table>
       	<div class="col-sm-12" style="padding-bottom:80px">
	        <div class="row"  style="float:right; margin-right:220px">
	       		<a href="/qna/qnaList?page=${pagingDto.page }&perPage=${pagingDto.perPage}"><button type="button" style="background-color:#ccc">목록으로</button></a>
	       		<c:if test="${qnaVo.c_id eq loginInfo.userid}">
		       		<button id="btnModify" type="button" style="background-color:#ccc">수정</button>
		       		<button id="btnModifyRun" type="submit" style="display:none">수정완료</button>
		       		<button id="btnDelete" type="button" style="background-color:#ccc">삭제</button>
			    </c:if>
			    <c:if test='${loginInfo.userid eq "admin" && qnaVo.re_level eq 0}'>
			    	<a href="/qna/reply?c_no=${qnaVo.c_no }&page=${pagingDto.page}&perPage=${pagingDto.perPage}"><button id="btnReply" type="button">답변</button></a>
			    </c:if>
			</div>
		</div>
        </form>
         </div>
      </div>

<%@ include file="../include/m_footer.jsp" %>