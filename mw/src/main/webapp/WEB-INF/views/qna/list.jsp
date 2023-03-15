<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/m_header.jsp" %>
<%@ include file="../include/pageParam.jsp" %>
<style>
nav {
    display: flex;
    justify-content: center;
}
.page-link{
	color: black;
	
} 

.page-item.active .page-link{
	background-color:black;
	border-color:black;
}       
    
</style>
<script>
$(document).ready(function(){
	
	$(".a_title").click(function(e){
		e.preventDefault();
		
		var c_no = $(this).attr("data-cno");
		var frm = $("#frmPaging");
		frm.find("input[name=c_no]").val(c_no);	
		var c_secret = $(this).attr("data-secret");
		frm.find("input[name=c_secret]").val(c_secret);
		var src="";
		console.log(c_secret);
		if(c_secret == "false"){
			src = "/qna/detail";	// 비밀글이 아니면 detail로
		} else if(c_secret == "true"){
			src = "/qna/password_check";	// 비밀글이면 password_check로
		} 
		frm.attr("action", src).submit();
		
	});
	
	
	$(".page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("href");
		$("#frmPaging").find("input[name=page]").val(page);
		$("#frmPaging").attr("action", "/qna/qnaList").submit();
	});
	
	$("#btnSearch").click(function(){
		var searchType = $("#frmSearch").find("[name=searchType]").val();
		var keyword = $("#frmSearch").find("[name=keyword]").val();
		$("#frmPaging").find("[name=searchType]").val(searchType);
		$("#frmPaging").find("[name=keyword]").val(keyword);
		$("#frmPaging").attr("action", "/qna/qnaList");
		$("#frmPaging").submit();
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
         <div class="container ">
         	<div class="row">
				<div class="col-md-12">
				 	<a href="/qna/register" class="btn btn-md btn-secondary" type="button" style="margin-bottom:10px; float:right;">글쓰기</a>
					
				
				<!-- Topbar Search -->
                    <form id="frmSearch" class="d-none d-sm-inline-block form-inline mr-auto my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group" style="margin-bottom:20px">
                            <select class="form-control" name="searchType">
                            	<option value="t"
                            		<c:if test="${pagingDto.searchType=='t' }">
                            			selected
                            		</c:if>
                            	>제목</option>
                            	<option value="c"
	                            	<c:if test="${pagingDto.searchType=='c' }">
	                            		selected
                            		</c:if>
                            	>내용</option>
                            	<option value="i"
          		       	            <c:if test="${pagingDto.searchType=='i' }">
	                            		selected
                            		</c:if>
                            	>작성자</option>
                            	<option value="tc"
                            		<c:if test="${pagingDto.searchType=='tc' }">
	                            		selected
                            		</c:if>
                            	>제목+내용</option>
                            </select>
                            
                            <input type="text" class="form-control bg-light border-1 small" placeholder="검색어 입력"
                                aria-label="Search" aria-describedby="basic-addon2" name="keyword">
                            <div class="input-group-append">
                                <button id="btnSearch" class="btn btn-secondary" type="button">
                                    <i class="fa fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                 <!-- //Topbar Search -->
                 <a href="/qna/qnaList"><button type="button" class="btn btn-md btn-secondary" style="margin-bottom:3px;">전체목록</button></a>
                 
              </div>      
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="qnaVo" varStatus="status">
					<tr>
						<td data-no="td_no">${(count - status.index)-((pagingDto.page-1)*10)}</td>
						<td style="padding-Left:${qnaVo.re_level * 20}px"><a href="#" class="a_title" data-cno="${qnaVo.c_no}" data-secret="${qnaVo.c_secret}">
						
						<c:if test="${qnaVo.re_level gt 0}">
						└
						</c:if>
						<c:choose>
							<c:when test="${qnaVo.c_secret eq false}">
								${qnaVo.c_title }
							</c:when>
							<c:otherwise>
								<i class="fa fa-unlock-alt" aria-hidden="true">&nbsp;${qnaVo.c_title}</i>
							</c:otherwise>
						</c:choose>
						</a></td>
						<td>${qnaVo.c_date }</td>
						<td>${qnaVo.c_id }</td>
						<td>${qnaVo.viewcnt}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>


<!-- pagination -->
<div class="row">
		<div class="col-md-12" style="padding-bottom:100px">
			<nav class="pagination">
				<ul class="pagination">
					<c:if test="${pagingDto.startPage ne 1}">
						<li class="page-item">
							<a class="page-link" href="${pagingDto.startPage - 1}">«</a>
						</li>
					</c:if>
					<c:forEach var="page" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
						<li 
							<c:choose>
								<c:when test="${pagingDto.page eq page}">
									class="page-item active"
								</c:when>
								<c:otherwise>
									class="page-item"
								</c:otherwise>
							</c:choose>
						>
							<a class="page-link" href="${page}">${page}</a>
						</li>
					</c:forEach>
					<c:if test="${pagingDto.endPage lt pagingDto.totalPage}">
						<li class="page-item">
							<a class="page-link" href="${pagingDto.endPage + 1}">»</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>

<!-- //pagination -->
         
         </div>
      </div>

<%@ include file="../include/m_footer.jsp" %>