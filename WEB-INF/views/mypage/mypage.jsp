<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="username" />
</sec:authorize>
<!Doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Dashboard Template · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">

    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

    
    <!-- Custom styles for this template -->
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/dashboard.css" rel="stylesheet">
    <script type="text/javascript" src="/js/common/jquery.js"></script>
	<script>
		function goModify(){
			location.href = "/mypage/mypage_modify_page";
		}
	</script>
  </head>
  <body>

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

<div class="container-fluid">
  <div class="row">
     <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="/">
              <span data-feather="home"></span>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
				  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
			  </svg>&nbsp;
              	HOME	
            </a>
          </li>
			<sec:authorize access="isAuthenticated()"> 
			  <li class="nav-item">
	            <a class="nav-link active" href="/mypage/mypage?Id=${username}">
	              <span data-feather="file"></span>
	              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-data" viewBox="0 0 16 16">
					  <path d="M4 11a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1zm6-4a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7zM7 9a1 1 0 0 1 2 0v3a1 1 0 1 1-2 0V9z"/>
					  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
					  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
				  </svg>&nbsp;
	              MY PAGE
	            </a> 
	          </li>
	          </sec:authorize>
			  <sec:authorize access="isAnonymous()">
			  </sec:authorize>
          <li class="nav-item">
           <a class="nav-link " aria-current="page" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#contents-collapse" aria-controls="contents-collapse"href="#">
              <span data-feather="home" ></span>
              	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-joystick" viewBox="0 0 16 16">
				  <path d="M10 2a2 2 0 0 1-1.5 1.937v5.087c.863.083 1.5.377 1.5.726 0 .414-.895.75-2 .75s-2-.336-2-.75c0-.35.637-.643 1.5-.726V3.937A2 2 0 1 1 10 2z"/>
				  <path d="M0 9.665v1.717a1 1 0 0 0 .553.894l6.553 3.277a2 2 0 0 0 1.788 0l6.553-3.277a1 1 0 0 0 .553-.894V9.665c0-.1-.06-.19-.152-.23L9.5 6.715v.993l5.227 2.178a.125.125 0 0 1 .001.23l-5.94 2.546a2 2 0 0 1-1.576 0l-5.94-2.546a.125.125 0 0 1 .001-.23L6.5 7.708l-.013-.988L.152 9.435a.25.25 0 0 0-.152.23z"/>
				</svg>&nbsp;	
              	GAME	
            </a>
            <aside class="bd-aside text-muted">
            <ul class="list-unstyled ps-3 collapse" id="contents-collapse">
	          <li><a class="d-inline-flex align-items-center rounded" href="/game/clickgame">눌러밤마</a></li>
	          <li><a class="d-inline-flex align-items-center rounded" href="/game/piheabamma">피해밤마2</a></li>
        	</ul>
        	</aside>
          </li>
         
          <li class="nav-item">
            <a class="nav-link" href="/board/boardList">
              <span data-feather="users"></span>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard" viewBox="0 0 16 16">
				  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
				  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
			  </svg>&nbsp;
             	게시판
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/introduce/introduce">
              <span data-feather="users"></span>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard" viewBox="0 0 16 16">
				  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
				  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
			  </svg>&nbsp;
             	소개
            </a>
          </li>
        </ul>
      </div>
    </nav>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-3">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">마이페이지</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
      
        </div>
      </div>
      
    <div class="container">
    	<div class="row">
    		 <div class="col-md-6">
			    <div class="card p-3">
    			<canvas id="mychartClickGame"></canvas>
    			</div>
			  </div>
    		<div class="col-md-6">
    			<div class="card p-3">
    			<canvas id="mychartPiheabamma"></canvas>
    			</div>
    		</div>
    	</div>
    </div>
    
    <script src="/js/mypage.js">
   
    </script>
    <br>
    <br>
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">회원정보</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
      
        </div>
      </div>
	<form>
	  <div class="mb-3">
	    <label for="exampleInputEmail1" class="form-label">아이디</label>
	    <input type="hidden" id="session" name="session" data-value="${username}" disabled/><!-- 세션을 자바스크립트에 넘겨주기 위함 -->
	    <input type="hidden"  name="csrfToken"   value="${_csrf.token}"/>
	    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${user.id}" disabled>
	  </div>
	  <div class="mb-3">
	    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
	    <input type="password" class="form-control" id="exampleInputPassword1" value="${user.password}" disabled>
	  </div>
	   <input type="button" id="modify_btn" class="btn btn-primary" onclick="javascript:goModify();" value="회원정보변경"/>
	</form>
	<br>
	<form id="ajaxForm">
	
	</form>

      <jsp:include page="../module/footer.jsp" flush="false"/>
    </main>
  </div>
</div>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
  </body>
</html>
