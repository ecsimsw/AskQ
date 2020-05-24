<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% int no = Integer.parseInt(request.getParameter("no"));
	   QuestionDAO questionDAO = QuestionDAO.getInstance();
	   QuestionDTO question = questionDAO.getQuestionByNo(no);
	
	%>
	<link rel='styleSheet' href ="resource/styleSheet/askNewPage.css">
      
     <div class="container">  
	  <form id="contact" action="updateAction.jsp" method="post">
	    <h3>From <%=question.getQuestioner() %></h3>
	      <input type=hidden name='no' value='<%=question.getNo()%>'>
	      <input type="text" 
	       tabindex="5"
	       name ="questionContent" 
	       readonly
	       value ='<%=question.getQuestion()%>'> 
	      <textarea 
	       placeholder="Type your Answer here...." 
	       tabindex="5"
	       name ="answerContent" 
	       required><%if(question.getAnswer()!=null){%><%=question.getAnswer()%>
	        <%}%></textarea>
	      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
	  </form>
	</div>
</body>
</html>
