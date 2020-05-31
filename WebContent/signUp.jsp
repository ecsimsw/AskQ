<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>

<%
  MemberDAO memberDAO = MemberDAO.getInstance(); 

  String inputId = (String)request.getParameter("id");
  String inputPw = (String)request.getParameter("pw");
  
  int result = memberDAO.loginCheck(inputId, inputPw);
  
  if(result != MemberDAO.USER_NONEXISTENT){ 
 %>
  <script>
  	alert("Id is already used");
  	history.go(-1);
  </script>
<%
  }else{
    memberDAO.insertMember(inputId, inputPw);
 %>  
  <script>
  	alert("Welcome!!");
  </script>  
<%
	session.setAttribute("loginInfo", inputId);
	response.sendRedirect("mainPage.jsp");
  }
%>
