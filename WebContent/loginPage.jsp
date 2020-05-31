<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" 
	src="resource/js/jquery-3.5.1.js">
</script>

<head>
<meta charset="EUC-KR">
<title>AnyQ/login</title>
</head>

<link rel='styleSheet' href ="resource/styleSheet/loginForm.css">
<body>
    <div class="login-page">
	  	<div class="form">
	  	   <form method="post" action="loginAction.jsp" onsubmit="return loginFormCheck()"
	  	      class="login-form">
		      <input type="text" id="login_id" name ="id" placeholder="username"/>
		      <input type="password" id="login_pw" name="pw" placeholder="password"/>
		      <button type="submit">login</button>
		      <p class="message">Not registered? <a href="#"> Create an account</a></p>
		    </form>
		    
	    	<form method="post" action="signUp.jsp" onsubmit="return registerFormCheck()"
	    	  class="register-form">
		      <input type="text" id="register_id" name="id" placeholder="username"/>
		      <input type="password" id="register_pw" name="pw" placeholder="password"/>
		      <input type="password" id="register_pwc" placeholder="confirm-password"/>
		      <button type="submit">create</button>
		      <p class="message">Already registered? <a href="#">Sign In</a></p>
		    </form>
		  </div>
	</div>
	
   <script type ="text/javascript">
		$('.message a').click(function(){
		   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
		});
		
		function loginFormCheck(){
			var id = document.querySelector('#login_id');
			var pw = document.querySelector('#login_pw');
			
			if((id.value =='')){
				alert('아이디 입력'); 
				id.focus();
				return false;	
			}
			else if(pw.value ==''){
				alert('비밀번호 입력'); 
				pw.focus();
				return false;
			}
		}
		
		function registerFormCheck(){
			var id = document.querySelector('#register_id');
			var pw = document.querySelector('#register_pw');
			var pwc = document.querySelector('#register_pwc');

			if((id.value =='') || (id.value.length<4)){
				alert('아이디는 4자리 이상'); 
				id.focus();
				return false;
				}
			else if(pw.value =='' || pw.value.length<5){
				alert('비밀번호는 5자리 이상'); 
				pw.focus();
				return false;
				}
			else if(pw.value != pwc.value || pwc.value ==''){
				alert('확인 비밀번호 불일치'); 
				pwc.focus();
				return false;
				}
		}
   </script>
</body>
</html>