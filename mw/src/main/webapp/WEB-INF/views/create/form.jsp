<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/m_header.jsp"%>
<style>
.col-xs-3 {
	margin-left: 12px;
	margin-right: 20px;
}

.col-xs-4 {
	margin-left: 12px;
	margin-right: 20px;
}

.col_reverse {
	margin-left: 12px;
}

.right_float {
	float: right;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>		
<script>
	$(document).ready(
			function() {
				//결혼식 시간
				var wedTime = "${map.homeVo.wedTime }";
				$("#dropdownMenuButton").val(wedTime);

				//이미지 미리보기
				$("#pick_coverpic").on("change", function(e) {
					;
					var file = $(this).val();
					var filename = file.split("\\").pop();
					console.log("filename: " + filename);
					$(this).next().text(filename);
					console.log(e.target.files[0]);
					var cover_addr = URL.createObjectURL(e.target.files[0]);
					$("#coverPic").attr("src", cover_addr);
				});
				$("#story_one_pic").on("change", function(e) {
					var file = $(this).val();
					var filename = file.split("\\").pop();
					$(this).next().text(filename);
					var storyone_addr = URL.createObjectURL(e.target.files[0]);
					$("#storyPic1").attr("src", storyone_addr);
				});
				$("#story_two_pic").on("change", function(e) {
					var file = $(this).val();
					var filename = file.split("\\").pop();
					$(this).next().text(filename);
					var storytwo_addr = URL.createObjectURL(e.target.files[0]);
					$("#stroyPic2").attr("src", storytwo_addr);
				});
				$("#pick_mes").on("change", function(e) {
					var file = $(this).val();
					var filename = file.split("\\").pop();
					$(this).next().text(filename);
					var mes_addr = URL.createObjectURL(e.target.files[0]);
					$("#mesPic").attr("src", mes_addr);
				});
				$("#pick_map").on("change", function(e) {
					var file = $(this).val();
					var filename = file.split("\\").pop();
					$(this).next().text(filename);
					var map_addr = URL.createObjectURL(e.target.files[0]);
					$("#mapPic").attr("src", map_addr);
				});
				$("#pick_footer").on("change", function(e) {
					var file = $(this).val();
					var filename = file.split("\\").pop();
					$(this).next().text(filename);
					var footer_addr = URL.createObjectURL(e.target.files[0]);
					$("#footerPic").attr("src", footer_addr);
				});

				//질문+답변 추가
				$("#addQnA").click(
						function(e) {
							e.preventDefault();
							var hiddenVal = $("#hidden").val();
							console.log("hiddenVal: " + hiddenVal);
							if (hiddenVal == 1) {
								var clonedQnA = $("#updateQnA").clone();
								clonedQnA.find("input").val("");
								clonedQnA.find("input[name=update_ques]").attr(
										"name", "arr_ques");
								clonedQnA.find("textarea").val("");
								clonedQnA.find("textarea").attr("name",
										"arr_answers");
								$("#attachQnA").append(clonedQnA);
								clonedQnA.show(500);
							} else if (hiddenVal == 0) {
								$(".delQnA").removeAttr("style");
								var clonedQnA = $("#originQnA").clone();
								clonedQnA.find("input").val("");
								clonedQnA.find("textarea").val("");
								$("#originQnA").find("a").attr("style",
										"display:none");
								$("#attachQnA").append(clonedQnA);
								clonedQnA.show(500);
							}

								//입력본- 질문+답변 삭제
								$(".delQnA").click(function(e) {
									console.log("click");
									e.preventDefault();
									clonedQnA.remove();
								});

						});
				//수정본 - 질문+답변 삭제
				$(".delQnA").click(function(e) {
					console.log("click");
					e.preventDefault();
					var that = $(this);
					var qno = $(this).parent().find("input[name=qno]").val();
					console.log(qno);
					var url = "/create/delqna";
					var clientId = "${userVo.userid}";
					var sData = {
						"qno" : qno,
						"clientId" : clientId
					};
					$.get(url, sData, function(rData) {
						console.log(rData);
						if (rData == true) {
							console.log("true");
							console.log(that);
							that.parent().remove();
						}
						;

					});

				});
				//시간 dropdown
				$(".dropdown-item").click(function(e) {
					e.preventDefault();
					console.log("click");
					console.log(this);
					var timeText = this.val();
					console.log(timeText);
					$("#dropdownMenuButton").text(timeText);
				});

				//템프삭제
				var result = "${result}";
				if (result == "fail_delete") {
					alert("템플릿 삭제 실패했습니다. 다시 시도해주세요");
				};
				
});//$(document).ready
</script>
	  <!-- banner -->
      <!-- end banner -->
      <div class="back_re">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     <h2>나의 프로젝트</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
	<!-- blog -->
	<div class="blog">
		<div class="container">
		<div class="col-md-12" style="float:right; padding-bottom:10px">
			<a href="/main/create_form"><button type="button" class="btn" style="float:right;"><strong>이전으로</strong></button></a>
		</div>
		<form role="form" action="/create/insertRun" method="post" enctype="multipart/form-data" id="myform">
				<input type="hidden" id="hidden" name="pjnum" value="${userVo.pjnum }">
				<div class="row">
					<!-- Home -->
					<div class="col-sm-12">
						<div class="blog_bg margin_bottom30">
							<div class="row d_flex">
								<div class="col-md-12">
									<div class="marriage_text"
										style="margin-left: 20px; padding-bottom: 0px;">
										<h3 style="padding-bottom: 0px">
											<a href="#"> <i class="fa fa-angle-double-down"
												aria-hidden="true" style="margin-right: 20px"></i></a> <strong>Home</strong>
										</h3>
										<hr>
									</div>
								</div>
								<!--                   <div class="blog_bg margin_bottom30"> -->
								<!--                      <div class="row d_flex"> -->
								<div class="col-md-6 text_align_center befold" data-state="0">
									<div class="blog_img ">
										<figure>
											<img src="${map.homeVo.coverPic}" id="coverPic">
											<span>메인 커버 사진</span>
										</figure>
									</div>
								</div>
								<div class="col-md-6 befold" data-state="0">
									<div class="marriage_text">
										<div class="form-group row">
											<div class="col-xs-3">
												<input type="text" class="form-control" id="brideNm"
													name="brideNm" placeholder="예비신부 이름"
													value="${map.homeVo.brideNm}">
											</div>
											<div class="col-xs-3">
												<input type="text" class="form-control" id="groomNm"
													name="groomNm" placeholder="예비신랑 이름"
													value="${map.homeVo.groomNm}">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-xs-4">
												<input type="text" class="form-control" id="wedDate"
													name="wedDate" placeholder="날짜 - 년.월.일 (요일)"
													value="${map.homeVo.wedDate }">
											</div>
											<div class="dropdown">
												<select class="btn btn-light dropdown-toggle"
													id="dropdownMenuButton" name="wedTime"
													data-toggle="dropdown">
													<option selected>예식 시간</option>
													<option>오전 11시</option>
													<option>오후 12시</option>
													<option>오후 1시</option>
													<option>오후 2시</option>
													<option>오후 3시</option>
													<option>오후 4시</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="wed_addr"
												name="wed_addr" placeholder="결혼식 장소"
												value="${map.homeVo.wed_addr }">
										</div>
										<div class="form-group">
											<textarea class="form-control " id="announce" name="announce"
												rows="4" cols="15" placeholder="To 친애하는 하객분들에게(최대500자)">${map.homeVo.announce }</textarea>
										</div>
										<br> <br>
										<div class="form-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input"
													id="pick_coverpic" name="multiFile" accept="image/*">
												<label class="custom-file-label" for="customFile">사진
													검색</label>
											</div>
										</div>
										<br>
										<h4>
											<button type="submit" class="btn">
												<strong>저장</strong>
											</button>
											<strong class="padd_right right_float">미리보기</strong>
										</h4>
									</div>
								</div>

							</div>
							<!-- row-flex -->
						</div>
					</div>
					<!-- end of Home -->
					<div class="col-sm-12">
						<div class="marriage_text"
							style="margin-left: 20px; padding-bottom: 0px;">
							<h3 style="padding-bottom: 0px">
								<a href="#"> <i class="fa fa-angle-double-down"
									aria-hidden="true" style="margin-right: 20px"></i></a> <strong>Our
									Story</strong>
							</h3>
							<hr>
						</div>
						<div class="blog_bg">
							<div class="row d_flex">
								<div class="col-md-6 text_align_center befold">
									<div class="blog_img">
										<figure>
											<img src="${map.storyVo.story_one_pic }" id="storyPic1" />
											<span>커플 사진</span>
										</figure>
									</div>
								</div>
								<div class="col-md-6 befold">
									<div class="marriage_text">
										<div class="form-group">
											<input type="text" class="form-control" id="story_one_title"
												name="story_one_title" placeholder="제목"
												value="${map.storyVo.story_one_title }">
										</div>
										<div class="form-group">
											<textarea class="form-control " id="story_one_con"
												name="story_one_con" rows="5" cols="10"
												placeholder="우리가 언제 처음 만난것은....">${map.storyVo.story_one_con }</textarea>
										</div>
										<br> <br>
										<div class="form-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input"
													id="story_one_pic" name="multiFile" accept="image/*">
												<label class="custom-file-label" for="customFile">사진
													검색</label>
											</div>
										</div>
										<br>
										<h4>
											<button type="submit" class="btn">
												<strong>저장</strong>
											</button>
											<!-- 										<strong class="padd_right right_float">미리보기</strong> -->
										</h4>
									</div>
								</div>
							</div>
							<!-- end row d_flex -->
						</div>
						<!-- end blog-bg (stroy1) -->
						<!--story2 -->
						<div class="blog_bg" style="margin-top: 30px">
							<div class="row d_flex">
								<div class="col-md-6 text_align_center befold">
									<div class="blog_img">
										<figure>
											<img src="${map.storyVo.story_two_pic }" id="stroyPic2" />
											<span>커플 사진</span>
										</figure>
									</div>
								</div>
								<div class="col-md-6 padd_right right_float befold">
									<div class="marriage_text">
										<div class="form-group">
											<input type="text" class="form-control" id="story_two_title"
												name="story_two_title" placeholder="제목2"
												value="${map.storyVo.story_two_title }">
										</div>
										<div class="form-group">
											<textarea class="form-control " id="story_two_con"
												name="story_two_con" rows="5" cols="10"
												placeholder="우리가 평생 서로의 반려자가 되어주기로 한 이유는 말이야...">${map.storyVo.story_two_con }</textarea>
										</div>
										<br> <br>
										<div class="form-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input"
													id="story_two_pic" name="multiFile" accept="image/*">
												<label class="custom-file-label" for="customFile">사진
													검색</label>
											</div>
										</div>
										<br>
										<h4>
											<button type="submit" class="btn">
												<strong>저장</strong>
											</button>
											<!-- <strong class="padd_right right_float">미리보기</strong> -->

										</h4>
									</div>
								</div>

							</div>
							<!-- end row d_flex -->
						</div>
						<!-- end of story2 -->
					</div>
					<!-- end of Our Story -->
					<!-- Q & A -->
					<div class="col-sm-12">
						<div class="marriage_text"
							style="margin-left: 20px; padding-bottom: 0px;">
							<h3 style="padding-bottom: 0px">
								<a href="#"> <i class="fa fa-angle-double-down"
									aria-hidden="true" style="margin-right: 20px"></i></a> <strong>Q&A</strong>
							</h3>
							<hr>
						</div>
						<div class="blog_bg">
							<div class="row d_flex">
								<div class="col-md-12 befold">
									<div class="marriage_text">
										<c:choose>
											<c:when test="${map.qnaVo == null }">
												<div id="originQnA" style="text-align: right">
													<a class="col-md-12 delQnA" href="#"> <i
														class="fa fa-trash-o" aria-hidden="true">삭제</i>
													</a>
													<div class="form-group">
														<div class="col-md-12">
															<input type="text" class="form-control" name="arr_ques"
																placeholder="질문(50자이내)" />
														</div>
													</div>
													<div class="form-group">
														<div class="col-md-12">
															<textarea class="form-control" name="arr_answers"
																rows="2" cols="30" placeholder="답변(200자이내)"></textarea>
														</div>
													</div>
												</div>
											</c:when>
											<c:when test="${map.qnaVo != null }">
												<c:forEach var="qnaVo" items="${map.qnaVo }">
													<div id="updateQnA" style="text-align: right">
														<a class="col-md-12 delQnA" href="#"> <i
															class="fa fa-trash-o" aria-hidden="true">삭제</i>
														</a>
														<div class="form-group" style="display: none">
															<div class="col-md-12">
																<input type="text" class="form-control" name="qno"
																	value="${qnaVo.qno }">
															</div>
														</div>
														<div class="form-group">
															<div class="col-md-12">
																<input type="text" class="form-control"
																	name="update_ques" placeholder="질문(50자이내)"
																	value="${qnaVo.ques }">
															</div>
														</div>
														<div class="form-group">
															<div class="col-md-12">
																<textarea class="form-control" name="update_answers"
																	rows="2" cols="30" placeholder="답변(200자이내)">${qnaVo.answer}</textarea>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:when>
										</c:choose>
										<div id="attachQnA"></div>
										<div>
											<a class="col-md-12" id="addQnA" href="#"><i
												class="fa fa-plus-square-o" aria-hidden="true">질문 + 답변
													추가</i></a>
										</div>
										<br>
										<h4>
											<button type="submit" class="btn">
												<strong>저장</strong>
											</button>
											<!-- 										<strong class="padd_right right_float">미리보기</strong> -->
										</h4>
									</div>
								</div>
							</div>
						</div>
						<!-- row-flex -->
					</div>
				</div>
				<!-- end of Q & A -->
				<!-- message -->
				<div class="col-sm-12">
					<div class="marriage_text"
						style="margin-left: 20px; padding-bottom: 0px;">
						<h3 style="padding-bottom: 0px">
							<a href="#"> <i class="fa fa-angle-double-down"
								aria-hidden="true" style="margin-right: 20px"></i></a> <strong>Message</strong>
						</h3>
						<hr>
					</div>
					<div class="blog_bg margin_bottom30">
						<div class="row d_flex">
							<div class="col-md-6 text_align_center befold">
								<div class="blog_img">
									<figure>
										<img src="${map.photoVo.mespic }" id="mesPic" />
										<span>커플 사진</span>
									</figure>

								</div>
							</div>
							<div class="col-md-6 befold ">
								<div class="marriage_text">
									<div class="form-group">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="pick_mes"
												name="multiFile" accept="image/*"> <label
												class="custom-file-label" for="customFile">사진 검색</label>
										</div>
									</div>
									<br> <br> <br>
									<h4>
										<button type="submit" class="btn">
											<strong>저장</strong>
										</button>
										<strong class="padd_right right_float">미리보기</strong>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end of message -->
				<!-- Travel -->
				<div class="col-sm-12">
					<div class="marriage_text"
						style="margin-left: 20px; padding-bottom: 0px;">
						<h3 style="padding-bottom: 0px">
							<a href="#"> <i class="fa fa-angle-double-down"
								aria-hidden="true" style="margin-right: 20px"></i></a> <strong>Travel</strong>
						</h3>
						<hr>
					</div>
					<div class="blog_bg margin_bottom30">
						<div class="row d_flex">
							<div class="col-md-6 text_align_center befold">
								<div class="blog_img">
									<figure>
										<img src="${map.travelVo.mapPic}" id="mapPic" />
										<span>오시는길 안내 사진</span>
									</figure>

								</div>
							</div>
							<div class="col-md-6 befold">
								<div class="marriage_text">
									<div class="form-group">
										<input type="text" class="form-control" id="wedPlace"
											name="wedPlace" placeholder="결혼식 장소 이름"
											value="${map.travelVo.wedPlace }">
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="wed_addr"
											name="tvl_addr" placeholder="결혼식 장소 주소"
											value="${map.travelVo.tvl_addr }">
									</div>
									<div class="form-group">
										<textarea class="form-control " id="tvlDetail"
											name="tvlDetail" rows="4" cols="15"
											placeholder="세부정보 안내(예를 들면, 교통정보, 주차정보, 음식정보)">${map.travelVo.tvlDetail }</textarea>
									</div>
									<br> <br>
									<div class="form-group">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="pick_map"
												name="multiFile" accept="image/*"> <label
												class="custom-file-label" for="customFile">사진 검색</label>
										</div>
									</div>
									<br>
									<h4>
										<button type="submit" class="btn">
											<strong>저장</strong>
										</button>
										<strong class="padd_right right_float">미리보기</strong>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end of Travel -->
				<!-- footer -->
				<div class="col-sm-12">
					<div class="marriage_text"
						style="margin-left: 20px; padding-bottom: 0px;">
						<h3 style="padding-bottom: 0px">
							<a href="#"> <i class="fa fa-angle-double-down"
								aria-hidden="true" style="margin-right: 20px"></i></a> <strong>Footer</strong>
						</h3>
						<hr>
					</div>
					<div class="blog_bg margin_bottom30">
						<div class="row d_flex">
							<div class="col-md-6 text_align_center befold">
								<div class="blog_img">
									<figure>
										<img src="${map.photoVo.footerpic}" id="footerPic" />
										<span>footer 사진</span>
									</figure>

								</div>
							</div>
							<div class="col-md-6 befold">
								<div class="marriage_text">
									<div class="form-group">
										<input type="text" class="form-control" id="footer"
											name="footer" placeholder="예시 - 잘 살겠습니다"
											value="${map.photoVo.footer }">
									</div>
									<div class="form-group">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="pick_footer"
												name="multiFile" accept="image/*"> <label
												class="custom-file-label" for="customFile">사진 검색</label>
										</div>
									</div>
									<br>
									<h4>
										<button type="submit" class="btn">
											<strong>저장</strong>
										</button>
										<strong class="padd_right right_float">미리보기</strong>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end of footer -->
			</form>
		</div>
		<!-- end class="row -->
		<div style="text-align: center; padding-bottom:40px">
			<a type="button" class="btn btn-danger delTemp"
				href="/create/delete?clientId=lee">템플렛 삭제</a>
		</div>
		<!-- end class="container " -->
	</div>
	<!-- end blog -->
	<%@ include file="../include/m_footer.jsp"%>