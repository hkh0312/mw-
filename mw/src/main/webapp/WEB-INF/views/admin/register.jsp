<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/m_header.jsp" %>

<!-- 부트스트랩CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<style>

.form-group{
	width: 60%;
    margin-left: 20%;
    margin-top: 20px;
    border: 1px solid #dbdde2;
    background-color: #efefef;	
}
.form-group-title{
	padding: 20px 35px;	
}


.form-group-title label{
	display: block;
    font-size: 20px;
    font-weight: 800;
}

.input {
	width: 965px;
    height: 25px;
    font-size: 20px;
    padding: 15px 2%;
    margin:center;
}


/* 버튼 영역 */
.btn-group{
	width: 30%;
    margin-left: 35%;
    margin-top: 10px;
	text-align: center;
}
.btn{
    min-width: 180px;
    padding: 4px 30px;
    font-size: 25px;
    font-weight: 600;
    line-height: 40px;
}
.btn-secondary{
	background-color: #dbdde2;
	margin-left:15px;
}
#btnRegister:hover {
    background-color: #c9cbd0;
}

#btnList:hover {
    background-color: #c9cbd0;
}

.btnSearch{ 
 	cursor: pointer; 
 	float: right; 
} 


</style>

<script>

$(document).ready(function(){
	
	//카테고리 검색 버튼 클릭시
	$("#btnSearch").click(function(e){
		e.preventDefault();	
		
		var v_category = $("select[id=v_category]").val();
		var v_category1=v_category.substring(0,2);
		var v_local = $("select[id=v_local]").val();
		
		console.log("v_category:"+v_category);
		console.log("v_category1:"+v_category1);
		console.log("v_local:"+v_local);
		
		var catecode = v_category1 + v_local;
		console.log("catecode:"+catecode);
		
		$("#cateCode").attr('value',catecode);
		
	});
	

	//등록버튼 클릭시
	$("#btnRegister").click(function(e){
		e.preventDefault();	
	
		$("#frmVendor").submit();
		
	});
	
	//목록버튼 클릭시
	$("#btnList").click(function(e){
		e.preventDefault();
		location.href="/admin/list";
	})

});


</script>

	<!-- end banner -->
	<div class="back_re">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="title">
						<h2>관리자 등록화면</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- our plane -->	

	
	
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/admin/register" method="post" id="frmVendor">
			
				<div class="form-group">
					<div class="form-group-title">
						<label>글번호</label>
						<input type="text" class="input" name="v_no" id="v_no" />						
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title" >
						<label>카테고리</label>

						<div class="input-group" >
							<select class="form-control" id="v_category">
								<option value="100"
									<c:if test="${pagingVo.v_category == '100'}">selected</c:if>>Wedding
									Hall</option>

								<option value="200"
									<c:if test="${pagingVo.v_category == '200'}">selected</c:if>>Wedding
									Dress</option>

								<option value="300"
									<c:if test="${pagingVo.v_category == '300'}">selected</c:if>>Beauty
								</option>

								<option value="400"
									<c:if test="${pagingVo.v_category == '400'}">selected</c:if>>Gifts
								</option>
							</select> 
							<select class="form-control" id="v_local" >
								<option value="1"
									<c:if test="${pagingVo.v_local == '1'}">selected</c:if>>서울시
								</option>

								<option value="2"
									<c:if test="${pagingVo.v_local == '2'}">selected</c:if>>광주광역시
								</option>

								<option value="3"
									<c:if test="${pagingVo.v_local == '3'}">selected</c:if>>인천광역시
								</option>

								<option value="4"
									<c:if test="${pagingVo.v_local == '4'}"> selected </c:if>>부산광역시
								</option>

								<option value="5"
									<c:if test="${pagingVo.v_local == '5'}"> selected </c:if>>울산광역시
								</option>
							</select>
							<div class="btnSearch">
								<button class="btn btn-secondary" id="btnSearch">검색</button>
							</div>
							<input type="text" class="input" name="cateCode" id="cateCode" value="" style="margin-top: 15px"/>	
					</div>

				</div>	

				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>이름</label>
						<input type="text" class="input" name="v_name" id="v_name"/>
					</div>
				</div>
				
<!-- 				<div class="form-group"> -->
<!-- 					<div class="form-group-title"> -->
<!-- 						<label>사진</label> -->
<!-- 						<input type="text" class="input" name="v_pic" id="v_pic"/> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				<div class="form-group">
					<div class="form-group-title">
						<label>홈페이지 주소</label>
						<input type="text" class="input" name="v_link" id="v_link"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>점수</label>
						<input type="text" class="input" name="v_score" id="v_score"/>
					</div>
				</div>
				
				
				<div class="form-group">
					<div class="form-group-title">
						<label>주소</label>
						<input type="text" class="input" name="v_adress" id="v_adress"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>전화번호</label>
						<input type="text" class="input" name="v_number" id="v_number"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="form-group-title">
						<label>내용</label>
						<input type="text" class="input" name="v_type" id="v_type"/>
					</div>
				</div>
				
			</form>
			<div class="btn-group">
				<button id="btnRegister" class="btn btn-secondary">등록 완료</button>
			</div>
			<div class="btn-group" style="padding-bottom:50px">
				<button id="btnList" class="btn btn-secondary">목록가기</button>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	<!-- our plane -->
<%@ include file="../include/m_footer.jsp"	%>