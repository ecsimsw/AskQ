<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>

<%
  MemberDAO memberDAO = MemberDAO.getInstance(); 

  String inputId = (String)request.getParameter("id");
  String inputPw = (String)request.getParameter("pw");
  
  MemberDTO newRegisterMember = new MemberDTO(inputId, inputPw);
  int result = memberDAO.loginCheck(newRegisterMember);
  
  if(result != MemberDAO.USER_NONEXISTENT){ 
 %>
  <script language="javascript">
  	alert("Id is already used");
  	history.go(-1);
  </script>
<%
  }else{
    memberDAO.insertMember(newRegisterMember);
 %>  
  <script language="javascript">
  	alert("Welcome!!");
  </script>  
<%
  }
  
  session.setAttribute("loginInfo", newRegisterMember.getId());
  response.sendRedirect("mainPage.jsp");
%>
