<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="model.bean.UserBean"
    %>
    

   
<!DOCTYPE html>
<html>
<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Amministratore </title>
    <link rel="shortcut icon" href="assets/img/favicon.png"/>   
  </head>
  
<body>
<%@ include file="/fragments/header.jsp" %>	
  
<% if(admin==null) response.sendRedirect("401error.jsp"); %>

 <h1> Pagina protetta</h1>
 <br>
 
 <h2> Funzioni admin</h2>
 <ul>
  <li> <a href= ""> Gestione catalogo  </a> </li>
  <li> <a href="AllOrders.jsp"> Visualizzazione ordini </a> </li>
 </ul>
 
 <%@ include file="/fragments/footer.jsp" %>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/core.js"></script>
    <script type="text/javascript" src="assets/js/store.js"></script>
    <script type="text/javascript" src="assets/js/jquery.touchSwipe.min.js"></script>

    <script type="text/javascript" src="assets/js/custom-scroll/jquery.mCustomScrollbar.concat.min.js"></script>

    <script type="text/javascript" src="assets/js/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="assets/js/jquery.ui.touch-punch.js"></script>
 
</body>
</html>