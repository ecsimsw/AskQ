<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>

<script>
	var con_test = confirm("Are you sure you want to delete it?");
	
	if(con_test == true){
	  location.href="deleteAction.jsp?no="+<%=request.getParameter("no")%>
	}
	else if(con_test == false){
	  history.back();
	}
</script>