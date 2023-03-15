<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<!-- Special Dishes Section -->
		<section id="gtco-special-dishes" class="bg-grey section-padding">
			<div class="container">
				<div class="section-content">
					<div class="heading-section text-center">
						<span class="subheading">
							${fn:substring(map.homeVo.brideNm,0,3) } +
							${fn:substring(map.homeVo.groomNm,0,3) } </span>
						<h2>Our Story</h2>
					</div>
					<div class="row mt-5">
						<div class="col-lg-5 col-md-6 align-self-center py-5">
							<h2 class="special-number">01.</h2>
							<div class="dishes-text">
								<h3>
									<span>${map.storyVo.story_one_title }</span>
								</h3>
								<p class="pt-3">${map.storyVo.story_one_con }</p>
							</div>
						</div>
						<div
							class="col-lg-5 offset-lg-2 col-md-6 align-self-center mt-4 mt-md-0">
							<img src="/create/displayImg?pic=${map.storyVo.story_one_pic }" alt=""
								class="img-fluid shadow w-100">
						</div>
					</div>
					<div class="row mt-5">
						<div
							class="col-lg-5 col-md-6 align-self-center order-2 order-md-1 mt-4 mt-md-0">
							<img src="/create/displayImg?pic=${map.storyVo.story_two_pic }" alt=""
								class="img-fluid shadow w-100">
						</div>
						<div
							class="col-lg-5 offset-lg-2 col-md-6 align-self-center order-1 order-md-2 py-5">
							<h2 class="special-number">02.</h2>
							<div class="dishes-text">
								<h3>
									<span>${map.storyVo.story_two_title }</span>
								</h3>
								<p class="pt-3">${map.storyVo.story_two_con }</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End of Special Dishes Section -->
<%@include file="../include/photo_footer.jsp" %>	
<%@ include file="../include/create_footer.jsp" %>
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
    