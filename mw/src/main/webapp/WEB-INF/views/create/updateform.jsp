<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/m_header.jsp" %>
<%@ include file="../include/bootstrap4.jsp" %>	
<%@ include file="../include/create_head.jsp" %>	
<style>

.col-xs-3{
	margin-left:12px;
	margin-right:20px;
}

.col-xs-4{
	margin-left:12px;
	margin-right:20px;
}
.col_reverse{
	margin-left:12px;
}

.right_float{
	float: right;
}
</style>										
<script>
$(document).ready(function(){

	//이미지 미리보기
	$("#pick_coverPic").on("change", function(e){
		var file = $(this).val();
		var filename = file.split("\\").pop();		
		$(this).next().text(filename);
		var cover_addr = URL.createObjectURL(e.target.files[0]);
		$("#coverPic").attr("src", cover_addr);
	});
	$("#story_one_pic").on("change", function(e){
		var file = $(this).val();
		var filename = file.split("\\").pop();	
		$(this).next().text(filename);
		var storyone_addr = URL.createObjectURL(e.target.files[0]);
		$("#storyPic1").attr("src", storyone_addr);
	});
	$("#story_two_pic").on("change", function(e){
		var file = $(this).val();
		var filename = file.split("\\").pop();		
		$(this).next().text(filename);
		var storytwo_addr = URL.createObjectURL(e.target.files[0]);
		$("#stroyPic2").attr("src", storytwo_addr);
	});
	$("#pick_mes").on("change", function(e){
		var file = $(this).val();
		var filename = file.split("\\").pop();		
		$(this).next().text(filename);
		var mes_addr = URL.createObjectURL(e.target.files[0]);
		$("#mesPic").attr("src", mes_addr);
	});
	$("#pick_map").on("change", function(e){
		var file = $(this).val();
		var filename = file.split("\\").pop();		
		$(this).next().text(filename);
		var map_addr = URL.createObjectURL(e.target.files[0]);
		$("#mapPic").attr("src", map_addr);
	});
	$("#pick_footer").on("change", function(e){
		var file = $(this).val();
		var filename = file.split("\\").pop();		
		$(this).next().text(filename);
		var footer_addr = URL.createObjectURL(e.target.files[0]);
		$("#footerPic").attr("src", footer_addr);
	});

	//질문+답변 추가
	$("#addQnA").click(function(e){
		e.preventDefault();
		$(".delQnA").removeAttr("style");
		var clonedQnA = $("#originQnA").clone();
		clonedQnA.find("input").val("");
		clonedQnA.find("textarea").val("");
		$("#originQnA").find("a").attr("style", "display:none");
		$("#attachQnA").append(clonedQnA);
		clonedQnA.show(500);
			
 		//질문+답변 삭제
		$(".delQnA").click(function(e){
			e.preventDefault();
			console.log("del" + clonedQnA);
			clonedQnA.remove();
		});		
	});
	//시간 dropdown
	$(".dropdown-item").click(function(e){
		e.preventDefault();
		console.log("click");
		console.log(this);
		var timeText = this.val();
		console.log(timeText);
		$("#dropdownMenuButton").text(timeText);	
	});	
	//창 fold/unfold
	var isFolded = false;
	$(".fold").click(function(e){
		e.preventDefault();
		console.log(this);
		console.log(e);
		console.log($(this));
		if(isFolded == false){
			$(".befold").slideUp(500);
			isFolded = true;
		}else if(isFolded == true){
			$(".befold").slideDown(500);
			isFolded = false;
		}
		console.log(isFolded);	
	});
	
	
});//$(document).ready
</script>
 </head>
      <!-- blog -->
      <div class="blog">
         <div class="container ">
          <form role="form" action="/create/insertRun" method="post" enctype="multipart/form-data" onsubmit="window.open('/create/invite?url=${loginInfo.userid }', "", "")">	
            <div class="row">            
              <!-- Home -->
               <div class="col-sm-12">
                <div class="blog_bg margin_bottom30">
                     <div class="row d_flex">
                     <div class="col-md-12">
	              		 <div class="marriage_text" style="margin-left:20px; padding-bottom:0px;">
	               			<h3 style="padding-bottom:0px"><a href="#" class="fold">
	               			<i class="fa fa-angle-double-down" aria-hidden="true"
	               				style="margin-right:20px"></i></a>
	               			<strong>Home</strong>
	               		</h3>
	               		<hr>
	                 	</div> 
	                 </div> 
