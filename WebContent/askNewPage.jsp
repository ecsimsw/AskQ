<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ask</title>
</head>

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
	<% String searchedId = request.getParameter("searchedId");
	   String loginInfo = (String)session.getAttribute("loginInfo");
	%>
	<link rel='styleSheet' href ="resource/styleSheet/askNewPage.css">
      
     <div class="container">  
	  <form id="contact" action="ask.jsp" method="post">
	    <h3>Ask <%=searchedId %></h3>
	      <input type="hidden" id ="searchedUser" name="searchedUser" value=<%=searchedId%>>
	      
	      <%if(loginInfo == null){%>
	      <input type="hidden" name="isAnonymous" value="true">
		  <input type="text" name ="questioner" tabindex="1" value=anonymous required > 
	   	  <%}else if(loginInfo != null){%>
	   	   <input type="hidden" name="isAnonymous" value="false"> 
	   	   <input placeholder="Type your name" type="text" name ="questioner" tabindex="1" value=<%=loginInfo%> readonly> 
	   	  <%} %>
	   	  
	      <textarea placeholder="Type your question here...." tabindex="5"
	       name ="questionContent" required autofocus></textarea>
	    
	      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
	  </form>
	</div>
</body>
</html>