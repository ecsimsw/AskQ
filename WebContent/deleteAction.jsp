<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	QuestionDAO questionDAO = QuestionDAO.getInstance();
	int result = questionDAO.deleteByNo(no);
	if(result==0){
 %>
 	alert("successfully deleted");
 <%
	 response.sendRedirect("userQuestionPage.jsp");
	}else{
 %>
	 alert("failed");
	 response.sendRedirect("userQuestionPage.jsp");
 <%
	 }
 %>