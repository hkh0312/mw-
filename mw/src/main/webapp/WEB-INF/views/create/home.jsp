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

		//qna.heartbtn
		$(".heartbtn").click(function(e) {
			var that = $(this);
			var url = "";
			var sData;
			var count = parseInt($(this).text());
			console.log("count: " + count);
			var val = $(this).attr("data-value");
			console.log("val: " + val);
			if (val == undefined) {
				url = "/like/chkcookie";
				$.get(url, sData, function(rData) {
					console.log(rData);
					that.attr("data-value", rData);

				});
				//하트 db 전송
				var url = "/like/sendLike";
				var clientId = "lee";
				var qno = $(this).prev().text();
				var sData = {
					"clientId" : clientId,
					"qno" : qno
				};
				$.post(url, sData, function(rData) {
					if (rData == true) {
						console.log("하트 입력 성공");
						count++;
						console.log(that);
						console.log("count after insert" + count);
						that.text(count);
						that.css("color", "red");
					}
				});

			} else if (val != undefined) {
				console.log("같은쿠키");
				$.get(url, sData, function(rData) {
					alert("이미 선택하신 하트입니다");
				});//.$get
			}
		});//$(.heartbtn);
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

		$("#askBtn").click(function(e) {
			e.preventDefault();
			console.log("click");
			var recipient = "lee";
			var question = $("#question").val();
			var sender = $("#sender").val();
			var url = "/create/ask";
			var sData = {
				"recipient" : recipient,
				"question" : question,
				"sender" : sender
			};
			if (question == "null" || sender == "null") {
				alert("빈칸없이 입력해주세요");
			}
			$.post(url, sData, function(rData) {
				console.log(rData);
				if (rData) {
					console.log("true confirm");
					$("#question").val("");
					$("#sender").val("");
					alert("질문이 커플에게 전달되었습니다.");
				} else {
					console.log(rData);
					alert("다시 한번 시도해주세요");
				}
			});
		});//$("#askBtn")

	});
