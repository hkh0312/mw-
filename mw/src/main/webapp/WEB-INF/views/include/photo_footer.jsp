<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<footer class="mastfoot pb-5 bg-white section-padding pb-0">
<section id="gtco-testimonial"
			class="overlay bg-fixed section-padding"
			style="background-image: url(/create/displayImg?pic=${map.photoVo.footerpic});">
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
</footer>	
    