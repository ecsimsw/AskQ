<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.*" %> 
<%@ page import="java.text.SimpleDateFormat" %>

<%
	QuestionDAO questionDAO = QuestionDAO.getInstance();

	int no = 0;
	String questioner = request.getParameter("questioner");
	int questioner_type = 0; // user or non-user
	
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	String question_date = date.format(new Date());
	// get date yyyy-mm-dd
	
	String receiver = request.getParameter("searchedUser");
	String question = request.getParameter("questionContent");
	
	int r = questionDAO.insertQuestion(
			new QuestionDTO(
					0,     // default no
					questioner,
					questioner_type,
					question_date,
					receiver,
					question,
					null,  // default answer
					0)     // default status
			);

	if(r == 0){
%>
<script>
 	alert("Ask succeed");
 	location.href = "searchedUserPage.jsp?searchedUser=" + "<%=receiver%>";
</script>
<%
	}else{
%>
<script>
 	alert("ask failed");
 	location.href = "askNewPage.jsp?searchedId=" + "<%=receiver%>";
</script>
<%
}
%>
