<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">

<title>Login Page</title>
</head>
<body style="background-color: #FFCC7C">

   <h3 style="text-align: left"><a href="product">Indietro</a></h3>

   <form action="login" method="post">
   
   Enter your email here
   <input type="text" name="email" placeholder="example@mail.com" required/><br>		
		
   Enter your password
	<input type="password" name="password" placeholder="******" required/>
	
	<br><br>		
	<input type="submit" value="Login">
	<br>
	

</form>
</body>
</html>