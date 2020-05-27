<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.*"  %>

<!DOCTYPE html> 
<html> 
<head> 
     <meta charset="utf-8"> 
     <title>AnyQ / searched</title> 
</head> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='styleSheet' href ="resource/styleSheet/sidebar.css">
<link rel='styleSheet' href ="resource/styleSheet/searchUserForm.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

	<%
	   String loginInfo = (String)session.getAttribute("loginInfo");
	%>
<body> 
		<% 
		String searchedId = (String)request.getParameter("searchedUser");
	
		MemberDAO memberDAO = MemberDAO.getInstance(); 

	 	if(memberDAO.loginCheck(new MemberDTO(searchedId, " ")) == MemberDAO.USER_NONEXISTENT){
	 %>
	 
	 
	 <%-- start non-valid user --%>
	
	 Non Existent User
	 
	 
	 <%-- start valid User --%>
	 
	 <%
	 }else{
		 QuestionDAO questionDAO = QuestionDAO.getInstance();
	 %>
   	<div class = 'card'>
   		<div class="container"> 
   		
   		
   		 <!-- Side Bar -->
	 
	 	<div class = "sideBar">
			<div class="btn"></div>
			<div onclick="history.back();" class="page_cover"></div>
			<div id="menu" style=background-color:#f3f4fe;>
			  <div onclick="history.back();" class="close"></div>
			  
			  <div class="sidenav">
				<a href="mainPage.jsp">Home</a>
				<% if(loginInfo ==null){%>
					<a href="loginPage.jsp">Login</a>
				 <%}else{%>
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
		  var sideBar = document.getElementById("menu");
		 
			$(".btn").click(function() {
			  //alert("open");

		      sideBar.style.backgroundColor = '#ffffff'; 
			  $("#menu,.page_cover,html").addClass("open");
			  window.location.hash = "#open";
			});

			window.onhashchange = function() {
		      //alert("close");
		     
			  if (location.hash != "#open") {
			    $("#menu,.page_cover,html").removeClass("open");

				  sideBar.style.backgroundColor = '#f3f4fe'; 

				  // 바깥색(#f3f4fe)과 동일하게 하다가, 사이드바가 열렸을때는 지정한 색(white)으로 바꿈
			  }
			};
		</script>
		
 	  <!-- Side Bar end-->
   		

   	  <!-- Searched start -->	
   	  
   	      <h3 id="searchedId"><%= searchedId %></h3>
   	      <button onclick="location.href='askNewPage.jsp?searchedId=<%=searchedId%>'">ask_temp</button>
   	  
   	         <% 	
			    ArrayList<QuestionDTO> searched = questionDAO.searchPublicQ(searchedId);
			 	Collections.sort(searched);
			 	
			 	for(QuestionDTO question : searched){ 		
			 %>
			 
		  <form id="contact">
		       <div id=questioner>
			      <h5><%=question.getQuestioner() %></h5>
			      
			      <div id="date" >
			      	2020-05-20
			      </div>
		      </div>
		      <img src="resource/img/questiond.png" id="questionImg">
		      <pre class ="msg question"><%=question.getQuestion() %></pre>
		      
		      <pre class ="msg answer"><%=question.getAnswer() %></pre>
		  </form>
		  
		  <%} %>
   	  <!-- Searched end -->	 
		</div>
   	</div>
   	<%} %>
</body> 
</html>