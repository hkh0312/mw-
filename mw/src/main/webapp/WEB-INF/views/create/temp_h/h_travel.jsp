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
					<span>TRAVEL</span>
					<h2>오시는 길</h2><hr>
				</div>
				
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<figure><img class="rborder_img" style="margin-bottom:20px; height:500px;" 
					<c:choose>
						<c:when test="${tVo ne null}">src="/tempH/displayImage?pic=${tVo.t_pic}"</c:when>
						<c:otherwise>src="/create_tempH/images/img_bg_2.jpg"</c:otherwise>
					</c:choose>
					></figure>
					<h2>
					<c:choose>
						<c:when test="${tVo ne null}">${tVo.t_wedloc}</c:when>
						<c:otherwise>주소</c:otherwise>
					</c:choose>
					</h2>
					<p id="homeIntro">
					<c:choose>
						<c:when test="${tVo ne null}">${tVo.t_text}</c:when>
						<c:otherwise>글 내용입니다.</c:otherwise>
					</c:choose>
					</p>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/h_footer.jsp"%>