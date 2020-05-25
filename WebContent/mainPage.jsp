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
<link rel='styleSheet' href ="resource/styleSheet/mainForm.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='styleSheet' href ="resource/styleSheet/sidebar.css">

<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.LinkedList" %>
<body>

	 
	 <div class="main-page">
	 
	 <!-- Side Bar -->
	 
	 	<div class = "sideBar">
			<div class="btn"></div>
			<div onclick="history.back();" class="page_cover"></div>
			<div id="menu">
			  <div onclick="history.back();" class="close"></div>
			  <div class="sidenav">
<% if(loginInfo ==null){%>
	<a href="loginPage.jsp">Login</a>
 <%}else{ %>
	<a href="userQuestionPage.jsp">Questions</a>
	<a href="myPage.jsp">My Page</a>
	<a href="logout.jsp">Logout</a>
<%}%>
				  <a href="README.html">Info</a>
				  <a href="https://ecsimsw.tistory.com/">Contact</a>
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
		
		
		
 	<!-- Search Bar-->

	<div class="main">
		<!-- Home Page -->
		<div class="home">
			<div class="container">
				<div class="row">
					<div class="eight columns offset-by-two">
						<h1 class="headline">Any Q</h1>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="eight columns offset-by-two">
						<form action="searchedUserPage.jsp" class="wiki-search-form" method="get">
						
						  <input class="w3-input w3-border w3-padding" name="searchedUser" 
						  type="text" placeholder="Search for names.." id="myInput" onkeyup="recommend()">
						  <ul class="w3-ul w3-margin-top" id="myUL">
<% MemberDAO memberDAO = MemberDAO.getInstance();
   LinkedList<String> idList = memberDAO.getMemebersIdList();
								  
	for(String id : idList){
%>
						    <li id ="rcmdId" onclick="location.href='searchedUserPage.jsp?searchedUser=<%=id%>'"><%= id %></li>
<%}%>
						  </ul>
						</form>
						<script>
							function recommend() {
							  var input, filter, ul, li, a, i;
							  input = document.getElementById("myInput");
							  filter = input.value.toUpperCase();
							  ul = document.getElementById("myUL");
							  li = ul.getElementsByTagName("li");
							  if(filter==''){
								  for (i = 0; i < li.length; i++) {
									      li[i].style.display = "none";
							      }
							  }
							  else{
								  for (i = 0; i < li.length; i++) {
								    txtValue = li[i].textContent;
								    if (txtValue.toUpperCase().indexOf(filter) == 0) {
								      li[i].style.display = "block";
								     //display : none , block 
								     
								    } else {
								      li[i].style.display = "none";
								    }
								  }
							  }
							}
							</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
</body>
</html>