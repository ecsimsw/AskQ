<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<% request.setCharacterEncoding("euc-kr");%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>myPage</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="resource/styleSheet/myPageForm.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<% request.setCharacterEncoding("euc-kr");%>
<%
   String userId = (String)session.getAttribute("loginInfo");
   if(userId == null){
%>
  <script>
  	alert("Wrong User Info");
	history.go(-1);
  </script>
<%}%>

<%
 MemberDAO memberDAO = MemberDAO.getInstance(); 
%>
			

<link rel='styleSheet' href ="resource/styleSheet/sidebar.css">
<body>
	<div class="w3-content w3-container w3-margin-top">
	<div class="w3-container w3-card-4">
		<div class="w3-center w3-large w3-margin-top">
			<h3>My Page</h3>
		</div>
		<div class = "sideBar">
			<div class="btn"></div>
			<div onclick="history.back();" class="page_cover"></div>
			<div id="menu" style="opacity:0">
			  <div onclick="history.back();" class="close"></div>
			  
			  <div class="sidenav">
				<a href="mainPage.jsp">Home</a>
				 <% 
    int asked = memberDAO.getAskedById(userId);
    int answered = memberDAO.getAnsweredById(userId);
    
    if(asked>answered){%>
	<a id ="newArrived" href="userQuestionPage.jsp">Questions </a>
	<%}else{ %>
	<a id="noNewArrived" href="userQuestionPage.jsp">Questions</a>
	<%} %>
				<a href="myPage.jsp">My Page</a>
			   	<a href="logout.jsp">Logout</a>
		    	  <a href="aboutPage.jsp">About</a>
			      <a href="https://ecsimsw.tistory.com/">Contact</a>
				</div>
			</div>
		</div>
		<script  src="resource/js/sidebar.js"></script>
		
		<div>
		     <br>
			 <div class="menu"> <b>회원정보</b> </div>
			 <br>
			<form id="pwForm" action="changeUserInfo.jsp" method="post">	
				<p>
				<label>ID</label>
				<input class="w3-input" id="userId" type="text" name="id" value="<%=userId %>" readonly>
				<label style="{position:relative; top:5px;}">Introduce</label><br>
				<textarea tabindex="5" id="introduce" name ="introduce" required><%=memberDAO.getIntroduceById(userId) %></textarea>
				<button type="submit" id="changeInfoBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원 정보 변경</button>

					
			</form>
			 
			 <br><br>
		     <div class="menu"> <b>비밀번호 변경</b> </div>
		     <br>
			<form id="pwForm" action="changePassword.jsp" method="post" onsubmit="return memberFormCheck()">	
				<input type="hidden" name="current_id" value="<%=userId%>">
				<p>
					<label>Current Password</label>
					<input class="w3-input" id="current_pw" name="current_pw" type="password" required>
				</p>
				<p>
					<label>New Password</label> 
					<input class="w3-input" id="new_pw" name="new_pw" type="password" required>
				</p>
				<p>
					<label>Confirm Password</label>
					<input class="w3-input" type="password" id="new_pw2" type="password" required>
				</p>
				<p class="w3-center">
					<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
				</p>
			</form>
	<script>
	
		function memberFormCheck(){
			var current = document.querySelector('#current_pw');
			var pw = document.querySelector('#new_pw');
			var pwc = document.querySelector('#new_pw2');
			<% String password = memberDAO.getPwById(userId);%>
			if(current.value != "<%=password%>"){
				alert('현재 비밀번호를 다시 확인하세요.'); 
				current.focus();
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
		</div>
	</div>
</div>
</body>
</html>