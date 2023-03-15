<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/m_header.jsp" %>
<script>
$(document).ready(function() {
	// 템플릿 미리보기
	$(".wrapdiv_dark").click(function () {
		var id = $(this).attr("id");
		switch (id) {
			case "preview_tempY":
		 		window.open("/create/ysample");
				break;
			case "preview_tempH":
		 		window.open("/create/preview_tempH");
				break;
		}
	});
	
	// 템플릿 선택
	$(".template_box").click(function() {
		var id = $(this).attr("id");
		switch (id) {
			case "temp_y":
				$(location).attr('href', '/create/form');
				break;
			case "temp_h":
				$(location).attr('href', '/tempH/insert_info');
				break;
		}
	});
	
	$(".imgdiv_dark").hover(function() {
		$(this).children().first().css("filter", "brightness(0.45)");
		$(this).children().last().show();
		
	}, function() {
		$(this).children().first().css("filter", "brightness(1)");
		$(this).children().last().hide();
	});
	
});
</script>
	  <!-- banner -->
      </header>
      <!-- end banner -->
      <div class="back_re">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     <h2>페이지 템플릿 선택</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- our plane -->
      <div class="plane">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <div class="titlepage">
                     <h3>아래의 두 가지 템플릿 중에서 마음에 드는 템플릿을 선택해주세요.</h3>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-6">
                  <div class="plan_bax text_align_center">
                  	 <div id="preview_tempY" class="wrapdiv_dark" style="cursor:pointer;">
	                  	 <div class="imgdiv_dark">
	                  	 	<img class="img_dark" src="/main_temp/images/plan_img.jpg" alt="#">
	                  	 	<p class="text_dark" style="display:none"><a href="#" style="color: white">템플릿 미리보기</a></p>
	                  	 </div>
                  	 </div>
                  	 <div id="temp_y" class="plan_text template_box">
                        <h3>예은's템플릿</h3>
                        <p style="padding:20px 0 0">예은이의 템플릿입니다.<br>
                        	만드려면 클릭하세요.</p>
                     </div>
                  </div>
               </div>
               
               <div class="col-md-6">
                  <div class="plan_bax text_align_center">
                  	 <div id="preview_tempH" class="wrapdiv_dark" style="cursor:pointer;">
	                  	 <div class="imgdiv_dark">
	                  	 	<img class="img_dark" src="/main_temp/images/plan_img1.jpg" alt="#">
	                  	 	<p class="text_dark" style="color: white; display:none;">템플릿 미리보기</p>
	                  	 </div>
                  	 </div>
                     <div id="temp_h" class="plan_text template_box">
                        <h3>혜령's템플릿</h3>
                        <p style="padding:20px 0 0">혜령이의 템플릿입니다.<br>
                        	만드려면 클릭하세요.</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- our plane -->
<%@ include file="../include/m_footer.jsp" %>