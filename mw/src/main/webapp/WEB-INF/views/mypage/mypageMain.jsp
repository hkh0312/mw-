<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/mypage_menu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(document).ready(function(){
	
	

	
});	// $(document).ready

</script>   
	
	<div class="tab-content" style="margin-left:25%;padding:30px 16px;">
		<!-- 나의 게시글 -->
		<div id="board">
		<h2 style="font-weight:bold">내 게시물 보기</h2>
		<h4><strong>${loginInfo.username }</strong>님이 게시판에 작성한 게시글 내역입니다.</h4>
		<table class="table">
			<thead>
			    <tr>
				    <th>작성일</th>
				    <th>제목</th>
				    <th>작성자</th>
			    </tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${qnaVo}" var="qnaVo">
				<tr>
					<td>${qnaVo.c_date }</td>
					<td><a href="/qna/detail?c_no=${qnaVo.c_no }" class="a_title">
						<c:if test="${qnaVo.re_level gt 0}">
							└
						</c:if>
						${qnaVo.c_title }
						</a>
					</td>
					<td>${qnaVo.c_id }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>    
		</div>
		
	</div>
	
	
</div>
<!-- end contact -->
<%@ include file="../include/m_footer.jsp" %>