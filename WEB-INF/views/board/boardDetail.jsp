<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="username" />
</sec:authorize>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <%-- <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" /> --%>
    <title>Dashboard Template · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">

    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

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
    
    // 모달에 데이터값을 넘기기 위함
    $(document).on("click", "#modalModify", function (){ 
    	
    	var modifySeq = $(this).data('seq');
    	var modifyId = $(this).data('id');
    	$(".modalReplyModify #reply_seq").val( modifySeq );
    	$(".modalReplyModify #reply_id").val( modifyId );
    });

	
    var seq = '${board.board_seq}';
    
     $(document).ready(function(){
		getReplyList();
	});
     
     document.addEventListener('keydown', function(event) {
         if (event.keyCode === 13) {
             event.preventDefault();
         }
     }, true);
    
    function getReplyList(){
    	
    	/* var token =  $('input[name="csrfToken"]').attr('value')
		$.ajaxSetup({
			       beforeSend: function(xhr) {
			           xhr.setRequestHeader('X-CSRF-TOKEN', token);
			       }
			}); */
    	
  		$.ajax({	
		    url		:"/reply/reply_list",
		    data    : {'seq': seq},
	        dataType:"JSON",
	        cache   : false,
			async   : true,
			type	:"POST",	
	        success : function(obj) {
				getReplyListCallback(obj);				
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
  	 }
  	 
  	function getReplyListCallback(obj){
  		
  		
  			var state = obj.state;
  			
  			if(state == "SUCCESS"){
	
  				var data = obj.data;			
  				var list = data.replyList;
  				var listLen = list.length;
  				var id = $("#session").data('value');
				
			var str = "";
			
			if(listLen >  0){

				for(var a=0; a<listLen; a++){

					var replyNumber		= a+1;
					var replySeq		= list[a].reply_seq;
					var replyBoardSeq	= list[a].reply_boardSeq;
					var replyId 		= list[a].reply_id; 
					var replyText 		= list[a].reply_text; 
					var replyDate 		= list[a].reply_date;
					
					/* <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
			        <div class="d-flex justify-content-between">
			          <strong class="text-gray-dark">Full Name</strong>
			          <a href="#">Follow</a>
			        </div>
			        <span class="d-block">@username</span>
     			</div>
     			<div class="d-flex text-muted pt-3">
   				 </div> */
					str += '<br/>';
					str += '<table class="table table-borderless">';
					str += '<tr class="table-primary">';
					str += '<td>';
					str += '<strong class="text-gray-dark" style="font-size:20px">'+replyId+'</strong>';

					str += '<input type="hidden" id="reply_seq" name="reply_seq" value="'+replySeq+'"/>';
					str += '</td>';
					str += '<td style="text-align : right;">';
					str +=  '날짜: '+replyDate + '&nbsp;&nbsp;&nbsp;';
					if(id == replyId){
					str += '<button type="button" id="modalModify" data-seq="'+replySeq+'" data-id="'+replyId+'" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">수정</button>&nbsp;&nbsp;';
					str += '<button type="button" class="btn btn-danger btn-sm" onclick="javascript:reply_delete('+replySeq+')">삭제</button>';
					}else{
						
					};
					str += '</td>';
					str += '</tr>'
					str += '<tr class="table-info">';
					str += '<td colspan="2">';
					str += '<span class="d-block" style="font-size:15px">'+replyText +'</span>';
					str += '</td>';
					str += '</tr>';

					
					str += '</table>';
					str += '<div class="replyModify"></div>';


					
					str += '<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
					str += '<div class="modal-dialog">';
					str += '<div class="modal-content">';
					str += '<div class="modal-header">';
					str += '<h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>';
					str += '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>';
					str += '</div>';
					str += '<div class="modal-body">';
					str += '<form id="replyModify_form" name="replyModify_form">';
					str += '<div class="modalReplyModify mb-3">';
					str += '<label for="recipient-name" class="col-form-label">작성자</label>';
					str += '<input type="hidden" class="form-control" id="reply_seq" name="reply_seq" value="'+replySeq+'"/>';
					str += '<input type="hidden" class="form-control" id="reply_boardSeq" name="reply_boardSeq" value="'+ replyBoardSeq +'"/>';
					str += '<input type="text" class="form-control" id="reply_id" name="reply_id" value="' + replyId +'" disabled>';
					str += '</div>';
					str += '<div class="mb-3">';
					str += '<label for="message-text" class="col-form-label">내용</label>';
					str += '<textarea class="form-control" id="reply_text" name="reply_text"></textarea>'
					str += '</div>';
					str += '</form>';
					str += '</div>';
					str += '<div class="modal-footer">';
					str += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
					str += '<button type="button" class="btn btn-primary" onclick="javascript:reply_modify()">수정 완료</button>';
					str += '</div>';
					str += '</div>';
					str += '</div>';
					str += '</div>';
					
				} 
				
			} else {
				
			}
			
			$(".replyList").html(str);		
		}else{
			alert("관리자에게 문의하세요.");
			return;
		}
  	}
  	
  	function reply_insert(){
  		
  		var token =  $('input[name="csrfToken"]').attr('value')
		$.ajaxSetup({
			       beforeSend: function(xhr) {
			           xhr.setRequestHeader('X-CSRF-TOKEN', token);
			       }
			});
  		
  		var sessionValue = $("#session").data('value');
  		
  		if(sessionValue == "" || sessionValue == null){
  			var result = confirm("로그인 하시겠습니까?");
    		if(result){
				location.href="/login/login";
				return false;
    		}else{
    			return false;
    		}
  		}
  		
  		
  		if(reply_text.value == ""){
	    	  alert("댓글을 입력해주세요.");
	    	  reply_text.focus();
	    	  return false;
	      }
  		
  		 $.ajax({
  	        url : '/reply/reply_insert',
  	        type : 'post',
  	        data : $("#replyForm").serialize(),
  	        success : function(data){
  	            if(data == 1) {
  	            	alert("댓글이 등록되었습니다.");
  	            	getReplyList(); //댓글 작성 후 댓글 목록 바로추가
  	                $('[name=reply_text]').val('');
  	            }
  	        }
  	    });
  	}
  	
  	function reply_modify(){
  		$.ajax({
  	        url : '/reply/reply_modify',
  	        type : 'post',
  	        data : $("#replyModify_form").serialize(),
  	        success : function(data){
  	            if(data == 1) {
  	            	getReplyList(); //댓글 작성 후 댓글 목록 바로추가
  	                $('[name=reply_text]').val('');
  	            	alert("수정되었습니다.");
  	            	$('#exampleModal').modal('hide');
  	            }
  	        }
  	    });
  	}
  	
  	function reply_delete(seq){
		var result = confirm("정말로 삭제하시겠습니까?");
    	
    	if(result){
  		$.ajax({
  	        url : '/reply/reply_delete',
  	        type : 'post',
  	        data : {'seq' : seq},
  	        success : function(data){
  	            if(data == 1) {
  	            	getReplyList(); //댓글 작성 후 댓글 목록 reload
  	            	alert("삭제되었습니다.");
  	            }
  	        }
  	    });
    	}
  		else{
  	    	return;	
  	    }
    }
  	
  	
    
    function goBoardList(){
    	location.href="/board/boardList"
    }
    
    function goBoardModify(seq){
    	location.href="/board/boardModify?board_seq="+seq;
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
            <a class="nav-link " aria-current="page" href="/">
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
	            <a class="nav-link" href="/mypage/mypage?Id=${username}">
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
            <a class="nav-link active" href="/board/boardList">
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
		    <h1 class="h2">Board Detail</h1>
		       <div class="btn-toolbar mb-2 mb-md-0">
		      
		       </div>
		  </div>
		
		<form action="/board/boardModify" method="POST">
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">제목</label>
		    <input type="text" class="form-control" id="board_title" name="board_title" value="${board.board_title}" aria-describedby="emailHelp" disabled/>
		    <input type="hidden" id="board_seq" name="board_seq" value="${board.board_seq}"/>
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">작성자</label>
		    <input type="text" class="form-control" id="board_id" name="board_id" value="${board.board_id}" disabled/>
		     <%-- <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/> --%>
		  </div>
		    <br>
		    <br>
		   ${board.board_text}
		    <br>
		    <br>	
		  <input type="button" class="btn btn-primary" onclick="javascript:goBoardList();" value="목록"/>&nbsp;&nbsp;
		  <c:choose>
		   <c:when test="${username eq board.board_id}">
		  	<input type="submit" class="btn btn-primary"  value="수정"/>
		
		   </c:when>
		    <c:otherwise>
				       
		    </c:otherwise>
		  </c:choose>
		
		  </form>
		  <br/>
		  <div calss="container-md">
		  	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		        <h1 class="h2">Comment</h1>
		        
		     </div>
		  	<div class="row">
		  		<div class="col-11">
				  <form id="replyForm" name="replyForm">
				  	<input type="hidden" id="session" name="session" data-value="${username}" disabled/><!-- 세션을 자바스크립트에 넘겨주기 위함 -->
			     	<input type="hidden" id="reply_id" name="reply_id" value="${username}"/>
			     	<input type="hidden" id="reply_boardSeq" name="reply_boardSeq" value="${board.board_seq}"/>
					<input type="hidden"  name="csrfToken"   value="${_csrf.token}"/>
					<input type="text" class="form-control" id="reply_text" name="reply_text" placeholder="댓글을 입력하세요.">
				  </form>
				</div>
				<div class="col-1">
					<button class="btn btn-primary me-md-2" type="button" id="reply_btn" name="reply_btn" onclick = "javascript:reply_insert();">등록</button>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
			        <div class="replyList">
			        </div>
			        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

		   			</div>
		  		</div>
			</div>
		  </div>
	<jsp:include page="../module/footer.jsp" flush="false"/>
    </main>
  </div>
</div>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
  </body>
</html>



