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
 section#content ul li { display:inline-block; margin:15px; }
 section#content div.categoryImg img { width:320px; height:300px; }
 section#content div.categoryAdress { padding-top:5px; text-align:left; font-size:15px; color: #a0a0a0; font-weight:bold;}
 section#content div.categoryName a { color:#000; }
 section#content div.categoryName { padding:5px 0; text-align:left; font-size:23px; font-weight:bold; }
 section#content div.categoryName a { color:#000; }
 section#content div.categoryLink { padding:5px 0; text-align:left; }
 section#content div.categoryLink a { color:#000; }
 section#content div.categoryScore { padding:10px 0; text-align:right; font-size:15px;}
 section#content div.categoryScore a { color:#000; }
 section#content div.categoryScore img {width:20px; height:20px; padding-right:5px; margin:center; }
 section#content div.categoryBtn { padding:10px 0; text-align:right; }
 section#content div.categoryType { color: #8c8c8cv; font-size:14px; }
 section#content div.icon { padding-bottom:10px; padding-top:10px; float:right; }
 section#content div.icon img { width:30px; height:30}


.form-control {
     border: 1px solid #EDEDED;
     background-color: #FFFFFF;
     height: 20px     
}

.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

</style>

<script>


$(function(){
	//카테고리 검색
	$("#btnSearch").click(function() {

// 		if($("#smallMenu").css("display")=="none"){
// 		 	$("#smallMenu").show();
// 		}
		
		var v_category = $("select[name=v_category]").val();
		var v_local = $("select[name=v_local]").val();
		location.href="/vendor/list?v_category=" + v_category + "&v_local=" + v_local;
		
	
	});
	
	// 페이지 번호
	$(".page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("href");
		var perPage = 12;
		
		location.href = "/vendor/list?page="+page+"&perPage="+perPage;
	});
	
	//홈페이지 링크 아이콘 클릭시 모달창 띄우기
	$(".callNumber").click(function(){
		console.log("클릭됨");
		var v_name = $(this).attr("data-name");
		var v_number = $(this).attr("data-number");
		
		console.log("v_name:"+v_name);
		console.log("v_number:"+v_number);
		
		$("#modal-828257").trigger("click");
		$("#myModalLabel").text(v_name+"의 연락처");
		$(".modal-body").text(v_number);
	});
	
	
	
	//별점순 클릭시
	$("#highNumber").click(function(e){
		e.preventDefault();
		
// 	$("input[name=orderby]").val("v_score");
// 	$("#frmSearch").submit();
		location.href="/vendor/list?orderby=v_score";
	
	});
	
	
	//최신순 클릭시
	$("#neweastDate").click(function(e){
		e.preventDefault();
			
//	 	$("input[name=orderby]").val("v_score");
//	 	$("#frmSearch").submit();

		location.href="/vendor/list?orderby=v_no";
		
	});
	
	//제목순 클릭시
	$("#byName").click(function(e){
		e.preventDefault();
		location.href="/vendor/list?orderby=v_name";
	});
	
});
</script>

	<!-- end banner -->
	<div class="back_re">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="title">
						<h2>Wedding Planner</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- our plane -->
	
	
	<!-- 모달창 -->
	<a id="modal-828257" href="#modal-container-828257" role="button" class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>

	<div class="modal fade" id="modal-container-828257" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body"></div>				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6">

								<!-- 카테고리 -->
								<div id="searchBox" style="margin-left: 80px">
									<form id="frmSearch"
										class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
										<input type="hidden" name="orderby" value="v_no" />

										<div class="input-group" style="margin: 50px">

											<select class="form-control" name="v_category">
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
											</select> <select class="form-control" name="v_local">
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

											<div class="input-group-append">
												<button id="btnSearch" class="btn btn-secondary"
													type="button">Search</button>
											</div>

											<div class="input-group-append">
												<button class="btn btn-secondary" type="button"
													onclick="location.href='/check/register'">CheckList</button>
											</div>
										</div>
									</form>
								</div>

							</div>

							<!-- 카테고리 옆에 작은 메뉴들 -->
							<div class="col-md-6" id="smallMenu">
								<div style="margin-left: 400px; margin-top: 60px;">
									<a href="#" id="highNumber" class="hideMenu">별점순</a> 
									<a style="padding-left: 20px; padding-right: 20px;" class="hideMenu">|</a> 
									<a href="#" id="neweastDate" class="hideMenu">최신순</a> 
									<a style="padding-left: 20px; padding-right: 20px;" class="hideMenu">|</a> 
									<a href="#" id="byName" class="hideMenu">이름순</a>
									<!-- <a style="padding-left : 20px; padding-right : 20px;" >|</a> -->
									<!-- <a href="#">좋아요순</a> -->
								</div>
							</div>
						</div>





						<!-- 카테고리 선택시 리스트 출력 -->
						<div class="row" id="cate_list">
							<div class="col-md-12">
								<div class="row">
									<!-- 테이블 양옆에 공간 -->
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<!-- 테이블 -->
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<section id="content">
														<ul>
															<c:forEach items="${list}" var="vendorVo">
																<li>

																	<div class="categoryImg">
																	<c:choose>
																		<c:when test="${vendorVo.v_pic eq null}">
																		<img src="/main_temp/images/category/noimage.jpg">                             
																		</c:when>
																		<c:otherwise>
																		<img src="/main_temp/images/category/${vendorVo.v_pic}">
																		</c:otherwise>
																	</c:choose>	
																	</div>

																	<div class="icon">
																		<div class="categoryLink">
																			<a href="${vendorVo.v_link}"><img
																				src="/main_temp/images/category/homepage.png"></a>
																		</div>

																		<div class="categoryNumber">
																			<%-- 																			<a href='tel:"${plannerVo.v_number}"'><img src="/images/category/call.png"></a> --%>
																			<a class="callNumber"
																				data-number="${vendorVo.v_number}"
																				data-name="${vendorVo.v_name}"><img
																				src="/main_temp/images/category/call.png"></a>
																		</div>
																	</div>

																	<div class="categoryAdress">
																		<a>${vendorVo.v_adress}</a>
																	</div>
																	<div class="categoryName">
																		<a>${vendorVo.v_name}</a>
																	</div>

																	<div class="categoryType">
																		<a>${vendorVo.v_type}</a>
																	</div>

																	<div class="categoryScore">
																		<a><img src="/main_temp/images/category/star.png">5점 /
																			${vendorVo.v_score}점</a>
																	</div>
																</li>
															</c:forEach>
														</ul>
													</section>
												</div>
											</div>
										</div>
									</div>
									<!-- 테이블 양옆에 공간 -->
									<div class="col-md-1"></div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
		
		<!-- 페이지이동 -->
		<div class="row">
			<div class="col-md-12">
				<nav>
					<ul class="pagination justify-content-center">
					<c:if test="${pagingVo.startPage ne 1}">
						<li class="page-item">
							<a class="page-link" href="${pagingVo.startPage - 1}">이전</a>
						</li>
					</c:if>
					<c:forEach var="p" begin="${pagingVo.startPage}" end="${pagingVo.endPage}">
						<li 
							<c:choose>
								<c:when test="${pagingVo.page eq p}">
									class="page-item active"
								</c:when>
								<c:otherwise>
									class="page-item"
								</c:otherwise>
							</c:choose>
						>
							<a class="page-link" href="${p}">${p}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pagingVo.endPage lt pagingVo.totalPage}">	
						<li class="page-item">
							<a class="page-link" href="${pagingVo.endPage + 1}">다음</a>
						</li>
					</c:if>	
					</ul>
				</nav>
			</div>
		</div>
		
		
		
	</div>


<%@ include file="../include/m_footer.jsp"	%>