<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.*"  %>
<% request.setCharacterEncoding("euc-kr");%>

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
<% request.setCharacterEncoding("euc-kr");%>

	<%
	   String loginInfo = (String)session.getAttribute("loginInfo");
	%>
<body> 
		<% 
		String searchedId = (String)request.getParameter("searchedUser");
	
		MemberDAO memberDAO = MemberDAO.getInstance(); 

	 	if(memberDAO.loginCheck(searchedId," ") == MemberDAO.USER_NONEXISTENT){
	 	// check searched user is valid
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
			<div id="menu" style="opacity:0">
			  <div onclick="history.back();" class="close"></div>
			  
			  <div class="sidenav">
				<a href="mainPage.jsp">Home</a>
				<% if(loginInfo ==null){%>
					<a href="loginPage.jsp">Login</a>
				 <%}else{%> <% 
    int asked = memberDAO.getAskedById(loginInfo);
    int answered = memberDAO.getAnsweredById(loginInfo);
    
    if(asked>answered){%>
	<a href="userQuestionPage.jsp"><i id="newArrived">New!</i> Questions</a>
	<%}else{ %>
	<a href="userQuestionPage.jsp">Questions</a>
	<%} %>
					<a href="myPage.jsp">My Page</a>
					<a href="logout.jsp">Logout</a>
				<%}%>
				  <a href="aboutPage.jsp">About</a>
				  <a href="https://ecsimsw.tistory.com/">Contact</a>
				</div>
			</div>
		</div>
		<script  src="resource/js/sidebar.js"></script>
 	  <!-- Side Bar end-->
   		

   	  <!-- Searched start -->	
   	  
   		<div id= profile>
   		  <h3 id="searchedId"><%= searchedId %></h3>
   		  <div style="float:right;">
   		  <%=memberDAO.getAskedById(searchedId)%>/<%=memberDAO.getAnsweredById(searchedId)%>
   		  </div>
   		  <pre id="introduce"><%= memberDAO.getIntroduceById(searchedId) %> </pre>
   		  <img src="resource/img/conversation.png" id="askImg" onclick="location.href='askNewPage.jsp?searchedId=<%=searchedId%>'">
   	   </div>
   	      
   	      <div id=qna>
   	         <% 	
			    ArrayList<QuestionDTO> searched = questionDAO.searchPublicQ(searchedId);
			 	Collections.sort(searched);
			 	
			 	for(QuestionDTO question : searched){ 		
			 %>
			 
		  <form id="contact">
		       <div id=questioner>
		     
		      <%if(question.getQuestioner_type() == 0){ %>
		      	  <img src="resource/img/icon/anonymous.png" id="questionerImg" >
			      <h5 id="questionerId"><i><%=question.getQuestioner()%></i></h5>
			  <%}else if(question.getQuestioner_type() == 1){%>
			      <img src="resource/img/icon/default.png" id="questionerImg">
			      <h5 id="questionerId" style="color:black;" onclick="location.href='searchedUserPage.jsp?searchedUser=<%=question.getQuestioner()%>'">
			      <i><%=question.getQuestioner()%></i></h5>
			  <%}%>
			      <div id="date"><%=question.getQuestion_date()%></div>
		      </div>
		      <div class=talk>
			      <img src="resource/img/questiond.png" id="questionImg">
			      <pre class ="msg question"><%=question.getQuestion() %></pre>
			      
			      <img src="resource/img/answer.png" id="answerImg">
			      <pre class ="msg answer"><%=question.getAnswer() %></pre>
		      </div>
		  </form>
		  
		  <%} %>
   	  <!-- Searched end -->	 
		</div>
   	</div>
   	<%} %>
   	</div>
</body> 
</html>