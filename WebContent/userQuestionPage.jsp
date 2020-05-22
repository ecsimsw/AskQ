<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"  %>
<%@ page import="com.ecsimsw.askq.*"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>askq / <%=session.getAttribute("loginInfo")%></title>
</head>
<body>

<link rel='styleSheet' href ="resource/styleSheet/userQuestionForm.css">
	
<h3>newQuestion</h3> 

    <% 
        String loginInfo = (String)session.getAttribute("loginInfo"); 
    	QuestionDAO questionDAO;
    	ArrayList<QuestionDTO> searched;
    %>
    <%
    	questionDAO = QuestionDAO.getInstance();
        searched = questionDAO.searchNewQ(loginInfo);
	 	Collections.sort(searched);
	 	
	 	for(QuestionDTO question : searched){
	 %>
	 <form method='post' action='update.jsp'>
        <div class="">
        	<input type="hidden" name="no" value="<%=question.getNo()%>"> 
            <span><i><%=question.getQuestioner() %></i></span>
            <span id="questionBox"><%= question.getQuestion() %></span><br>
        </div>
        <div class="">
        	<textarea id="answerBox" placeholder="Answer" name="answerContent"></textarea>
        	<button type="submit">answer</button>	
        </div>  
      </form>
      <br>   
	 <%
	 	 	}
	 %>

<h3>answered</h3> 

    <%
    	questionDAO = QuestionDAO.getInstance();
        searched = questionDAO.searchPublicQ(loginInfo);
	 	Collections.sort(searched);
	 	
	 	for(QuestionDTO question : searched){
	 %>
		 <form method='post' action='update.jsp'>
	        <div class="">
	        	<input type="hidden" name="no" value="<%=question.getNo()%>"> 
	            <span class=""><i><%=question.getQuestioner() %></i></span>
	            <span id="questionBox"><%= question.getQuestion() %></span><br>
	        </div>
	        <div class="">
	            <textarea id="answerBox" name="answerContent"><%=question.getAnswer() %></textarea>
	            <button type="submit">update</button>
	        </div>     
	      </form>
	      <br>
	 <%
	 	}
	 %>
</body>
</html>