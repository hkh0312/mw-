<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/m_header.jsp" %>
<link rel="stylesheet" href="/css_hkh/guest/guest_list.css"	/>

<script src="/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function() {
	
	$("#btnRegister").click(function(e){
		e.preventDefault();	
		$("#modal-694523").trigger("click");
	});
	

	$("#btnModalRegister").click(function(){
		var g_name = $("#g_name").val();
		var g_phonenumber = $("#g_phonenumber").val();
		var userid = "${loginInfo.userid}";
		var sData = {
				"g_name" : g_name,
				"g_phonenumber" : g_phonenumber,
				"userid" : userid 
		};
		console.log("sData", sData);
		var url = "/guest/register";
		$.post(url, sData, function(rData){
			console.log("rData: ", rData);
			if(rData=="true"){
				location.replace("guestlist");
			}
		});
	});

	
	// 삭제
	$("#chkTop").change(function(){
		var isChecked = $(this).prop("checked");
		$(".checkGno").prop("checked", isChecked);
	});
	
	$("#btnDelete").click(function(){
		var deleteEl = [];
		var arr_g_no = [];
		$(".checkGno").each(function(){
			var checked = $(this).is(":checked");
			console.log(checked);
			if(checked){
				var g_no = $(this).attr("data-gno");
				console.log("g_no: ", g_no);
				arr_g_no.push(parseInt(g_no));
				deleteEl.push($(this).parent().parent());
				console.log("deleteEl:" ,deleteEl);
			}
		});
		
		console.log("arr_g_no", arr_g_no);
		var url = "/guest/delete";
		var sData = {"arr_g_no" : arr_g_no};
		$.post(url, sData, function(rData){
// 			console.log(rData);
			if(rData == "true"){
				$.each(deleteEl, function(){
					$(this).fadeOut("fast");
				});
// 				location.replace("list");
			}
		});
	});

	// 수정
	$(".a_gno").click(function(e){
		e.preventDefault();
		$("#modal-556233").trigger("click");
		var g_no = $(this).attr("data-gno");
		console.log(g_no);
		$("#btnModalSave").attr("data-gno", g_no);
		var g_name = $(this).parent().text();
		console.log(g_name);
		$("#update_gname").val(g_name);
		var g_phonenumber = $(this).parent().next().text();
		console.log(g_phonenumber);
		$("#update_gphonenumber").val(g_phonenumber);
	});
	
	$("#btnModalSave").click(function(){
		var g_no = $(this).attr("data-gno");
		var g_name = $("#update_gname").val();
		var g_phonenumber = $("#update_gphonenumber").val();
		console.log(g_no);
		console.log(g_name);
		console.log(g_phonenumber);
		var url = "/guest/modify";
		var sData = {
			"g_no" : g_no,
			"g_name" : g_name,
			"g_phonenumber" : g_phonenumber
		};
		$.post(url, sData, function(rData){
// 			console.log(rData);
			
			if(rData=="true"){
				location.replace("guestlist");
			}
		});
	});
	
	// 청첩장 보내기
	$("#btnSend").click(function(){
		var sendEl = [];
		var arr_g_no = [];
		$(".checkGno").each(function(){
			var checked = $(this).is(":checked");
			console.log(checked);
			if(checked){
				var g_phonenumber = $(this).attr("data-phone");
				console.log("g_phonenumber: ", g_phonenumber);
				arr_g_no.push(g_phonenumber);
				sendEl.push($(this).parent().parent());
				console.log("sendEl:" ,sendEl);
			}
		});
		
		console.log("arr_g_no", arr_g_no);
		var userid = "${loginInfo.userid}";
		console.log(userid);
		
		var url = "/sms/send";
		var sData = {"arr_g_no" : arr_g_no, "userid" : userid};
		$.post(url, sData, function(rData){
			console.log(sData);
			console.log(rData);
			if(rData == "true"){
				alert("청첩장을 보냈습니다.");
			} else{
				alert("청첩장을 보냈습니다.");
			}
		});
	});
	
	
	
	
	

	
});	// $(document).ready
</script>
   

      <!-- end banner -->
      <div class="back_re">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     <h2>하객 명단</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- blog -->
      <div class="blog"  style="min-height: 700px;">
         <div class="container">

