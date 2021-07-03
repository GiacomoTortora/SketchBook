<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	Collection<?> utenti = new UserDAO().doRetrieveAll("");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.UserBean, model.dao.UserDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Modifica Ruolo Utente</title>
    
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/css/carousel-product.css" rel="stylesheet">
    <link href="assets/ionicons-2.0.1/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href='https://fonts.googleapis.com/css?family=Catamaran:400,100,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/custom-scroll/jquery.mCustomScrollbar.css" rel="stylesheet">
    <link href="assets/css/table.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/fragments/header.jsp" %>	
	
	<% if(admin==null) response.sendRedirect("401error.jsp"); %>
	
    <hr class="offset-lg">
    <hr class="offset-lg">
    
   <h1 style="margin-left: 5%"><i class="ion-person"></i> Modifica Ruolo Utente <i class="ion-person"></i></h1>
   <h4 class="h4" style="margin-left: 5%">Permette di cambiare il ruolo di un utente da standard ad amministratore)</h4>
    
	<div class="table">
		<div class="table-header">
			<div class="header__item" style="color: white">ID</div>
			<div class="header__item" style="color: white">Nome</div>
			<div class="header__item" style="color: white">Cognome</div>
			<div class="header__item" style="color: white">Email</div>
			<div class="header__item" style="color: white">Ruolo</div>
		</div>
		<div class="table-content">	
		
					<%
						Iterator<?> it = utenti.iterator();
						while (it.hasNext()) {
						UserBean bean = (UserBean) it.next();
					%>					

              <div class="table-row" style="font-size:120%">		
				<div class="table-data"><%=bean.getId()%></div>
				<div class="table-data"><%=bean.getFirstName() %></div>
				<div class="table-data"><%=bean.getLastName() %></div>
				<div class="table-data"><%=bean.getEmail()%></div>
				<%
					if(!(bean.isAdmin())) {
				%>
				<div class="table-data">
				<a href="RendiAmministratoreController?action=read&id=<%=bean.getId()%>"><button class="btn btn-primary btn-sm rounded">Rendi Amministratore</button></a>
				</div>
				<%
					}else {
				%>
				<div class="table-data"><h5 class="align-center">Amministratore</h5>
				</div>
				<%
					}
				%>
			</div>              

              <%
				 }
              %>
            </div>
            </div>

	<%@ include file="./fragments/footer.jsp" %> 
	<script type="text/javascript" src="assets/js/tableSort2.js"></script> 
</body>
</html>