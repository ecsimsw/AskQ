<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	session.removeAttribute("loginInfo");
	//session.removeValue("loginInfo");
	response.sendRedirect("mainPage.jsp");
%>
