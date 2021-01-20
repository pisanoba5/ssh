<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>로그인</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/4.5/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.5/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.5/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.5/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
		html,
		body {
		  height: 100%;
		}
		
		body {
		  display: -ms-flexbox;
		  display: flex;
		  -ms-flex-align: center;
		  align-items: center;
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: #f5f5f5;
		}
		
		.form-signin {
		  width: 100%;
		  max-width: 330px;
		  padding: 15px;
		  margin: auto;
		}
		.form-signin .checkbox {
		  font-weight: 400;
		}
		.form-signin .form-control {
		  position: relative;
		  box-sizing: border-box;
		  height: auto;
		  padding: 10px;
		  font-size: 16px;
		}
		.form-signin .form-control:focus {
		  z-index: 2;
		}
		.form-signin input[type="email"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}
		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
    </style>
    <script type="text/javascript" src="/js/common/jquery.js"></script>
	<script type="text/javascript" src="/js/common/jquery.form.js"></script>
	<script>
	function sign_up(){
			location.href = "/login/sign_up";
	}
	
  	function loginchk(){
  		$.ajax({
  			url : "/login/login_chk",
  			data : $("#login_form").serialize(),
  			dataType: "JSON",
  			cache   : false,
            async   : true,
  			type : "POST",
  			success : function(data){
  				
  				loginchkCallback(data);
  			},
  			error :function(xhr, status, error) {}
  			
  		});
  	}
  		
  	function loginchkCallback(data){
 
  		if(data == 0){
  			alert("없는 아이디이거나 비밀번호가 잘못되었습니다.");
  			return;
  		}else{
  			alert("로그인 되었습니다.");
  			location.href = "/";
  			
  		}
  		
  	}
  		
 
  </script>
  </head>

  <body class="text-center" style="background-image:url('/img/backGround.jpg');">
  <c:url value="/login" var="loginUrl"/>
  <form id="login_form" name="login_form" action="${loginUrl}" class="form-signin" method="POST">
  		<c:if test="${param.error != null}">
  			<p>아이디와 비밀번호가 잘못되었습니다.</p>
  		</c:if> 
  		<c:if test="${param.logout != null}"> 
  		<p>로그아웃 하였습니다.</p> 
  		</c:if>

	  <img class="mb-4" src="/img/titleImg.jpg" alt="" width="72" height="72">
	  <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
	  <label for="inputEmail" class="sr-only">ID</label>
	  <input type="text" id="id" name="id" class="form-control" placeholder="아이디"/>
	  <label for="inputPassword" class="sr-only">Password</label>
	  <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	  <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호"//>
	  <button type="submit"class="btn btn-lg btn-primary btn-block">로그인</button>
	  <input type="button" id="sign_up_btn" class="btn btn-lg btn-primary btn-block" onclick="javascript:sign_up();" value="회원가입"/>
	  <!-- <input type="button" id="login_btn" name="login_btn" class="btn btn-lg btn-primary btn-block" onclick="javascript:loginchk();" value="로그인"/>
	  <input type="button" id="sign_up_btn" class="btn btn-lg btn-primary btn-block" onclick="javascript:sign_up();" value="회원가입"/> -->
	  <p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
  </form>

</body>
</html>
