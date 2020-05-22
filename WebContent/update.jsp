<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<%
	QuestionDAO questionDAO = QuestionDAO.getInstance();
	
	int no = Integer.parseInt(request.getParameter("no"));
	String answer = request.getParameter("answerContent");
	int status = 1;
	
	int result = questionDAO.updateAnswer(no,answer,1);
	if(result ==0 ){
%>
<script>
	alert("update succeed");
	history.back();
</script>
<%
  }else{
%>
<script>
	alert("fail to UPDATE!!!");
	history.back();
</script>
<%
  }
%>