<!-- 하객 추가 모달창 -->
<div class="row">
		<div class="col-md-12">
			<a id="modal-694523" href="#modal-container-694523" role="button" class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>
			<div class="modal fade" id="modal-container-694523" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title w-100 font-weight-bold">하객 추가</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body mx-3">
					        <div class="md-form mb-3">
						        <i class="fa fa-user prefix grey-text">
					        	<label> 이름 : </label></i>
					        	<input type="text" id="g_name" name="g_name">
					        </div>
					        <div class="md-form mb-3">
					         	<i class="fa fa-phone" aria-hidden="true"><label> 전화번호 : </label></i>
								<input type="text" id="g_phonenumber" name="g_phonenumber">
					        </div>
				      	</div>
						<div class="modal-footer">
						 	 <button type="button" class="btn btn-primary waves-effect waves-light" id="btnModalRegister">추가</button>
   						     <button type="button" class="btn btn-default waves-effect waves-light" data-dismiss="modal">닫기</button>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- // 하객 추가 모달창 -->

<!-- 하객 정보 수정 모달창 -->
<div class="row">
		<div class="col-md-12">
			<a id="modal-556233" href="#modal-container-556233" role="button" class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>
			<div class="modal fade" id="modal-container-556233" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								하객 정보 수정
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body mx-3">
					        <div class="md-form mb-3">
						        <i class="fa fa-user prefix grey-text">
					        	<label> 이름 : </label></i>
					        	<input type="text" id="update_gname" name="update_gname">
					        </div>
					        <div class="md-form mb-3">
					         	<i class="fa fa-phone" aria-hidden="true"><label> 전화번호 : </label></i>
								<input type="text" id="update_gphonenumber" name="update_gphonenumber">
					        </div>
				      	</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="btnModalSave">
								저장
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- // 하객 정보 수정 모달창 -->
         
         
<!--          <label>이름 : </label><input type="text" name="g_name" id="g_name"> -->
<!--          <label>전화번호 : </label><input type="text" name="g_phonenumber" id="g_phonenumber"> -->
<!-- 		<form action="/sms/send" method="post"> -->
		<div class="row">
		<div class="col-md-12">
		  <button type="button" id="btnRegister" class="button button4">하객 추가</button>
		  <button type="button" id="btnDelete" class="button button4">하객 삭제</button>
		  <button type="submit" id="btnSend" class="button button4" style="float:right">청첩장보내기</button>
          </div>
          </div>
<!--           </form> -->
            <div class="row">
               <div class="col-sm-12" style="padding-bottom:100px">
				<table>
				    <thead>
				    <tr>
						<th><input type="checkBox" style="margin:5px" id="chkTop"></th>
				        <th>#</th>
				        <th>이름</th>
				        <th>전화번호</th>
				
				    </tr>
				    </thead>
				    <tbody id="guestList">
				    <c:forEach items="${list}" var="guestVo" varStatus="status">
						<tr class="tr">
							<td><input type="checkBox" style="margin:5px" class="checkGno" data-gno="${guestVo.g_no}" data-phone="${guestVo.g_phonenumber}"></td>
							<td>${status.count}</td>
							<td><a href="#" class="a_gno" data-gno="${guestVo.g_no}">${guestVo.g_name}</a></td>
							<td>${guestVo.g_phonenumber}</td>
						</tr>
					</c:forEach>
				    </tbody>
				</table>

               </div>
            </div>
         </div>
      </div>
      <!-- end blog -->
      

<%@ include file="../include/m_footer.jsp" %>