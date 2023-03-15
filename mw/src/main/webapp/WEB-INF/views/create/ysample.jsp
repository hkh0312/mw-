<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	Resto by GetTemplates.co
	URL: https://gettemplates.co
-->
<html lang="ko">
<head>
<!-- include css ref -->
<%@include file="../include/create_home_css.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script>
$(document).ready(function() {
	//사랑의 대나무숲
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
	//축하+감사 쪽지 이미지 미리보기
	$("#file").change(function(e) {
		console.log("click");
		console.log(e);
		var file = $(this).val();
		console.log(file);
		var arrFile = file.split("\\");
		var filename = arrFile.pop();
		console.log(filename);
		$(".custom-file-label").text(filename);
		var binary = URL.createObjectURL(e.target.files[0]);//URL.createObjectURL(binary 파일을 읽는 기능) 
		$("#img").attr("src", binary);
	});
	//쪽지보내기
	$("#rdoQues").click(function() {
		$("#rdoMes").removeAttr("checked");
		$("#rdoQues").attr("checked", "checked");
		$("#mesform").hide(500);
		$("#askform").show(500);

	});
	$("#rdoMes").click(function() {
		$("#rdoQues").removeAttr("checked");
		$("#rdoMes").attr("checked", "checked");
		$("#askform").hide(500);
		$("#mesform").show(500);
	});
});
</script>
</head>
<body>
	<div class="boxed-page">
		<!--include topMenu -->
		<%@ include file="../include/ysample_header.jsp"%>
		<!-- end of topMenu -->

		<div class="hero">
			<div class="container">
				<div class="row d-flex align-items-center">
					<div class="col-lg-6 hero-left" style="margin-top: 100px">
						<span class="display-4 mb-5">지은탁</span> &nbsp;<span
							class="display-4 mb-5">♥</span> &nbsp;<span
							class="display-4 mb-5">도깨비</span>
						<div class="mb-2" style="margin-top: 120px">
							<a class="btn btn-primary btn-shadow btn-lg lnr lnr-rocket"
								id="announce" href="#" role="button"> 축의금 보내기 </a> <a
								class="btn btn-icon btn-lg"
								href="https://player.vimeo.com/video/33110953"
								data-featherlight="iframe"
								data-featherlight-iframe-allowfullscreen="true"> <span
								class="lnr lnr-film-play"></span> Play Video
							</a>
						</div>
						<br> <br> <br>
						<div class="hero-info list-unstyled d-flex text-center mb-0">
							<h5 id="wedDate">2023년 9월 23일 (토) &nbsp;&nbsp;&nbsp; 오후 2시</h5>
						</div>
						<div class="list-unstyled d-flex text-center mb-0t">
							<!-- 		    		<span class="lnr lnr-leaf"></span> -->
							<h5 id="wedPlace">잇다카페 - 경북 경주시 강동면 공정길 33-36</h5>
						</div>
						<div class="hero-info list-unstyled d-flex text-center mb-0">
							결혼이란 여행 출발점에 여러분을 초대합니다. <br>
							오셔서 축복해주시면 감사하겠습니다.</div>
					</div>
					<div class="col-lg-6 hero-right">
						<div
							class="owl-carousel owl-theme hero-carousel owl-loaded owl-drag">
							<div class="owl-stage-outer">
								<div class="owl-stage"
									style="transform: transform: translate3d(-2200px, 0px, 0px); transition: all 0.25s ease 0s; width: 3850px;">
									<div class="owl-item"
										style="width: 540px; margin-right: 10 px;">
										<div class="item">
											<img class="img-fluid" src="/create_tempY/img/wedding2.jpg" alt="">
										</div>
									</div>
								</div>
							</div>
							<div class="owl-dots disabled"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Special Dishes Section -->
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
		<!-- Q+A Section -->
		<section id="gtco-menu" class="section-padding">
			<div class="container">
				<div class="section-content">
					<div class="row mb-5">
						<div class="col-md-12">
							<div class="heading-section text-center">
								<span class="subheading"> <!-- session bridenm and groomnm -->
									지은탁+도깨비									
								</span>
								<h2>Q + A</h2>
							</div>
						</div>
					</div>
					<div class="row justify-content-center align-items-center">
						<div class="col-lg-8 menu-wrap">							
								<div class="menus d-flex align-items-center">
									<div class="text-wrap">
										<div class="row align-items-start">
											<div class="col-8">
												<h4>Q.신혼여행은 어디로 가나요?</h4>
											</div>
											<div class="col-4">
												<h4 class="text-muted menu-price ">													
												<i class="heartbtn fa fa-heart" aria-hidden="true">&nbsp;20</i>

												</h4>
											</div>
										</div>
										<p>A.캐나다 퀘백이요!</p>
									</div>
								</div>
								<div class="menus d-flex align-items-center">
									<div class="text-wrap">
										<div class="row align-items-start">
											<div class="col-8">
												<h4>Q.애프터파티 메뉴는 뭐에요?</h4>
											</div>
											<div class="col-4">
												<h4 class="text-muted menu-price ">													
												<i class="heartbtn fa fa-heart" aria-hidden="true">&nbsp;50</i>

												</h4>
											</div>
										</div>
										<p>A.도깨비시가 직접 구은 스테이크와 은탁이가 만든 샐러드입니다</p>
									</div>
								</div>
								<div class="menus d-flex align-items-center">
									<div class="text-wrap">
										<div class="row align-items-start">
											<div class="col-8">
												<h4>Q.신혼집 어디에 구했나요?</h4>
											</div>
											<div class="col-4">
												<h4 class="text-muted menu-price ">													
												<i class="heartbtn fa fa-heart" aria-hidden="true">&nbsp;50</i>

												</h4>
											</div>
										</div>
										<p>A.도깨비씨 집에서 도깨비씨 룸메랑 같이 살아요</p>
									</div>
								</div>
							</div>							
						</div>
					</div>
				</div>
		</section>
		<!-- End of Q + A Section -->
		<!-- 쪽지 디스플레이 Section -->
		<section id="gtco-team" class="bg-grey section-padding">
			<div class="container">
				<div class="section-content">
					<div class="heading-section text-center">
						<span class="subheading">
							지은탁+도깨비
						</span>
						<h2>사랑의 대나무숲</h2>
					</div>
					<div class="row">
						<div class="swiper-container">
							<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="col-md-4">
											<div class="team-card mb-5">
												<img src="/create_tempY/img/euntakSolo.jpg" alt=""
													width="300" height="435">
												<div class="team-desc">
													<p class="mb-1">오라버니가 말 안들으면 나한테 꼭 톡해^^ 진심으로 결혼축하해!</p>
													<p class="mb-1"><b>by 치킨 사장님</b></p>
													<p class="mb-1">-2023/01/25-</p>
												</div>
											</div>
											</div>
										</div>
										<div class="swiper-slide">
											<div class="col-md-4">
												<div class="team-card mb-5">
													<img src="/create_tempY/img/rommie.jpg" alt=""
														width="300" height="435">
													<div class="team-desc">
														<p class="mb-1">우리 평생 지금처럼 사이좋게 하우스메이트로 잘 살자!</p>
														<p class="mb-1"><b>by 저승사자</b></p>
														<p class="mb-1">-2023/01/24-</p>
												</div>
											</div>
											</div>
										</div>
										<div class="swiper-slide">
											<div class="col-md-4">
												<div class="team-card mb-5">
													<img src="/create_tempY/img/manager.jpg" alt=""
														width="300" height="435">
													<div class="team-desc">
														<p class="mb-1">결혼 진심으로 축하드립니다.</p>
														<p class="mb-1"><b>by 비서</b></p>
														<p class="mb-1">-2023/01/24-</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
							</div>
							
						</div>
					<!-- class="row -->			
			</div>
		</section>
		<!-- End of 쪽지 디스플레이 -->
		<!-- 쪽지 보내기 Section -->
		<section id="gtco-reservation"
			class="bg-fixed bg-white section-padding overlay"
			style="background-image: url(/create_tempY/img/withFriends.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-lg-5">
						<div class="section-content bg-white p-5 shadow">
							<div class="heading-section text-center">
								<h2>To.지은탁+도깨비</h2>
							</div>
							<div style="margin-bottom: 40px">
								<input type="radio" id="rdoMes" name="mesType" checked>축하+감사쪽지
								<input type="radio" id="rdoQues" name="mesType">커플에게
								궁금한점
							</div>
							<!-- 축하+감사 쪽지 -->
							<form id="mesform" method="post" action="/create/message"
								enctype="multipart/form-data">
								<div class="row">

									<div class="col-md-12 form-group">
										<div class="input-group date" id="datetimepicker4"
											data-target-input="nearest">
											<input type="text" class="form-control datetimepicker-input"
												data-target="#datetimepicker4" name="writedate"
												placeholder="추억의 그날" />
											<div class="input-group-append"
												data-target="#datetimepicker4" data-toggle="datetimepicker">
												<div class="input-group-text">
													<span class="lnr lnr-calendar-full"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-12 form-group">
										<textarea class="form-control" id="message" name="message"
											rows="6" placeholder="친구야~ 결혼 진심으로 축하하고 늘 고마웠어!!"></textarea>
									</div>
									<div class="col-md-12 form-group">
										<img src="" id="img" width="120px">
									</div>
									<div class="col-md-12 form-group">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="file"
												name="file" accept="image/*"> <label
												class="custom-file-label" for="customFile">사진 검색</label>
										</div>
									</div>
									<div class="col-md-12 form-group">
										<input type="text" class="form-control" id="name"
											name="writer" placeholder="이름">
									</div>
									<div class="col-md-12 text-center">
										<button class="btn btn-primary btn-shadow btn-lg"
											type="submit" id="mesBtn" name="submit">
											<i class="fa fa-paper-plane" aria-hidden="true"></i>보내기
										</button>
									</div>
								</div>
							</form>
							<!-- 질문 쪽지 -->
							<form id="askform" method="post" action="/create/ask"
								enctype="multipart/form-data" style="display: none">
								<div class="row">
									<div class="col-md-12 form-group">
										<textarea class="form-control" id="question" name="question"
											rows="6" placeholder="예) 서로의 첫인상은?"></textarea>
									</div>
									<div class="col-md-12 form-group">
										<input type="text" class="form-control" id="sender"
											name="sender" placeholder="이름">
									</div>
									<div class="col-md-12 text-center">
										<button class="btn btn-primary btn-shadow btn-lg"
											type="submit" id="askBtn" name="submit">
											<i class="fa fa-paper-plane" aria-hidden="true"></i>보내기
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End of 쪽지 보내기-->
		<!-- 오시는길 Section -->
		<section id="gtco-welcome" class="bg-white section-padding">
			<div class="container">
				<div class="section-content">
					<div class="row">
						<div
							class="col-sm-5 img-bg d-flex shadow align-items-center justify-content-center justify-content-md-end img-2"
							style="background-image: url(/create_tempY/img/wedPlace.jpg); width='200px;' height='170px'">

						</div>
						<div class="col-sm-7 py-5 pl-md-0 pl-4">
							<div class="heading-section pl-lg-5 ml-md-5">
								<span class="subheading">
									지은탁+도깨비
									</span>
								<h2>오시는 길</h2>
								<br> <br> <span class="subheading">
									</span>
								<p>주소 - 경북 경주시 강동면 공정길 33-36</p>
							</div>
							<div class="pl-lg-5 ml-md-5" style="margin-top: 20px">
								<p>1.차는 길가에 주차해주세요 2. 뒷마당에 작은 야구장이 설치되어있습니다. 야구하실분은 각자 준비물을 챙겨오세요^^</p>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End of 오시는길 -->
		<!-- Testimonial Section-->
		<section id="gtco-testimonial"
			class="overlay bg-fixed section-padding"
			style="background-image: url(/create_tempY/img/footer.jpg);">
			<div class="container">
				<div class="section-content">
					<div class="heading-section text-center">
						<span class="subheading">
							지은탁+도깨비
						</span>
						<h2>잘 살겠습니다!</h2>
					</div>
		
				</div>
			</div>
		</section>
		<!-- End of Testimonial Section-->
		<%@ include file="../include/create_footer.jsp"%>
	</div>
	<!-- </div> -->
	<!-- External JS -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script src="/create_tempY/vendor/bootstrap/popper.min.js"></script>
	<script src="/create_tempY/vendor/bootstrap/bootstrap.min.js"></script>
	<script src="/create_tempY/vendor/select2/select2.min.js "></script>
	<script src="/create_tempY/vendor/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="https://cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.js"></script>
	<script src="/create_tempY/vendor/stellar/jquery.stellar.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Main JS -->
	<script src="js/app.min.js "></script>

</body>
</html>
