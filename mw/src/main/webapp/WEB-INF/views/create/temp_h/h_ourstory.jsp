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
					<span>Our Story</span>
					<h2>우리의 이야기</h2><hr>
				</div>
				
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<c:choose>
						<c:when test="${oVo ne null}">
							<figure><img class="rborder_img" style="margin-bottom:20px; height:500px;" 
								src="/tempH/displayImage?pic=${oVo.o_pic}"></figure>
							<h2>${oVo.o_title}</h2>
							<br>
							<textarea id="ta_ocontent" style="display:none;">${oVo.o_content}</textarea>
							<p id="homeIntro_vo"></p>
						</c:when>
						<c:otherwise>
							<figure><img class="rborder_img" style="margin-bottom:20px; height:500px;" 
								src="/create_tempH/images/img_bg_2.jpg"></figure>
							<h2>타이틀</h2>
							<br>
							<p id="homeIntro">글 내용입니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/h_footer.jsp"%>