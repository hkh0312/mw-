<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/m_header.jsp" %>
<%@ include file="../include/pageParam.jsp" %>
<link rel="stylesheet" href="/css_hkh/qna/reply_register.css"/>

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
	    <form id="frm" method="post" action="/qna/reply?page=${pagingDto.page}&perPage=${pagingDto.perPage}">
<!-- 	    	<input type="hidden" name="c_no" value=""/> -->
	    	<input type="hidden" name="c_id" value="${loginInfo.userid}"/>
	    	<input type="hidden" name="re_group" value="${qnaVo.re_group }"/>
			<input type="hidden" name="re_seq" value="${qnaVo.re_seq }"/>
			<input type="hidden" name="re_level" value="${qnaVo.re_level }"/>
			<input type="hidden" name="c_secret" value="${qnaVo.c_secret }"/>
			<input type="hidden" name="c_password" value="${qnaVo.c_password }"/>
			
			
        <table  style="padding-top:50px; margin:auto; width:800px; border:0; cellpadding:2 ">
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white>답변 쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
<!--                 		<tr> -->
<!--                         <th>글번호</th> -->
<%--                         <td colspan="3"><input type="number" id="c_no" name="c_no" style="border: none; background: transparent;" value="${qnaVo.c_no }" readonly></td> --%>
<!--                         </tr> -->
                        
<!--                         <tr> -->
<!--                         <th>작성자</th> -->
<%--                         <td><input type="text" id="c_id" name="c_id" placeholder="이름을 입력하세요." value="${qnaVo.c_id }"  style="border: none; background: transparent;" readonly></td> --%>
<!--                         <th  width="100">작성일</th> -->
<%--                         <td><input type="text" id="c_date" name="c_date" value="${qnaVo.c_date }" style="border: none; background: transparent;" readonly></td> --%>
<!--                         </tr> -->
                        
                        <tr>
                        <th>제목</th>
                        <td colspan="3"><input type="text" id="c_title" name="c_title" placeholder="제목을 입력하세요." size=60 value="답변 : ${qnaVo.c_title }"></td>
                        </tr>
                        
                        <tr>
                        <th>내용</th>
                        <td colspan="4"><textarea cols=85 rows=15 id="c_content" name="c_content" placeholder="내용을 입력하세요." style="text-align:left">문의 내용 : ${qnaVo.c_content }&#10;&#10;&#10;답변: </textarea></td>
                        </tr>
 
<!--                         <tr> -->
<!--                         <td>비밀번호</td> -->
<!--                         <td><input type = password name = pw size=10 maxlength=10></td> -->
<!--                         </tr> -->
                        </table>
                </td>
                </tr>
        </table>
        <div style="padding-bottom:140px">
        <div class="row"  style="float:right; margin-right:220px;" >
       		<a href="/qna/qnaList?c_no=${qnaVo.c_no }&page=${pagingDto.page}&perPage=${pagingDto.perPage}"><button type="button" style="background-color:#ccc">취소</button></a>
       		<button type="submit">답변완료</button>
		</div>
		</div>
        </form>
         </div>
      </div>

<%@ include file="../include/m_footer.jsp" %>