<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
	<% String searchedId = request.getParameter("searchedId"); %>
	<link rel='styleSheet' href ="resource/styleSheet/askNewPage.css">
      
     <div class="container">  
	  <form id="contact" action="ask.jsp" method="post">
	    <h3>Ask to <%=searchedId %></h3>
	      <input type="hidden" id ="searchedUser" name="searchedUser" value=<%=searchedId%>>
	      <input placeholder="Type your name" type="text" 
	      name ="questioner" tabindex="1" required autofocus>
	    
	      <textarea placeholder="Type your question here...." tabindex="5"
	       name ="questionContent" required></textarea>
	    
	      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
	  </form>
	</div>

</body>
</html>