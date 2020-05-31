<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="com.ecsimsw.askq.*" %>

<%
	String currentId = request.getParameter("current_id");
	String newPw = request.getParameter("new_pw");
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	
	int result = memberDAO.changePwById(currentId, newPw);
	
	if(result == -1){
%>
 <script>
 alert("error");
 history.back();
 </script>
 <%
   }else{
	session.invalidate();
 %>
 <script>
 alert("succeed");
 </script>
 <%
 response.sendRedirect("mainPage.jsp");}%>