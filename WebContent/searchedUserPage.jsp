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
	 
	 
	 <%-- start non-valid user --%>
	 
	 
	 <script>
	 	//alert("non existent user");
	 	//history.go(-1);
	 </script>
	 Non Existent User
	 
	 
	 <%-- start valid User --%>
	 
	 <%
	 }else{
	 	QuestionDAO questionDAO = QuestionDAO.getInstance();
	 %>
	 
	 <%-- profile form --%>
	 
	 <link rel='styleSheet' href ="resource/styleSheet/profileForm.css">
	 <div id="profileWrap">
	 	<div id = "searchedUser">
	 	   <%= searchedId %>
	 	</div>
	 </div>
	 
	 <%-- question form --%>
	 
	 <link rel='styleSheet' href ="resource/styleSheet/chatForm.css">
	  <div id="chatWrap">
           <div id="chatLog">
	 <% 	
	    ArrayList<QuestionDTO> searched = questionDAO.searchByReceiver(searchedId);
	 	Collections.sort(searched);
	 	
	 	for(QuestionDTO question : searched){
	 %>
        <div class="anotherMsg">
            <span class="anotherName"><i><%=question.getQuestioner() %></i></span><br>
            <span class="msg"><%= question.getQuestion() %></span>
        </div>
        <div class="myMsg">
            <span class="msg"><%=question.getAnswer() %></span>
        </div>     
	 <%
	 	 	}
	 %>
	 
	 <%-- ask form --%>
		 </div>
            <form id="chatForm" method = "post" action = 'ask.jsp'>
            	<input type ="text" name="questioner">
            	<button type="submit">send</button>
            	<br><br>
            	<textarea id="question" name="questionContent"> </textarea>
            </form>
       </div>
     <%
	  }
	 %>
	  <%-- end valid user --%>
	 
</body>
</html>