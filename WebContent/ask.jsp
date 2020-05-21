<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.*" %> 
<%
	QuestionDAO questionDAO = QuestionDAO.getInstance();

	int no = 0;
	String questioner =   request.getParameter("questioner");
	String receiver = request.getParameter("searchedUser");
	String question = request.getParameter("questionContent");
	String answer = null;
	int status = 0;
	
	int r = questionDAO.insertQuestion(new QuestionDTO(no,questioner,receiver,question,answer,status));

	if(r == 0){
%>
<script>
 	alert("ask succeed");
 	history.go(-1);
</script>
<%
	}else{
%>
<script>
 	alert("ask succeed");
 	history.go(-1);
</script>
<%
}
%>
