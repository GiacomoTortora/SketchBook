<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="./immagini/favicon.png"/>
<title>Registrati</title>
</head>
<body style="background-color: #FFFFFF">
<%@ include file="./fragments/header.jsp" %>

 <h2 align="center" style="color: #0e8ce4">Registrati</h2><br>

 <form action="signup" method="post" style="width: -50%; margin-left:40%; margin-right:25%; margin-bottom:250px;">
  Inserisci qui la email
 <input type="text" name="email" required placeholder="example@mail.com"/><br>
  Inserisci di nuovo la email
 <input type="text" name="email2" required placeholder="example@mail.com"/><br><br>
  Inserisci il tuo nome
  <input type="text" name="firstName" required placeholder="Mario"/><br>
  Inserisci il tuo cognome
  <input type="text" name="lastName" required placeholder="Rossi"/><br><br>
  Inserisci la tua password
  <input type="text" name="password" required placeholder="******"><br>
  Inserisci di nuovo la password
  <input type="text" name="password2" required placeholder="******"/><br>

  <br><br>
  <input type="submit" value="Registrati"/> <br>

</form>
<%@ include file="./fragments/footer.jsp" %>
</body>
</html> 
