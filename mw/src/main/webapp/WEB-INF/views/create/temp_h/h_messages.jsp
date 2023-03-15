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

	<div id="fh5co-gallery">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<span>MESSAGES</span>
					<h2>축복의 메세지</h2><hr>
				</div>
			</div>
			<div class="row row-bottom-padded-md">
				<div class="col-md-12">
					<ul id="fh5co-gallery-list">
						
						<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/gallery-1.jpg); "> 
						<a href="images/gallery-1.jpg">
							<div class="case-studies-summary">
								<span>14 Photos</span>
								<h2>Two Glas of Juice</h2>
							</div>
						</a>
					</li>
					<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/gallery-2.jpg); ">
						<a href="#" class="color-2">
							<div class="case-studies-summary">
								<span>30 Photos</span>
								<h2>Timer starts now!</h2>
							</div>
						</a>
					</li>


					<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/gallery-3.jpg); ">
						<a href="#" class="color-3">
							<div class="case-studies-summary">
								<span>90 Photos</span>
								<h2>Beautiful sunset</h2>
							</div>
						</a>
					</li>
					<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/gallery-4.jpg); ">
						<a href="#" class="color-4">
							<div class="case-studies-summary">
								<span>12 Photos</span>
								<h2>Company's Conference Room</h2>
							</div>
						</a>
					</li>

						<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/gallery-5.jpg); ">
							<a href="#" class="color-3">
								<div class="case-studies-summary">
									<span>50 Photos</span>
									<h2>Useful baskets</h2>
								</div>
							</a>
						</li>
						<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/gallery-6.jpg); ">
							<a href="#" class="color-4">
								<div class="case-studies-summary">
									<span>45 Photos</span>
									<h2>Skater man in the road</h2>
								</div>
							</a>
						</li>

						<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/gallery-7.jpg); ">
							<a href="#" class="color-4">
								<div class="case-studies-summary">
									<span>35 Photos</span>
									<h2>Two Glas of Juice</h2>
								</div>
							</a>
						</li>

						<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/gallery-8.jpg); "> 
							<a href="#" class="color-5">
								<div class="case-studies-summary">
									<span>90 Photos</span>
									<h2>Timer starts now!</h2>
								</div>
							</a>
						</li>
						<li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/gallery-9.jpg); ">
							<a href="#" class="color-6">
								<div class="case-studies-summary">
									<span>56 Photos</span>
									<h2>Beautiful sunset</h2>
								</div>
							</a>
						</li>
					</ul>
				</div>
				<div class="col-md-12" style="text-align:center";>
					<ul class="pagination justify-content-center">
					    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
					    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
					    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
					    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
					  </ul>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/h_footer.jsp"%>