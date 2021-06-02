<%@ page language="java" 
      contentType="text/html; charset=windows-1256"
      pageEncoding="windows-1256"
   %>

   <!DOCTYPE html>

   <html>

      <head>
         <meta http-equiv="Content-Type" 
            content="text/html; charset=windows-1256">
            <link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
            <link rel="shortcut icon" href="./immagini/favicon.png"/>
         <title>Invalid Login</title>
      </head>
	
      <body style="background-color: #FFFFFF">
      <%@ include file="./fragments/header.jsp" %>
         <p>
            Spiacente, sei un utente non registrato.<br> Per registrarti fai click <a href="SignUpPage.jsp">QUI</a><br>
            Per tornare alal home, clicca <a href="home">QUI</a>
         </p>
         <%@ include file="./fragments/footer.jsp" %>
      </body>
	
   </html>