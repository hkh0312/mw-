<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--
	Resto by GetTemplates.co
	URL: https://gettemplates.co
-->
<html lang="en">
<head> 
<%@include file="../include/create_home_css.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

</head>
<body>
<div class="boxed-page">
<%@ include file="../include/ysample_header.jsp"%>
<section id="gtco-special-dishes" class="bg-grey section-padding">
			<div class="container">
				<div class="section-content">
					<div class="heading-section text-center">
						<span class="subheading">
							지은탁+도깨비 </span>
						<h2>Our Story</h2>
					</div>
					<div class="row mt-5">
						<div class="col-lg-5 col-md-6 align-self-center py-5">
							<h2 class="special-number">01.</h2>
							<div class="dishes-text">
								<h3>
									<span>첫만남</span>
								</h3>
								<p class="pt-3">처음엔 아저씨가 저승사자인가 했어요 근데 저승사자면 절 보자마자 데려갔을 거에요. 그 다음엔 귀신이구나 했어요 근데 아저씬 그림자가 있었어요. 그래서 생각을 해봤죠 대체 저 아저씬 뭘까 도깨비요!</p>
							</div>
						</div>
						<div
							class="col-lg-5 offset-lg-2 col-md-6 align-self-center mt-4 mt-md-0">
							<img src="/create_tempY/img/ourFirst.jpg" alt=""
								class="img-fluid shadow w-100">
						</div>
					</div>
					<div class="row mt-5">
						<div
							class="col-lg-5 col-md-6 align-self-center order-2 order-md-1 mt-4 mt-md-0">
							<img src="/create_tempY/img/date.jpg" alt="" class="img-fluid shadow w-100">
						</div>
						<div
							class="col-lg-5 offset-lg-2 col-md-6 align-self-center order-1 order-md-2 py-5">
							<h2 class="special-number">02.</h2>
							<div class="dishes-text">
								<h3>
									<span>서로와 함께한 시간 모두 눈부셨다.</span>
								</h3>
								<p class="pt-3">날이 좋아서, 날이 좋지 않아서, 날이 적당해서, 모든 날이 좋아서 그래서 영원히 함께 하기로 했습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<!-- End of Special Dishes Section -->	

<%@include file="../include/sample_photofooter.jsp" %>
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
    