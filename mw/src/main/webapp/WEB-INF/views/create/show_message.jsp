<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--
	Resto by GetTemplates.co
	URL: https://gettemplates.co
-->
<html lang="ko">

<head>
<%@include file="../include/create_home_css.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script>
$(document).ready(function(){
	new Swiper('.swiper-container', {

		slidesPerView : 3, 
		spaceBetween : 30, 
		slidesPerGroup : 3,
		
		loopFillGroupWithBlank : true,

		loop : true,

		navigation : { 
			nextEl : '.swiper-button-next', 
			prevEl : '.swiper-button-prev',
		},
	});

});
</script>
</head>

<body>

<div class="boxed-page">
<%@include file="../include/create_topMenu.jsp" %>	
<!-- 오시는길 Section -->

<!-- 쪽지 디스플레이 Section -->
<section id="gtco-team" class="bg-grey section-padding">
    <div class="container">
        <div class="section-content">
            <div class="heading-section text-center">
                <span class="subheading">
                <!-- 세션 신부이름, 신랑이름 -->
              		${fn:substring(map.homeVo.brideNm,0,3) } +
					${fn:substring(map.homeVo.groomNm,0,3) }
                </span>
                <h2>
                   사랑의 대나무숲
                </h2>
            </div>
            <div class="row">
            	<div class="swiper-container">
            		<div class="swiper-wrapper">               	                  
	           	     
	              	<c:forEach var="messageVo" items="${map.meslist}">
	              	 	<div class="swiper-slide">                   			      			          	
				          <div class="col-md-4">
		                    <div class="team-card mb-5">
		                        <img src="/create/displayImg?pic=${messageVo.mespic }" alt="" width="300" height="435">		              
		                        <div class="team-desc">
		                            <p class="mb-1">${messageVo.message }</p>
		                            <p class="mb-1">by ${messageVo.writer }</p>                
		                            <p class="mb-1">-${messageVo.writedate }-</p>                
		                        </div>
		                    </div>
			               </div>
		             	</div>        		           	          		       		     	                		                	        		      
		              </c:forEach>
		              </div>
		              	<div class="swiper-button-next"></div>
		              	<div class="swiper-button-prev"></div>
		         	</div>
		         							            	    					
				</div><!-- class="row -->
								         			                      
            </div>        
        </div>
</section>
<!-- End of 쪽지 디스플레이 -->	
<%@include file="../include/photo_footer.jsp" %>
<%@include file="../include/create_footer.jsp" %>
</div>

	<!-- External JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script src="vendor/bootstrap/popper.min.js"></script>
	<script src="vendor/bootstrap/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js "></script>
	<script src="vendor/owlcarousel/owl.carousel.min.js"></script>
	<script src="https://cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.js"></script>
	<script src="vendor/stellar/jquery.stellar.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Main JS -->
	<script src="js/app.min.js "></script>
</body>
</html>
