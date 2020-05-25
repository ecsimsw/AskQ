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
	
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	 
	 <div class="main-page">
	 	<div class = "sideBar">
			<div class="btn"></div>
			<div onclick="history.back();" class="page_cover"></div>
			<div id="menu">
			  <div onclick="history.back();" class="close"></div>
			  <div class="sidenav">
				  <a href="#">Login</a>
				  <a href="./README.html">Info</a>
				  <a href="#">Contact</a>
				  <a href="README.html">Info</a>
				  <a href="#">Contact</a>
				</div>
			</div>
		</div>
		<script>
			$(".btn").click(function() {
			  $("#menu,.page_cover,html").addClass("open");
			  window.location.hash = "#open";
			});

			window.onhashchange = function() {
			  if (location.hash != "#open") {
			    $("#menu,.page_cover,html").removeClass("open");
			  }
			};
		</script>
		
<% if(loginInfo ==null){%>
    <button class="Button" type="button" onClick="location.href = 'loginPage.jsp'">Login</button>
<%}else{ %>
	<button class="Button" type="button" onClick="location.href = 'userQuestionPage.jsp'">myQ</button>
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
	</div>>
</body>
</html>