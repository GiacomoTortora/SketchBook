<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="./immagini/favicon.png"/>

<title>Login Page</title>
</head>
<body style="background-color: #FFFFFF">
<%@ include file="./fragments/header.jsp" %>

	<h2 align="center" style="color: #0e8ce4">Login</h2><br>

   <form action="login" method="post" style="width: -50%; margin-left:40%; margin-right:25%; margin-bottom:250px;">
   
   Enter your email here
   <input type="text" name="email" placeholder="example@mail.com" required/><br>		
		
   Enter your password
	<input type="password" name="password" placeholder="******" required/>
	
	<br><br>		
	<input type="submit" value="Login">
	<br>
</form>

<%@ include file="./fragments/footer.jsp" %>
</body>
</html>