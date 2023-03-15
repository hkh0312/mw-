<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/main_temp/js/hscript.js"></script>
<script>
$(document).ready(function() {
	// 파일 선택 버튼
	$("#btnInputFile").click(function () {
		$("#inputFile").trigger("click");
	});
	
	// 파일 선택시
	$("#inputFile").change(function(e) {
		var fileName = $(this).val().split("\\").pop();
		var file = this.files[0];
		if (isImage(file)) {
			$("#filename").text(fileName);
		} else {
			alert("해당 파일은 이미지 파일이 아닙니다. 이미지 파일을 등록해주세요.");
		}
	});
});
</script>
    <!-- 축하 메세지 남기기 -->
	<div id="fh5co-started" class="fh5co-bg" 
	<c:choose>
			<c:when test="${tpVo ne null}"
			>style="background-image:url(/tempH/displayImage?pic=${tpVo.tp_mpic});"</c:when>
			<c:otherwise>style="background-image:url(/create_tempH/images/img_bg_4.jpg);"</c:otherwise>
		</c:choose>>
		<div id="sendMsg" class="overlay"></div>
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>축복해 주세요</h2>
					<p style="margin:20px 0px 20px;">축복의 말을 전하고 싶으시다면 축하 메세지를 남겨주세요.</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-5 col-md-offset-1" style="margin-left: 29.3%;">
					<form>
						<div class="col-md-12 col-sm-4">
							<div class="form-group">
								<textarea class="form-control" id="msgcontent" placeholder="내용을 입력하세요." 
									style="font-family: 'SimKyungha'; resize:none;"
									maxlength="156" rows="4"></textarea>
							</div>
						</div>
						
						<div class="col-md-6 col-sm-2">
							<div class="form-group" style="margin-right:10px;">
								<input type="text" class="form-control" id="name" 
									placeholder="이름을 입력하세요." maxlength="6" style="font-family:'SimKyungha';">
							</div>
						</div>
						<div class="col-md-6 col-sm-2">
							<div class="form-group">
								<input type="password" class="form-control" id="pwd" 
									placeholder="비밀번호를 입력하세요." maxlength="10" style="font-family:'SimKyungha';">
							</div>
						</div>
						<div class="col-md-7 col-sm-4">
							<h2 id="filename" style="margin-top:15px; margin-left:10px; font-size:20px; color:white;"
								>파일명.jpg</h2>
						</div>
						<div class="col-md-3 col-sm-4">
							<button id="btnInputFile" type="button" class="btn btn-default btn-block">파일 선택</button>
							<input id="inputFile" type="file" style="display:none;">
						</div>
						<div class="col-md-2 col-sm-4">
							<button type="submit" class="btn btn-default btn-block">남기기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- sendMoney Modal-->
	<div class="modal fade" id="moneyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	    aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h2 id="modalTitle" class="modal-title" id="exampleModalLabel" style="display:inline; font-family:'SimKyungha';">
	                	축의금 보내기
	                </h2>
	                <button id="btnPause" class="close" type="button" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true" style="font-size:30px;">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
		            <p id="modal_p">모달 내용<p>
	            </div>
	            <div class="modal-footer">
	                <button id="btnCancel" class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
	                <button id="btnReply" class="btn btn-primary" type="button">보내기</button>
	            </div>
	        </div>
	    </div>
	</div>
	</body>
</html>    