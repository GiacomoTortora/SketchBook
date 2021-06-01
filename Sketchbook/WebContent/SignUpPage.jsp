<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
<title>Registrati</title>
</head>
<body style="background-color: #FFCC7C">

 <h3 style="text-align: left"><a href="product">Indietro</a></h3>

 <form action="signup" method="post">
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
</body>
</html> 
