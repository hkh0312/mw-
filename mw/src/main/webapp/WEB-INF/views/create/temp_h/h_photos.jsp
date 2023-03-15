<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/h_header.jsp"%>

	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" 
	<c:choose>
		<c:when test="${tpVo ne null}">
			style="background-image:url(/tempH/displayImage?pic=${tpVo.tp_titlepic});"
		</c:when>
		<c:otherwise>
			style="background-image:url(/create_tempH/images/img_bg_1.jpg);"
		</c:otherwise>
	</c:choose>
	>
		<div class="overlay"></div>
		<div class="fh5co-container">
			<%@ include file="/WEB-INF/views/include/h_header_title.jsp"%>
		</div>
	</header>

	<div id="fh5co-couple-story">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<span>Photos</span>
					<h2>사랑의 발자취</h2><hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-md-offset-0">
					<ul class="timeline animate-box">
						
				<c:choose>
					<c:when test="${pVo ne null}">
						<c:forEach items="${list_pdVo}" var="pdVo" varStatus="status">
							<c:choose>
								<c:when test="${status.count mod 2 eq 0}">
									<!-- 오 -->
									<li class="timeline-inverted animate-box">
									<div class="timeline-badge" style="background-image:url(images/couple-2.jpg);"></div>
										<img class="storyimg dpimg" style="margin-left:70px;" 
											src="/tempH/displayImage?pic=${pdVo.pd_pic}">
										<div class="timeline-panel">
											<div class="timeline-heading">
												<h3 class="timeline-title ptext2">${pdVo.pd_title}</h3>
												<span class="date">${pdVo.pd_pdate}</span>
											</div>
											<div class="timeline-body">
												<p class="ptext">${pdVo.pd_text}</p>
											</div>
										</div>
									</li>
								</c:when>
								<c:otherwise>
									<!-- 왼 -->
									<li class="animate-box">
									<div class="timeline-badge" style="background-image:url(images/couple-2.jpg);"></div>
										<img class="storyimg dpimg" style="margin-left:120px;" 
											src="/tempH/displayImage?pic=${pdVo.pd_pic}">
										<div class="timeline-panel" style="margin-right:120px;">
											<div class="timeline-heading">
												<h3 class="timeline-title ptext2">${pdVo.pd_title}</h3>
												<span class="date">${pdVo.pd_pdate}</span>
											</div>
											<div class="timeline-body">
												<p class="ptext">${pdVo.pd_text}</p>
											</div>
										</div>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
					<!-- 왼 -->
					<li class="animate-box">
					<div class="timeline-badge" style="background-image:url(images/couple-2.jpg);"></div>
						<img class="storyimg" style="margin-left:120px;" src="/create_tempH/images/groom.jpg">
						<div class="timeline-panel" style="margin-right:120px;">
							<div class="timeline-heading">
								<h3 class="timeline-title ptext2">예) 우리가 처음 만난 날</h3>
								<span class="date">0000년 00월 00일</span>
							</div>
							<div class="timeline-body">
								<p class="ptext">사진 설명입니다.</p>
							</div>
						</div>
					</li>
					
					<!-- 오 -->
					<li class="timeline-inverted animate-box">
					<div class="timeline-badge" style="background-image:url(images/couple-2.jpg);"></div>
						<img class="storyimg" style="margin-left:70px;" src="/create_tempH/images/bride.jpg">
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h3 class="timeline-title ptext2">예) 첫 데이트</h3>
								<span class="date">0000년 00월 00일</span>
							</div>
							<div class="timeline-body">
								<p class="ptext">사진 설명입니다.</p>
							</div>
						</div>
					</li>
					
					<!-- 왼 -->
					<li class="animate-box">
					<div class="timeline-badge" style="background-image:url(images/couple-2.jpg);"></div>
						<img class="storyimg" style="margin-left:120px;" src="/create_tempH/images/groom.jpg">
						<div class="timeline-panel" style="margin-right:120px;">
							<div class="timeline-heading">
								<h3 class="timeline-title ptext2">예) 둘이서 첫 여행</h3>
								<span class="date">0000년 00월 00일</span>
							</div>
							<div class="timeline-body">
								<p class="ptext">사진 설명입니다.</p>
							</div>
						</div>
					</li>
					
					<!-- 오 -->
					<li class="timeline-inverted animate-box">
					<div class="timeline-badge" style="background-image:url(images/couple-2.jpg);"></div>
						<img class="storyimg" style="margin-left:70px;" src="/create_tempH/images/bride.jpg">
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h3 class="timeline-title ptext2">예) 청혼 받다</h3>
								<span class="date">0000년 00월 00일</span>
							</div>
							<div class="timeline-body">
								<p class="ptext">사진 설명입니다.</p>
							</div>
						</div>
					</li>
					</c:otherwise>
				</c:choose>
			    	</ul>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/h_footer.jsp"%>