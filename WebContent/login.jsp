<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>

<%
  MemberDAO memberDAO = MemberDAO.getInstance(); 
  String inputId = (String)request.getParameter("id");
  String inputPw = (String)request.getParameter("pw");
  
  int result = memberDAO.loginCheck(inputId, inputPw);
  
  if(result ==MemberDAO.VALID_USER){
	  session.setAttribute("loginInfo", inputId);
	  response.sendRedirect("mainPage.jsp");
  }
  else if(result == MemberDAO.WRONG_PASSWORD){
%>
  <script language ="javascript">
  	alert("wrong password");
  	history.go(-1);
  </script>
<%
  }
  else if(result == MemberDAO.USER_NONEXISTENT){
%>
  <script language ="javascript">
  	alert("Non-existent user");
  	history.go(-1);
  </script>
<%
  }
%>