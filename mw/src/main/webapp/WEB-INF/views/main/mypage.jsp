<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>													
<%@ include file="../include/m_header.jsp" %>

      <!-- end banner -->
      <!-- table -->
      <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<div class="row">
				<div class="col-md-12">
				<p class="form_menu" style="margin-top: 15px;"> ${vo.userid}님 반갑습니다.</p>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12">
				<a href="#" class="form_menu">MYPAGE로 가기</a>
				</div>
				<br>
			</div>
			<div class="row">
				<div class="col-md-12">
				<a href="#" class="form_menu">MY회원정보or플래너</a>
				</div>
				<br>
			</div>
			<div class="row">
				<div class="col-md-12">
				<a href="/user/inputpassword" class="form_menu">개인정보수정</a>
				</div>
				<br>
			</div>
			<div class="row">
				<div class="col-md-12">
				<a href="#" class="form_menu">주소록</a>
				</div>
				<br>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12">
				<a href="#" class="form_menu">회원탈퇴</a>
				</div>
				<br>
			</div>
		</div>
		<div class="col-md-9">
			<div class="jumbotron">
				<p>
				</p>
				<p>
				</p>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/m_footer.jsp" %>