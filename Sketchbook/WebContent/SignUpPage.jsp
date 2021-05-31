<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign in Page</title>
</head>
<body>

 <form action="signup" method="post">
  Inserisca qui la sua email
 <input type="text" name="email"/><br>
  Inserisca di nuovo la sua email
 <input type="text" name="email2"/><br>
  Inserisca qui il suo nome
  <input type="text" name="firstName"/><br>
  Inserisca qui il suo cognome
  <input type="text" name="lastName"/><br>
  Inserisca qui la sua password
  <input type="text" name="password"/><br>
  Inserisca di nuovo la sua password
  <input type="text" name="password2"/><br>
  
  <input type="submit" value="Sign up!"/> <br>
  
 </form>
</body>
</html>