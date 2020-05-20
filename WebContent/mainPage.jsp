<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AnyQ</title>
</head>

<%
   String loginInfo = (String)session.getAttribute("loginInfo");
%>
<body>
	<link rel='styleSheet' href ="resource/styleSheet/mainForm.css">
	
<% if(loginInfo ==null){%>
    <button type="button" onClick="location.href = 'loginPage.jsp'">Login</button>
<%}else{ %>
	<button type="button" onClick="location.href = 'logout.jsp'">Logout</button>
<%} %>

	<div class="main">
		<!-- Home Page -->
		<div class="home">
			<div class="container">
				<div class="row">
					<div class="eight columns offset-by-two">
						<h1 class="headline">AnyQ</h1>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="eight columns offset-by-two">
						<form action="searchedUserPage.jsp" class="wiki-search-form" method="get">
							<input type="search" onKeydown="javascript:if(event.keyCode == 13) form.submit();" 
							placeholder="Search Username.." class="wiki-search-input" id="wiki-search-input" name="searchedUser">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>