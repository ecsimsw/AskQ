<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.ecsimsw.askq.*" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	QuestionDAO questionDAO = QuestionDAO.getInstance();
	QuestionDTO deletedQuestion = questionDAO.getQuestionByNo(no);
	
	MemberDAO memberDAO = MemberDAO.getInstance();

	int currentAsked = memberDAO.getAskedById(deletedQuestion.getReceiver());
	
	memberDAO.changeAskedById(deletedQuestion.getReceiver(), currentAsked-1);
	
	if(deletedQuestion.getAnswer()!=null)
	{
		int currentAnswered = memberDAO.getAnsweredById(deletedQuestion.getReceiver());
		memberDAO.changeAnswereddById(deletedQuestion.getReceiver(), currentAnswered-1);
	}
	
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