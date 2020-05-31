<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="com.ecsimsw.askq.*" %>
<% request.setCharacterEncoding("euc-kr");%>

<%
	String id = request.getParameter("id");
	String introduce = request.getParameter("introduce");
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	
	int result = memberDAO.changeIntroduceById(id, introduce);
	
	if(result == -1){
%>
 <script>
 alert("error");
 history.back();
 </script>
 <%
   }else{
 %>
 <script>
 alert("succeed");
 history.back();
 </script>
 <%}%>