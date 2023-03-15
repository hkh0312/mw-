<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--
	Resto by GetTemplates.co
	URL: https://gettemplates.co
-->
<html lang="ko">
<head>
<%@include file="../include/create_home_css.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script>
$(document).ready(function(){
	//heartbtn
	$(".heartbtn").click(function(e){
		var that = $(this);
		var url = "";
		var sData;
		var count = parseInt($(this).text());
		console.log("count: " + count);
		var val = $(this).attr("data-value");
		console.log("val: " + val);
		if(val == undefined){
			url = "/like/chkcookie";	
	 		$.get(url, sData, function(rData){			
	 			console.log(rData);
	 			that.attr("data-value", rData);
	 			
	 		});
			//하트 db 전송
 			var url = "/like/sendLike";
	 		var clientId = "${loginInfo.url}";
	 		var qno = $(this).prev().text();
	 		var sData = {
	 			"clientId" : clientId,
	 			"qno" : qno
	 		};
	 		$.post(url,sData,function(rData){
	 			if(rData == true){
	 				console.log("하트 입력 성공");
	 				count++;
	 				console.log(that);
	 				console.log("count after insert" + count);
	 				that.text(count);
	 				that.css("color", "red");
	 			}
	 		});

		}else if(val != undefined){
			console.log("같은쿠키");
			$.get(url,sData, function(rData){				
				alert("이미 선택하신 하트입니다");
			});//.$get
		}
	});//$(.heartbtn);
});//(document)

</script>
</head>
<body>
	<div class="boxed-page">
		<%@include file="../include/create_topMenu.jsp"%>
		<!-- Menu Section -->
		<section id="gtco-menu" class="section-padding">
			<div class="container">
					<div class="row mb-5">
						<div class="col-md-12">
							<div class="heading-section text-center">
								<span class="subheading"> 									
					                   ${fn:substring(map.homeVo.brideNm,0,3) } +
										${fn:substring(map.homeVo.groomNm,0,3) }                
								</span>
								<h2>Q + A</h2>
							</div>
						</div>						
					</div>
				<div class="row justify-content-center align-items-center">				
					<div class="col-lg-8 menu-wrap">							
							<c:forEach var="qnaVo" items="${map.qnalist}" varStatus="status">
								<div class="swiper-slide">
								<div class="menus d-flex align-items-center">														
									<div class="text-wrap">									
										<div class="row align-items-start">										
											<div class="col-8">
												<h4>Q. ${qnaVo.ques}</h4>
											</div>
											<div class="col-4">
												<h4 class="text-muted menu-price ">
												<span style="display:none">${qnaVo.qno}</span>
													<i class="heartbtn fa fa-heart" aria-hidden="true">&nbsp;${qnaVo.likecount }</i>																																																												
												</h4>
																								
											</div>
										</div>
										<p>A. ${qnaVo.answer}</p>																																														
									</div>
								</div>
								</div>										
							</c:forEach>
						</div>
				</div>
			</div>
		</section>
		<!-- End of Q + A Section -->
		<%@include file="../include/photo_footer.jsp" %>
		<%@include file="../include/create_footer.jsp"%>
	
	</div>

	<!-- External JS -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script src="vendor/bootstrap/popper.min.js"></script>
	<script src="vendor/bootstrap/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js "></script>
	<script src="vendor/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="https://cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.js"></script>
	<script src="vendor/stellar/jquery.stellar.js" type="text/javascript"
		charset="utf-8"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Main JS -->
	<script src="js/app.min.js "></script>
</body>
</html>
