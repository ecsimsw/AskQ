<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<% request.setCharacterEncoding("euc-kr");%>
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
	<link rel='styleSheet' href ="resource/styleSheet/updateForm.css">
      
     <div class="container">  
	  <form id="contact" action="updateAction.jsp" method="post">
	    <h3 id="from">From</h3>
	    <h1><%=question.getQuestioner() %></h1>
	    
	    
	    <h3 id="title">Question</h3>
	      <input type=hidden name='no' value='<%=question.getNo()%>'>
	      <pre id ="questionContent"><%=question.getQuestion()%></pre>
	    
	    
	    <h3 id="title">Answer</h3>
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
