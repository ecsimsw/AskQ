<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AnyQ</title>
</head>

<%
   String loginInfo = (String)session.getAttribute("loginInfo");
%>
<script type="text/javascript">alert(<%=loginInfo%>)</script>

<body>
	<link rel='styleSheet' href ="resource/styleSheet/mainForm.css">
	
	<button type="button" onClick="location.href = 'logout.jsp'">logout</button>
	
	<div class="main">
		<!-- Home Page -->
		<div class="home">
			<div class="container">
				<div class="row">
					<div class="eight columns offset-by-two">
						<h1 class="headline">AnyQ</h1>
					</div>
				</div>

				<div class="row">
					<div class="eight columns offset-by-two">
						<form action="" class="wiki-search-form">
							<input type="search" placeholder="Search Username.." class="wiki-search-input" id="wiki-search-input">
							<button type="button" onclick="location.href='loginPage.jsp'" class="button btn btn-wiki">Ask</button>							
							<button type="button" onclick="location.href='loginPage.jsp'" class="button btn btn-wiki">Answer</button>
							</form>
					</div>
				</div>

				<div class="row">
					<div class="eight columns offset-by-two">
						<footer class="attribution">
							<p>Designed and coded by <a href="https://ecsimsw.tistory.com">JinHwan Kim</a></p>
						</footer>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>