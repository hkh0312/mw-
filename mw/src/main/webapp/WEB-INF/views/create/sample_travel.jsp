<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>

<body>
<div class="boxed-page">
<%@ include file="../include/ysample_header.jsp"%>
<!-- 오시는길 Section -->
<section id="gtco-welcome" class="bg-white section-padding">
	<div class="container">
		<div class="section-content">
			<div class="row">
				<div class="col-sm-5 img-bg d-flex shadow align-items-center justify-content-center justify-content-md-end img-2"
					style="background-image: url(/create_tempY/img/wedPlace.jpg); width='200px;' height='170px'">

				</div>
				<div class="col-sm-7 py-5 pl-md-0 pl-4">
					<div class="heading-section pl-lg-5 ml-md-5">
						<span class="subheading">
							지은탁+도깨비
							</span>
						<h2>오시는 길</h2>
						<br> <br> 
						<span class="subheading">
							잇다카페
						</span>
						<p>주소 - 경북 경주시 강동면 공정길 33-36</p>
					</div>
					<div class="pl-lg-5 ml-md-5" style="margin-top: 20px">
						<p>1.차는 길가에 주차해주세요 <br>
							2. 뒷마당에 작은 야구장이 설치되어있습니다.<br>
							야구하실분은 각자 준비물을 챙겨오세요^^</p>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End of 오시는길 -->
<%@include file="../include/sample_photofooter.jsp" %>
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
