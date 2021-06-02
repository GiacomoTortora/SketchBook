<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="model.UserBean"
   %>
 
   <!DOCTYPE html>

   <html>
      <head>
         <meta http-equiv="Content-Type" 
            content="text/html; charset=windows-1256">
            <link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
            <link rel="shortcut icon" href="./immagini/favicon.png"/>	
         <title>   User Logged Successfully   </title>
      </head>
	
      <body style="background-color: #FFFFFF">
      <%@ include file="./fragments/header.jsp" %>

         
            <% UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
            %>
			
            BENVENUTO, <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>.<br>
            
            Per tornare indietro, clicca <a href="home">QUI</a>
       

	  <%@ include file="./fragments/footer.jsp" %>
      </body>
	
   </html>
