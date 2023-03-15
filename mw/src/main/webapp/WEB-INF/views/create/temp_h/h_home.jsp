<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/h_header.jsp"%>
<script>
$(document).ready(function() {
	var message = "${message}";
	console.log("message: ", message);
	if (message != null && message != "") {
		alert("${message}");
	};
});
</script>
	<header id="fh5co-header" class="fh5co-cover" role="banner" 
		<c:choose>
			<c:when test="${tpVo ne null}"
				>style="background-image:url(/tempH/displayImage?pic=${tpVo.tp_htitlepic});"</c:when>
			<c:otherwise
				>style="background-image:url(/create_tempH/images/img_bg_2.jpg);"</c:otherwise>
		</c:choose>
		>
		<div class="overlay"></div>
		<div class="container">
			<%@ include file="/WEB-INF/views/include/h_header_title.jsp"%>
		</div>
	</header>

	<div id="fh5co-couple">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<figure><img class="rborder_img" style="margin-bottom:20px; height:500px;" 
						<c:choose>
							<c:when test="${hVo ne null}">src="/tempH/displayImage?pic=${hVo.h_pic}"</c:when>
							<c:otherwise>src="/create_tempH/images/img_bg_2.jpg"</c:otherwise>
						</c:choose>
						></figure>
					<h3 style="font-size:30px;">
						<c:choose>
							<c:when test="${hVo ne null}">${hVo.h_weddate}</c:when>
							<c:otherwise>결혼 날짜</c:otherwise>
						</c:choose>
					</h3>
					<h3>
						<c:choose>
							<c:when test="${hVo ne null}">${hVo.h_wedloc}</c:when>
							<c:otherwise>결혼 장소</c:otherwise>
						</c:choose>
					</h3><br>
					<h2 style="font-size:60px;">
						<c:choose>
							<c:when test="${hVo ne null}">${hVo.h_gname} &amp; ${hVo.h_bname}</c:when>
							<c:otherwise>신랑이름 &amp; 신부이름</c:otherwise>
						</c:choose>
					</h2><br>
					<p id="homeIntro">함께 키워온 두 사람의 사랑이 결실을 맺게 되었습니다.<br>
						저희의 결혼식에 소중한 인연이 되어주신 당신을 초대합니다.<br>
						바쁘시더라도 귀한 걸음으로 축복해 주시면<br>
						더 없는 기쁨으로 간직하겠습니다.</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 결혼식 행사 일정 -->
	<div id="fh5co-event" class="fh5co-bg" 
		<c:choose>
			<c:when test="${tpVo ne null}"
			>style="background-image:url(/tempH/displayImage?pic=${tpVo.tp_hspic});"</c:when>
			<c:otherwise>style="background-image:url(/create_tempH/images/img_bg_3.jpg);"</c:otherwise>
		</c:choose>>
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<span>WEDDING EVENTS</span>
					<h2>결혼식 일정 안내</h2>
				</div>
			</div>
			<div class="row">
				<div class="display-t">
					<div class="display-tc">
						<div class="col-md-12 col-sm-6 text-center">
							<div style="padding:0px 100px;">
							<div class="event-wrap animate-box" style="width:100%;">
								<h3>진행 순서</h3>
								<div class="event-col">
									<div style="margin:10px 0px 20px;">
										<i class="icon-clock"></i>
									</div>
									<c:choose>
										<c:when test="${list_hsVo ne null}">
											<c:forEach items="${list_hsVo}" var="hsVo">
												<span style="font-size: 18px; margin-bottom:10px;">${hsVo.hs_starttime} ~ ${hsVo.hs_endtime}</span>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<span style="font-size: 18px; margin-bottom:10px;">시작시간 ~ 종료시간</span>
											<span style="font-size: 18px; margin-bottom:10px;">오전 00시 00분 ~ 오후 00시 00분</span>
											<span style="font-size: 18px; margin-bottom:10px;">. . .</span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="event-col">
									<div style="margin:10px 0px 20px;">
										<i class="icon-calendar"></i>
									</div>
									<c:choose>
										<c:when test="${list_hsVo ne null}">
											<c:forEach items="${list_hsVo}" var="hsVo">
												<span style="font-size: 18px; margin-bottom:10px;">${hsVo.hs_event}</span>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<span style="font-size: 18px; margin-bottom:10px;">행사명</span>
											<span style="font-size: 18px; margin-bottom:10px;">결혼식 진행</span>
											<span style="font-size: 18px; margin-bottom:10px;">. . .</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 지인 댓글 미리보기(최신순 top5) -->
	<div id="fh5co-testimonial">
		<div class="container">
			<div class="row">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<span>MESSAGES</span>
						<h2>축복의 메세지</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 animate-box">
						<div class="wrap-testimony">
							<div class="owl-carousel-fullwidth">
								<div class="item">
									<div class="testimony-slide active text-center">
										<div>
											<img src="/create_tempH/images/groom.jpg" alt="user">
										</div>
										<span style="margin-top:30px; font-size:23px;">작성자 이름1</span>
										<span>0000년 00월 00일 00시 00분</span>
										<blockquote>
											<p class="Anssang">"친구야 결혼 축하한다. 행복하게 잘 살아라~"</p>
										</blockquote>
									</div>
								</div>
								<div class="item">
									<div class="testimony-slide active text-center">
										<div>
											<img src="/create_tempH/images/bride.jpg" alt="user">
										</div>
										<span style="margin-top:30px; font-size:23px;">작성자 이름2</span>
										<span>0000년 00월 00일 00시 00분</span>
										<blockquote>
											<p class="Anssang">"친구야 결혼 축하한다. 행복하게 잘 살아라~"</p>
										</blockquote>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<% session.removeAttribute("message"); %>
<%@ include file="/WEB-INF/views/include/h_footer.jsp"%>