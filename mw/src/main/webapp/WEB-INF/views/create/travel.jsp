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
</head>

<body>

<div class="boxed-page">
<%@include file="../include/create_topMenu.jsp" %>	
<!-- 오시는길 Section -->
<section id="gtco-welcome" class="bg-white section-padding">
    <div class="container">
        <div class="section-content">
            <div class="row">
                <div class="col-sm-5 img-bg d-flex shadow align-items-center justify-content-center justify-content-md-end img-2" 
                	style="background-image: url(/create/displayImg?pic=${map.travelVo.mapPic }); width='200px;' height='170px'">
                    
                </div>
                <div class="col-sm-7 py-5 pl-md-0 pl-4">
                    <div class="heading-section pl-lg-5 ml-md-5">
                      <span class="subheading">
                  		 ${fn:substring(map.homeVo.brideNm,0,3) } +
							${fn:substring(map.homeVo.groomNm,0,3) }
                		</span>                                        
                        <h2>
                        	오시는 길
                        </h2><br><br>
                          <span class="subheading">
                            ${map.travelVo.wedPlace }                          	
                        </span>
                       	 <p> 주소 - ${map.travelVo.tvl_addr }</p>             
                    </div>
                    <div class="pl-lg-5 ml-md-5" style="margin-top:20px">
                        <p>${map.travelVo.tvlDetail }</p>                   
                    </div>
                </div>
            </div>
        </div>
        </div>
</section>
<!-- End of 오시는길 -->	
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
