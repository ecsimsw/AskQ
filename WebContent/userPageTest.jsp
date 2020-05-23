<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.*"  %>

<!DOCTYPE html> 
<html> 
<head> 
     <meta charset="utf-8"> 
     <title>Popup Demo</title> 
</head> 

<body> 

<link rel='styleSheet' href ="resource/styleSheet/userPageTestForm.css">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

    <% 
        String loginInfo = (String)session.getAttribute("loginInfo"); 
    	QuestionDAO questionDAO;
    	ArrayList<QuestionDTO> searched;
    %>
  <div>
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
   		 searched = questionDAO.searchNewQ("ecsimsw");
    
        //searched = questionDAO.searchNewQ(loginInfo);
	 	Collections.sort(searched);
	 	
	 	int index_newQuestions =1;
	 	for(QuestionDTO question : searched){
	 %>
    <tr>
      <td data-label="No"><%=index_newQuestions++%></td>
      <td data-label="Questioner"><%=question.getQuestioner() %></td>
      <td data-label="Question"><%= question.getQuestion() %></td>
      <td data-label="Action">
	   <button
	   onclick="location.href='update.jsp?no=<%=question.getNo()%>'">Update</button> 	   
	   
	   <button
	   onclick="location.href='delete.jsp?no=<%=question.getNo()%>'">Delete</button>
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
      <td data-label="Question"><%= question.getQuestion() %></td>
      <td data-label="Action">
	   <button
	   onclick="location.href='update.jsp?no=<%=question.getNo()%>'">Update</button> 	   
	   
	   <button
	   onclick="location.href='delete.jsp?no=<%=question.getNo()%>'">Delete</button>
	  </td>
    </tr>
	 <%
	 	}
	 %>
  
</table>

</body> 
</html>