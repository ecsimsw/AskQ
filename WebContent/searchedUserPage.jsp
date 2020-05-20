<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AnyQ _ searched</title>
</head>
<body>
	<% 
		String searchedId = (String)request.getParameter("searchedUser");
		MemberDAO memberDAO = MemberDAO.getInstance(); 

	 	if(memberDAO.loginCheck(new MemberDTO(searchedId, " ")) == MemberDAO.USER_NONEXISTENT){
	 %>
	 <script>
	 	alert("non existent user");
	 	history.go(-1);
	 </script>
	 <%
	 	}else{
		 	QuestionDAO questionDAO = QuestionDAO.getInstance();
		    ArrayList<QuestionDTO> searched = questionDAO.searchByReceiver(searchedId);
		 	for(QuestionDTO question : searched){
	 %>
	 	<%=question.getQuestioner() + " : " +question.getQuestion() + " : "+question.getAnswer() %><br>
	 <%
	 	 	}
	 	}
	 %>
</body>
</html>