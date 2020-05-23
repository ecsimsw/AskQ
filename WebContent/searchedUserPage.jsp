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
	 
	 <link rel='styleSheet' href ="resource/styleSheet/searchUserForm.css">
	 <div class="login-page">
	  <div class="form">
	  
		 <form method ="get" action ="mainPage.jsp" class="main">
		  <button type=submit class ="Button">main</button>
		 </form>
 		 <form method ="get" action ="askNewPage.jsp" class="ask">
		  <input type ="hidden" name="searchedId" value=<%= searchedId %>>
		  <button type=submit class ="Button">Ask</button>
		 </form>
		
	 	   <h3><%= searchedId %></h3><br>
	       <%-- question form --%>
			 
		  <div id="chatWrap">
           <div id="chatLog">
			 <% 	
			    ArrayList<QuestionDTO> searched = questionDAO.searchPublicQ(searchedId);
			 	Collections.sort(searched);
			 	
			 	for(QuestionDTO question : searched){
			 %>
		        <div class="anotherMsg">
		            <span class="anotherName"><i>  <%=question.getQuestioner() %></i></span><br>
		            <span class="msg"><%= question.getQuestion() %></span>
		        </div>
		        <div class="myMsg">
		            <span class="msg"><%=question.getAnswer() %></span>
		        </div>     
			 <%
			 	 	}
			 %>
			 </div>
	     </div>
	    </div>
	 </div>
	     <%
		  }
		 %>
</body>
</html>