<!--                   <div class="blog_bg margin_bottom30"> -->
<!--                      <div class="row d_flex"> -->				
                        <div class="col-md-6 text_align_center befold" data-state="0">
                           <div class="blog_img ">
                              <figure><img src="/create/displayImg?pic=${map.homeVo.coverPic}" id="coverPic" >
                              		<span>메인 커버 사진</span>                         
                              </figure>                              
                           </div>
                        </div>
                        <div class="col-md-6 befold" data-state="0">	                         												
                           <div class="marriage_text">
                         
                             <div class="form-group row">
	                           		<div class="col-xs-3">
								 	 	<input type="text" class="form-control" id="brideNm" name="brideNm" 
								 	 			placeholder="예비신부 이름" value="${map.homeVo.brideNm}">
								 	</div>
								 	<div class="col-xs-3">
								 	 	<input type="text" class="form-control" id="groomNm" name="groomNm" 
								 	 			placeholder="예비신랑 이름" value="${map.homeVo.groomNm}">
								 	</div>
							 </div>							 
							 <div class="form-group row">							   
							      <div class="col-xs-4">
							   			<input type="text" class="form-control" id="wedDate" name="wedDate" 
							   				placeholder="날짜 - 년.월.일 (요일)" value="${map.homeVo.wedDate }">
							   		</div>				
									<div class="dropdown">
										<select class="btn btn-light dropdown-toggle" id="dropdownMenuButton" name="wedTime" data-toggle="dropdown" value="${map.homeVo.wedTime }">
											 <option>예식 시간</option> 
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
							   		<input type="text" class="form-control" id="wed_addr" name="wed_addr" 
							   				placeholder="결혼식 장소" value="${map.homeVo.wed_addr }">
								</div>
								<div class="form-group">
									<textarea class="form-control " id="announce" name="announce" 
											rows="4" cols="15" placeholder="To 친애하는 하객분들에게(최대500자)"
											>${map.homeVo.announce }</textarea>
								</div>
								<br><br>  
                              	<div class="form-group">
                              		 <div class="custom-file">
									    <input type="file" class="custom-file-input" id="pick_coverpic" name="multiFile" accept="image/*">
									    <label class="custom-file-label" for="customFile">사진 검색</label>
									  </div>
                              	</div>
                              	<br>
                           		<h4>
                           			<button type="submit" ><strong>저장</strong></button>                           		                        		
	                           		<a href="/create/search?clientId=lee"><strong class="padd_right right_float">미리보기</strong></a>
                           		</h4>                                                         	
                        	</div>                          
                  		</div>
        
                  </div>
                  <!-- row-flex -->
                  </div>
               </div>
               <!-- end of Home -->
               <div class="col-sm-12">
               		<div class="marriage_text" style="margin-left:20px; padding-bottom:0px;">
                   		<h3 style="padding-bottom:0px"><a href="#" class="fold">
                   			<i class="fa fa-angle-double-down" aria-hidden="true"
                   				style="margin-right:20px"></i></a>
                   			<strong>Our Story</strong>
                   		</h3>
                   		<hr>
                     </div>    
                  <div class="blog_bg">
                     <div class="row d_flex">
                        <div class="col-md-6 text_align_center befold">
                           <div class="blog_img">
                              <figure><img src="" id="storyPic1"/>
                              		<span>커플 사진</span>      
                              </figure>                         
                           </div>
                        </div>
                        <div class="col-md-6 befold">
                           <div class="marriage_text">                           		
							  <div class="form-group">
							   		<input type="text" class="form-control" id="story_one_title" name="story_one_title" placeholder="제목">
								</div>
								<div class="form-group">
									<textarea class="form-control " id="story_one_con" name="story_one_con" 
									rows="5" cols="10" placeholder="우리가 언제 처음 만난것은...."></textarea>
								</div>                                        
                      			<br><br>
							<div class="form-group"> 
                          		<div class="custom-file">
									<input type="file" class="custom-file-input" id="story_one_pic" name="multiFile" accept="image/*">
									<label class="custom-file-label" for="customFile">사진 검색</label>
								</div>
                          	</div>
								<br>                           
                       			<h4>
                   					
                           			 <strong class="padd_right right_float">미리보기</strong>
                   				</h4>                               
                        	</div>
                        </div>
                     </div>
                      <!-- end row d_flex -->
                  </div>
                  <!-- end blog-bg (stroy1) -->
                  <!--story2 -->
                  <div class="blog_bg" style="margin-top:30px">
                     <div class="row d_flex">
                     <div class="col-md-6 text_align_center befold">
                           <div class="blog_img">
                              <figure><img src="" id="stroyPic2"/>
                              		<span>커플 사진</span>      
                              </figure>                         
                           </div>
                        </div>              
                        <div class="col-md-6 padd_right right_float befold">
                           <div class="marriage_text">                           		
							  <div class="form-group">
							   		<input type="text" class="form-control" id="story_two_title" name="story_two_title" placeholder="제목2">
								</div>
								<div class="form-group">
									<textarea class="form-control " id="story_two_con" name="story_two_con" 
									rows="5" cols="10" placeholder="우리가 평생 서로의 반려자가 되어주기로 한 이유는 말이야..."></textarea>
								</div>  
								<br><br>
								<div class="form-group">
                              		<div class="custom-file">
									    <input type="file" class="custom-file-input" id="story_two_pic" name="multiFile" accept="image/*">
									    <label class="custom-file-label" for="customFile">사진 검색</label>
									  </div>
                              	</div>
								<br>
                           		<h4>
                           			<button type="submit" class="btn"><strong>저장</strong></button>
                           			 <strong class="padd_right right_float">미리보기</strong>
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
               		<div class="marriage_text" style="margin-left:20px; padding-bottom:0px;">
                   		<h3 style="padding-bottom:0px"><a href="#" class="fold">
                   			<i class="fa fa-angle-double-down" aria-hidden="true"
                   				style="margin-right:20px"></i></a>
                   			<strong>Q & A</strong>
                   		</h3>
                   		<hr>
                     </div>
                  <div class="blog_bg">
                     <div class="row d_flex">
                          <div class="col-md-12 befold">
                            <div class="marriage_text">                                          	                                                 
	                           	<div id="originQnA" style="text-align:right"> 
	                           		<a class="col-md-12 delQnA" href="#" style="display:none">
	                           			<i class="fa fa-trash-o" aria-hidden="true">삭제</i>
	                           		</a>	                         	                   		
									<div class="form-group" >							  		
									  <div class="col-md-12">
									   	<input type="text" class="form-control" name="arr_ques" placeholder="질문(50자이내)">
									  </div>
									 </div>
									<div class="form-group">
										<div class="col-md-12">
											<textarea class="form-control " name="arr_answers" rows="2" cols="30" placeholder="답변(200자이내)"></textarea>
										</div>
									</div>
								</div> 	
								<div id="attachQnA"></div>								   
								<div>	
									<a class="col-md-12" id="addQnA" href="#"><i class="fa fa-plus-square-o" aria-hidden="true">질문 + 답변 추가</i></a>
								</div>																											
								<br>                          
		                       		<h4>
			                       		<button type="submit" class="btn"><strong>저장</strong></button>
                           			 	<strong class="padd_right right_float">미리보기</strong>
			                        </h4> 
			                     </div>    
							</div>  							                                               								                          
                        </div>
                      <!-- row-flex -->
                  </div>
               </div>
            <!-- end of Q & A -->
            <!-- message --> 
             <div class="col-sm-12">
              	<div class="marriage_text" style="margin-left:20px; padding-bottom:0px;">
                   		<h3 style="padding-bottom:0px"><a href="#" class="fold">
                   			<i class="fa fa-angle-double-down" aria-hidden="true"
                   				style="margin-right:20px"></i></a>
                   			<strong>Message</strong>
                   		</h3>
                   		<hr>
                     </div>
                  <div class="blog_bg margin_bottom30">
                     <div class="row d_flex">
                        <div class="col-md-6 text_align_center befold">
                           <div class="blog_img">
                              <figure><img src="" id="mesPic"/>
                               		<span>커플 사진</span>
                              </figure>
                             
                           </div>
                        </div>
                        <div class="col-md-6 befold ">
                           <div class="marriage_text">                           		                        					 
                              	<div class="form-group">
                              			<div class="custom-file">
										    <input type="file" class="custom-file-input" id="pick_mes" name="multiFile" accept="image/*">
										    <label class="custom-file-label" for="customFile">사진 검색</label>
									   </div>
                              	</div>
                              	<br><br><br>								
                              <h4>
                              	<button type="submit" class="btn"><strong>저장</strong></button>
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
              	<div class="marriage_text" style="margin-left:20px; padding-bottom:0px;">
                   		<h3 style="padding-bottom:0px"><a href="#" class="fold">
                   			<i class="fa fa-angle-double-down" aria-hidden="true"
                   				style="margin-right:20px"></i></a>
                   			<strong>Travel</strong>
                   		</h3>
                   		<hr>
                     </div>
                  <div class="blog_bg margin_bottom30">
                     <div class="row d_flex">
                        <div class="col-md-6 text_align_center befold">
                           <div class="blog_img">
                              <figure><img src="" id="mapPic"/>
                               		<span>오시는길 안내 사진</span>
                              </figure>
                             
                           </div>
                        </div>
                        <div class="col-md-6 befold">
                           <div class="marriage_text">
                           		<div class="form-group">
							   		<input type="text" class="form-control" id="wedPlace" name="wedPlace" placeholder="결혼식 장소 이름">
								</div>
                             	<div class="form-group">
							   		<input type="text" class="form-control" id="wed_addr" name="tvl_addr" placeholder="결혼식 장소 주소">
								</div>
								<div class="form-group">
									<textarea class="form-control " id="tvlDetail" name="tvlDetail" 
									rows="4" cols="15" placeholder="세부정보 안내(예를 들면, 교통정보, 주차정보, 음식정보)"></textarea>
								</div>
								<br><br>  
                              	<div class="form-group">
                              			<div class="custom-file">
										    <input type="file" class="custom-file-input" id="pick_map" name="multiFile" accept="image/*">
										    <label class="custom-file-label" for="customFile">사진 검색</label>
									  </div>
                              	</div>
                              	<br>								
                              <h4>
                              	<button type="submit" class="btn"><strong>저장</strong></button>
                           		 <strong class="padd_right right_float">미리보기</strong>
                              </h4>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            <!-- end of Travel --><!-- footer --> 
             <div class="col-sm-12">
              	<div class="marriage_text" style="margin-left:20px; padding-bottom:0px;">
                   		<h3 style="padding-bottom:0px"><a href="#" class="fold">
                   			<i class="fa fa-angle-double-down" aria-hidden="true"
                   				style="margin-right:20px"></i></a>
                   			<strong>Footer</strong>
                   		</h3>
                   		<hr>
                     </div>
                  <div class="blog_bg margin_bottom30">
                     <div class="row d_flex">
                        <div class="col-md-6 text_align_center befold">
                           <div class="blog_img">
                              <figure><img src="" id="footerPic"/>
                               		<span>footer 사진</span>
                              </figure>
                             
                           </div>
                        </div>
                        <div class="col-md-6 befold">
                           <div class="marriage_text">
                           		<div class="form-group">
							   		<input type="text" class="form-control" id="footer" name="footer" placeholder="예시 - 잘 살겠습니다">
								</div>                             					 
                              	<div class="form-group">
                              			<div class="custom-file">
										    <input type="file" class="custom-file-input" id="pick_footer" name="multiFile" accept="image/*">
										    <label class="custom-file-label" for="customFile">사진 검색</label>
									  </div>
                              	</div>
                              	<br>								
                              <h4>
                              	<button type="submit" class="btn"><strong>저장</strong></button>
                           		 <strong class="padd_right right_float">미리보기</strong>
                              </h4>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            <!-- end of footer -->
            </div>
             <!-- end class="row -->    
          </form>          
    	</div>    	
          
       </div>   
         <!-- end class="container " -->
 
      <!-- end blog -->
      <!--  footer -->
<%@ include file="../include/m_footer.jsp"%>