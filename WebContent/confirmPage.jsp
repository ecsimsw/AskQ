<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" 
	src="resource/js/jquery-3.5.1.js">
</script>
<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.*"  %>

<head>
<meta charset="EUC-KR">
<title>AnyQ/login</title>
</head>

<%String loginInfo = (String)session.getAttribute("loginInfo");%>
<link rel='styleSheet' href ="resource/styleSheet/loginForm.css">
<body>
	
    <div class="login-page">
	  	<div class="form">
	  	   <form method="post" action="confirmAction.jsp" onsubmit="return loginFormCheck()"
	  	      class="login-form">
<%if(loginInfo == null){ %>
		      <input type="text" id="login_id" 
		      required name ="id" placeholder="username"/>
<%}else{ %>
			  <input type="hidden" id="login_id" 
			  readonly name ="id" value='<%=loginInfo%>'/>
<%} %>
			  <input type="password" id="login_pw" required name="pw" placeholder="password"/>
		      <button type="submit">Confirm</button>
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
   </script>
</body>
</html>