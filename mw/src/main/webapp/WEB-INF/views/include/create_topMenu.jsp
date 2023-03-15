<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<nav id="navbar-header" class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand navbar-brand-center d-flex align-items-center p-0 only-mobile" href="/">
            <img src="/create_tempY/img/logo.png" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">           
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
            <ul class="navbar-nav d-flex justify-content-between">
                <li class="nav-item only-desktop"></li>
                <div class="d-flex flex-lg-row flex-column">
                    <li class="nav-item active">
                        <a class="nav-link" href="/create/invite?url=${loginInfo.url}">Home <span class="sr-only">(current)</span></a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="/create/story?url=${loginInfo.url}" >
                        Our Story
                        </a>                       
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="/create/qna?url=${loginInfo.url}">Q + A</a>
                    </li>
                  
                </div>
            </ul>
         
            <ul class="navbar-nav d-flex justify-content-between">
                <div class="d-flex flex-lg-row flex-column">                                                          
                    <li class="nav-item">
                        <a class="nav-link" href="/create/showmes?url=${loginInfo.url}">사랑의 대나무숲</a>
                    </li>

                    <li class="nav-item dropdown">
                    
                        <a class="nav-link" href="/create/insertmes?url=${loginInfo.url}">쪽지 보내기</a>
                    </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/create/travel?url=${loginInfo.url}">오시는 길</a>
                    </li> 
                </div>
                <li class="nav-item"></li>
            </ul>
        </div>
    </div>
</nav>