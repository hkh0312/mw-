<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     list.jsp에 include 시킴 -->
<!-- parameter가 get방식으로 link처럼 전달이됨 -->
<form method="get" id="frmPaging">
	<input type="hidden" name="c_no" value="${qnaVo.c_no }"/>
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>	
	<input type="hidden" name="searchType" value="${pagingDto.searchType }"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword }"/>
	<input type="hidden" name="c_secret" value="${qnaVo.c_secret }"/>
</form>