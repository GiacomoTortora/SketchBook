<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	Collection<?> orders = new OrderDAO().doRetrieveAll("");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.OrderBean, model.Cart, model.bean.UserBean, model.dao.OrderDAO, model.dao.UserDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Ordini Complessivi</title>
    
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
	
    <hr class="offset-lg">
    <hr class="offset-lg">
    
   <h1 style="margin-left: 5%">Ordini Totali di tutti i Clienti</h1>
   <h4 class="h4" style="margin-left: 5%">(Cliccando sulle relative intestazioni in tabella, puoi ordinare per ID, Cliente, Data e Stato)</h4>
    
	<div class="table">
		<div class="table-header">
			<div class="header__item"><a id="ID" class="filter__link filter__link--number" href="#">ID</a></div>
			<div class="header__item"><a id="Cliente" class="filter__link" href="#">Cliente</a></div>
			<div class="header__item"><a id="Data" class="filter__link" href="#">Data</a></div>
			<div class="header__item"><a id="Stato" class="filter__link" href="#">Stato</a></div>
			<div class="header__item" style="color: white">Totale</div>
			<div class="header__item" style="color: white">Azioni</div>
		</div>
		<div class="table-content">	
		
					<%
							Iterator<?> it = orders.iterator();
							while (it.hasNext()) {
							OrderBean bean = (OrderBean) it.next();
							UserBean usBean=new UserDAO().doRetrieveByKey(bean.getIdCliente());
					%>
					
					<%
              			double price=0.0;
              			price = bean.getTotale();       	
              		%>

              <div class="table-row" style="font-size:120%">		
				<div class="table-data"><%=bean.getId()%></div>
				<div class="table-data"><%=usBean.getFirstName()%> <%=usBean.getLastName()%></div>
				<div class="table-data"><%=bean.getData()%></div>
				<div class="table-data"><%=bean.getStato()%></div>
				<div class="table-data">€<%= String.format("%.2f", price) %></div>
				<div class="table-data"><a href="OrderDetails?action=read&id=<%=bean.getId() %>"><button class="btn btn-primary btn-sm rounded">Visualizza Dettagli</button></a></div>
			</div>              

              <%
				 }
              %>
            </div>
            </div>

	<%@ include file="./fragments/footer.jsp" %>
	
	<script type="text/javascript" src="assets/js/tableSort.js"></script> 
</body>
</html>