</script>
</head>
<body>
	<div class="boxed-page">
		<!--include topMenu -->
		<%@ include file="../include/create_topMenu.jsp"%>
		<!-- end of topMenu -->

		<div class="hero">
			<div class="container">
				<div class="row d-flex align-items-center">
					<div class="col-lg-6 hero-left" style="margin-top: 100px">
						<span class="display-4 mb-5">${map.homeVo.brideNm }</span> &nbsp;<span
							class="display-4 mb-5">♥</span> &nbsp;<span
							class="display-4 mb-5">${map.homeVo.groomNm }</span>
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
							<h5 id="wedDate">${map.homeVo.wedDate }&nbsp;&nbsp;&nbsp;${map.homeVo.wedTime }</h5>
						</div>
						<div class="list-unstyled d-flex text-center mb-0t">
							<!-- 		    		<span class="lnr lnr-leaf"></span> -->
							<h5 id="wedPlace">${map.homeVo.wed_addr }</h5>
						</div>
						<div class="hero-info list-unstyled d-flex text-center mb-0">
							${map.homeVo.announce }</div>

					</div>
					<!-- map.homeVo.coverPic (수정해야함 - chooce 1 photo or multiple)-->
					<div class="col-lg-6 hero-right">
						<div
							class="owl-carousel owl-theme hero-carousel owl-loaded owl-drag">
							<div class="owl-stage-outer">
								<div class="owl-stage"
									style="transform: transform: translate3d(-2200px, 0px, 0px); transition: all 0.25s ease 0s; width: 3850px;">
									<div class="owl-item"
										style="width: 540px; margin-right: 10 px;">
										<div class="item">
											<img class="img-fluid" src="${map.homeVo.coverPic }" alt="">
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
							<img src="${map.storyVo.story_one_pic }" alt=""
								class="img-fluid shadow w-100">
						</div>
					</div>
					<div class="row mt-5">
						<div
							class="col-lg-5 col-md-6 align-self-center order-2 order-md-1 mt-4 mt-md-0">
							<img src="${map.storyVo.story_two_pic }" alt=""
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
		<!-- Q+A Section -->
		<section id="gtco-menu" class="section-padding">
			<div class="container">
				<div class="section-content">
					<div class="row mb-5">
						<div class="col-md-12">
							<div class="heading-section text-center">
								<span class="subheading"> <!-- session bridenm and groomnm -->
									${fn:substring(map.homeVo.brideNm,0,3) } +
									${fn:substring(map.homeVo.groomNm,0,3) }
								</span>
								<h2>Q + A</h2>
							</div>
						</div>
					</div>
					<div class="row justify-content-center align-items-center">
						<div class="col-lg-8 menu-wrap">
							<c:forEach var="qnaVo" items="${map.qnaVo}" varStatus="status">
								<div class="menus d-flex align-items-center">
									<div class="text-wrap">
										<div class="row align-items-start">
											<div class="col-8">
												<h4>Q. ${qnaVo.ques}</h4>
											</div>
											<div class="col-4">
												<h4 class="text-muted menu-price ">
													<span style="display: none">${qnaVo.qno}</span> <i
														class="heartbtn fa fa-heart" aria-hidden="true">&nbsp;${qnaVo.likecount }</i>

												</h4>
											</div>
										</div>
										<p>A. ${qnaVo.answer}</p>
									</div>
								</div>
							</c:forEach>
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
							${fn:substring(map.homeVo.brideNm,0,3) } +
							${fn:substring(map.homeVo.groomNm,0,3) } </span>
						<h2>사랑의 대나무숲</h2>
					</div>
					<div class="row">
						<div class="swiper-container">
							<div class="swiper-wrapper">

								<c:forEach var="mesVo" items="${map.mesVo }">
									<div class="swiper-slide">
										<div class="col-md-4">
											<div class="team-card mb-5">
												<img src="/create/displayImg?pic=${mesVo.mespic }" alt=""
													width="300" height="435">
												<div class="team-desc">
													<p class="mb-1">${mesVo.message }</p>
													<p class="mb-1">by ${mesVo.writer }</p>
													<p class="mb-1">-${mesVo.writedate }-</p>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>

					</div>
					<!-- class="row -->

				</div>
			</div>
		</section>
		<!-- End of 쪽지 디스플레이 -->
		<!-- 쪽지 보내기 Section -->
		<section id="gtco-reservation"
			class="bg-fixed bg-white section-padding overlay"
			style="background-image: url(${map.photoVo.mespic});">
			<div class="container">
				<div class="row">
					<div class="col-lg-5">
						<div class="section-content bg-white p-5 shadow">
							<div class="heading-section text-center">
								<h2>To.${fn:substring(map.homeVo.brideNm,0,3) } +
									${fn:substring(map.homeVo.groomNm,0,3) }</h2>
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
							style="background-image: url(${map.travelVo.mapPic }); width='200px;' height='170px'">

						</div>
						<div class="col-sm-7 py-5 pl-md-0 pl-4">
							<div class="heading-section pl-lg-5 ml-md-5">
								<span class="subheading">
									${fn:substring(map.homeVo.brideNm,0,3) } +
									${fn:substring(map.homeVo.groomNm,0,3) } </span>
								<h2>오시는 길</h2>
								<br> <br> <span class="subheading">
									${map.travelVo.wedPlace } </span>
								<p>주소 - ${map.travelVo.tvl_addr }</p>
							</div>
							<div class="pl-lg-5 ml-md-5" style="margin-top: 20px">
								<p>${map.travelVo.tvlDetail }</p>

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
			style="background-image: url(${map.photoVo.footerpic});">
			<div class="container">
				<div class="section-content">
					<div class="heading-section text-center">
						<span class="subheading">
							${fn:substring(map.homeVo.brideNm,0,3) } +
							${fn:substring(map.homeVo.groomNm,0,3) } </span>
						<h2>${map.photoVo.footer }</h2>
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
