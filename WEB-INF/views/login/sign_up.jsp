<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>회원가입</title>

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
     <script type="text/javascript">
     
     //아이디 유효성 검사
     $(document).ready(function(){
	     $("#id").blur(function() {
	 		// id = "id_reg" / name = "userId"
	 		var user_id = $("#id").val();
	 		$.ajax({
	 			url : '/login/id_chk?Id='+ user_id,
	 			type : 'get',
	 			success : function(data) {
	 				console.log("1 = 중복o / 0 = 중복x : "+ data);							
	 				
	 				if (data == 1) {
	 						// 1 : 아이디가 중복되는 문구
	 						$("#id_check").text("사용중인 아이디입니다 :p");
	 						$("#id_check").css("color", "red");
	 						$("#login_btn").attr("disabled", "disabled");
	 					} else {
	 						
	 						if(user_id.length < 4 || user_id.length > 12 ){
	 							// 0 : 아이디 길이 / 문자열 검사
	 							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
	 							$('#id_check').css('color', 'red');
	 							$("#login_btn").attr("disabled", "disabled");
	 				
	 						} else if(user_id == ""){
	 							
	 							$('#id_check').text('아이디를 입력해주세요 :)');
	 							$('#id_check').css('color', 'red');
	 							$("#login_btn").attr("disabled", "disabled");				
	 							
	 						} else {
	 							
	 							$('#id_check').text("사용가능한 아이디입니다. :) :)");
	 							$('#id_check').css('color', 'blue');
	 							$("#login_btn").attr("disabled", false);
	 						}
	 						
	 					}
	 				}, error : function() {
	 						console.log("실패");
	 				}
	 			});
	 		});
	    
    	 });
    
		  function sign_up(){	
			  	   var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
			      // var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			       //이메일이 적합한지 검사할 정규식
			       
			      var password = document.getElementById("password");
			      var password_chk = document.getElementById("password_chk");
			      var name = document.getElementById("name");
 
			      if(!check(re,password,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")){
			    	  return false;
			      }
			      
			      if(password.value == ""){
			    	  alert("비밀번호를 입력해 주세요.");
			    	  password.focus();
			    	  return false;
			      }
			      
			      if(password.value != password_chk.value){
			    	  alert("비밀번호가 다릅니다. 다시 입력바랍니다.");
			    	  password_chk.value="";
			    	  password_chk.focus();
			    	  return false;
			      }
			      
			      if(name.value == ""){
			    	  alert("이름를 입력해 주세요.");
			    	  name.focus();
			    	  return false;
			      }
			      
			      /* if(!check(re,email,"보기의 형식으로 이메일을 입력해주세요.")){
			    	  return false;
			      } */

		  		$.ajax({
		  			url : "/login/sign_up_test_action",
		  			data :$("#sign_up_form").serialize(),
		  			dataType: "JSON",
		  			cache   : false,
		  			async   : true,
		   			type : "POST",
		   			success : function(data){
		   				signupcallback(data);
		  			},
		  			error : function(xhr, status, error){}
		  		});
		  		
		  	}
		  
		  function signupcallback(obj){
			  if(obj == 1){
				  alert("회원가입 완료되었습니다.");
				  location.href = "/";
			  }
		  }
		  
		  function check(re, what, message) {
		       if(re.test(what.value)) {
		           return true;
		       }
		       alert(message);
		       what.value = "";
		       what.focus();
		       //return false;
		   }
  </script>
  </head>
 
  <body class="text-center" style="background-image:url('/img/backGround.jpg');">
  <form id="sign_up_form" name="sign_up_form" class="form-signin">
  <img class="mb-4" src="/img/titleImg.jpg" alt="" width="72" height="72">
	  <h1 class="h3 mb-3 font-weight-normal">회원가입</h1>
	  <input type="text" id="id" name="id" class="form-control" placeholder="아이디" required/>
	  <div class="" id="id_check" name="id_check"></div>
	  <Br/>
	  <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호" required>
	  <div class="" id="password_check" name="password_check"></div>
	   <Br/>
	   <input type="password" id="password_chk" class="form-control" placeholder="비밀번호 확인" required>
	  <div class="" id="password_check" name="password_check"></div>
	   <Br/>
	  <input type="text" id="name" name="name" class="form-control" placeholder="이름" required>
	  <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
	   <Br/>
	   <Br/>
	   <input type="button" id="login_btn" name="login_btn" class="btn btn-lg btn-primary btn-block" onclick="javascript:sign_up();" value="회원가입"/>
</form>
</body>
</html>
