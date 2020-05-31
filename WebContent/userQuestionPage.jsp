<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.*"  %>
<% request.setCharacterEncoding("euc-kr");%>

<!DOCTYPE html> 
<html> 
<head> 
     <meta charset="utf-8"> 
     <title>Questions</title> 
</head> 
<link rel='styleSheet' href ="resource/styleSheet/userQuestionForm.css">
<link rel='styleSheet' href ="resource/styleSheet/sidebar.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body> 
   <div class="main-page">
		<div class = "sideBar">
			<div class="btn" style="margin-right:70px; background-size:50%"></div>
				<div onclick="history.back();" class="page_cover"></div>
				<div id="menu" style="opacity:0;">
				  <div onclick="history.back();" class="close"></div>
				  <div class="sidenav">
				  	  <a href="mainPage.jsp">Home</a>
					  <a href="myPage.jsp">My Page</a>
					  <a href="logoutAction.jsp">Logout</a>
					  <a href="aboutPage.jsp">About</a>
					  <a href="https://ecsimsw.tistory.com/">Contact</a>
				  </div>
			</div>
		</div>
		<script  src="resource/js/sidebar.js"></script>
	
	  <% 
	    String loginInfo = (String)session.getAttribute("loginInfo"); 
	  	QuestionDAO questionDAO;
	  	ArrayList<QuestionDTO> searched;
	  %>
	 <div class="questions">
	 <table>
	  <caption>New Questions</caption>
	  <thead>
	    <tr>
	      <th scope="col">No</th>
	      <th scope="col">Questioner</th>
	      <th scope="col">Question</th>
	      <th scope="col">Action</th>
	    </tr>
	  </thead>
	  <tbody>
	    <%
	    	questionDAO = QuestionDAO.getInstance();
	    
	        searched = questionDAO.searchPrivateQ(loginInfo);
		 	Collections.sort(searched);
		 	
		 	int index_newQuestions =1;
		 	for(QuestionDTO question : searched){
		 %>
	    <tr>
	      <td data-label="No"><%=index_newQuestions++%></td>
	      <td data-label="Questioner"><%=question.getQuestioner() %></td>
	      <td id="question" data-label="Question"><%= question.getQuestion() %></td>
	      <td data-label="Action">
		   <button class="actionButton"
		   onclick="location.href='updatePage.jsp?no=<%=question.getNo()%>'">Update</button> 	   
		   
		   <button class="actionButton"
		   onclick="location.href='deletePage.jsp?no=<%=question.getNo()%>'">Delete</button>
		  </td>
	    </tr>
		 <%
		 	}
		 %>
	  </tbody>
	  </table>
	  <br><br>
	   <table>
	  <caption>Answered</caption>
	  <thead>
	    <tr>
	      <th scope="col">No</th>
	      <th scope="col">Questioner</th>
	      <th scope="col">Question</th>
	      <th scope="col">Action</th>
	    </tr>
	  </thead>
	  <tbody>
	
	    <%
	    	questionDAO = QuestionDAO.getInstance();
	        searched = questionDAO.searchPublicQ(loginInfo);
		 	Collections.sort(searched);
		 	
		 	int index_answered =1;
		 	for(QuestionDTO question : searched){
		 %>
	    <tr>
	      <td data-label="No"><%=index_answered++%></td>
	      <td data-label="Questioner"><%=question.getQuestioner() %></td>
	      <td id="question" data-label="Question"><%= question.getQuestion() %></td>
	      <td data-label="Action">
		   <button class="actionButton"
		   onclick="location.href='updatePage.jsp?no=<%=question.getNo()%>'">Update</button> 	   
		   
		   <button class="actionButton"
		   onclick="location.href='deletePage.jsp?no=<%=question.getNo()%>'">Delete</button>
		  </td>
	    </tr>
		 <%
		 	}
		 %>
	  
		</table>
	</div> <!-- end questions -->
	</div>
</body> 
</html>