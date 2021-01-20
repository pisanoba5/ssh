<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
 	 <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" style="background-color: #212529;" href="/"><img src="/img/titleImg.jpg" alt="" width="32" height="32"> &nbsp; Fantasy World</a>
	 <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation" style="top: 8px;right: 125px;">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	    <!-- <input class="form-control form-control-dark w-100" type="text" style="background-color: #212529;" disabled/> -->
			  <ul class="navbar-nav px-3">
				    <li class="nav-item text-nowrap">
				    	<sec:authorize access="isAuthenticated()"> 
						    <ul class="navbar-nav px-3">
							    <li class="nav-item text-nowrap">
							    <form:form action="/logout" method="POST"> 
							       <input type="submit" class="btn nav-link" value="로그아웃" /> 
							      </form:form>
							   </li>
						  	 </ul>
					  	 </sec:authorize>
					  	 <sec:authorize access="isAnonymous()"> 
					       <ul class="navbar-nav px-3">
						    <li class="nav-item text-nowrap">
						    <a class="btn nav-link" href="/login/login">로그인</a>
						    </li>
					  	  </ul>
						</sec:authorize> 
				    </li>
			  </ul>
</header>
  
<!-- <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="/"><img src="/img/titleImg.jpg" alt="" width="32" height="32"> &nbsp; Fantasy World</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100" type="hidden" placeholder="Search" aria-label="Search">
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="#">Sign out</a>
    </li>
  </ul>
</header> -->




