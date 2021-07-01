<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	Collection<?> products = new ProductDAO().doRetrieveAll("");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.ProductBean, model.Cart, model.dao.ProductDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Visualizzazione e Modifica Catalogo</title>
    
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
    
   <h1 style="margin-left: 5%"><i class="ion-ios-list"></i> Modifica Catalogo <i class="ion-ios-list"></i></h1>
   <h4 class="h4" style="margin-left: 5%">(Cliccando sulle relative intestazioni in tabella, puoi ordinare per ID, Nome e IVA)</h4>
    
	<div class="table">
		<div class="table-header">
			<div class="header__item"><a id="id" class="filter__link filter__link--number" href="">ID</a></div>
			<div class="header__item"><a id="nome" class="filter__link" href="">Nome</a></div>
			<div class="header__item" style="color: white">Prezzo</div>
			<div class="header__item"><a id="iva" class="filter__link filter__link--number" href="">IVA</a></div>
			<div class="header__item" style="color: white">PrezzoTOT</div>
			<div class="header__item" style="color: white">Azioni</div>
		</div>
		<div class="table-content">	
		
					<%
						Iterator<?> it = products.iterator();
						while (it.hasNext()) {
						ProductBean bean = (ProductBean) it.next();
					%>
					
					<%
						double price=0.0;
              			double priceTOT=0.0;
              			price = bean.getPrezzo();
              			priceTOT = bean.getPrezzoTot();       	
              		%>

              <div class="table-row" style="font-size:120%">		
				<div class="table-data"><%=bean.getId()%></div>
				<div class="table-data"><%=bean.getNome()%></div>
				<div class="table-data">€<%= String.format("%.2f", price) %></div>
				<div class="table-data"><%=bean.getIva()%></div>
				<div class="table-data">€<%= String.format("%.2f", priceTOT) %></div>
				<div class="table-data"><a href="#"><button class="btn btn-primary btn-sm rounded">Modifica <i class="ion-android-create"></i></button></a></div>
			</div>              

              <%
				 }
              %>
            </div>
            </div>

	<%@ include file="./fragments/footer.jsp" %>
	
	<script type="text/javascript" src="assets/js/tableSort2.js"></script>
	<script src="assets/js/jquery-latest.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/core.js"></script>
    <script type="text/javascript" src="assets/js/store.js"></script>
    <script type="text/javascript" src="assets/js/carousel-product.js"></script>
    <script type="text/javascript" src="assets/js/jquery.touchSwipe.min.js"></script>
    <script type="text/javascript" src="assets/js/custom-scroll/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="assets/js/jquery.ui.touch-punch.js"></script>
    
</body>
</html>