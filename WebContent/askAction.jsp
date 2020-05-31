<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>
<%@ page import="java.util.*" %> 
<%@ page import="java.text.SimpleDateFormat" %>

<% request.setCharacterEncoding("euc-kr");%>

<%
	QuestionDAO questionDAO = QuestionDAO.getInstance();
	MemberDAO memberDAO = MemberDAO.getInstance();
	
	int no = 0;
	String questioner = request.getParameter("questioner");
	int questioner_type = (request.getParameter("isAnonymous")=="true"? 0:1);
	
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	String question_date = date.format(new Date()); // get date yyyy-mm-dd
	
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

	memberDAO.changeAskedById(receiver, memberDAO.getAskedById(receiver)+1);
	
	if(r == 0){ // succeed
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
