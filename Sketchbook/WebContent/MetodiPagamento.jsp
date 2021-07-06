<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.MetodoPagamentoBean, model.Cart, model.bean.UserBean, model.dao.MetodoPagamentoDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>I Tuoi Metodi di Pagamento</title>
    
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
	
	<% if(currUser==null && admin==null) response.sendRedirect("401error.jsp"); %>
	
	<%
		UserBean user;
	    if(currUser != null)
	        user = currUser;
	    else 
	        user = admin;
	    
	    Collection<?> metodi_pagamento = new MetodoPagamentoDAO().doRetrieveByUser(user,"");
	%>
	
    <hr class="offset-lg">
    <hr class="offset-lg">
    <hr class="offset-lg">
    
   <h1 class="align-center">I Tuoi Metodi di Pagamento</h1>
   
   	<div class="container">
   <div class="row">
   <div class="col-sm-12 col-md-13">
          <hr class="offset-lg">

          <div class="products">
            <div class="row">

					<%
							Iterator<?> it = metodi_pagamento.iterator();
							int i=1;
							while (it.hasNext()) {
							MetodoPagamentoBean bean = (MetodoPagamentoBean) it.next();
					%>

              <div class="col-sm-5 col-md-4 product">
                <div class="body">
                  <div class="content">
                    <h1 class="h3">Metodo di Pagamento n. <%=i++ %></h1>
                    <h2 class="h4">Tipo: <%=bean.getTipo()%></h2>
                    <h2 class="h4">Numero: <%=bean.getNumCarta()%></h2>
                    <hr class="offset-xl">
                    <a href="ModificaMetodoPagamentoController?action=read&id=<%=bean.getId()%>"><button class="btn btn-primary btn-sm rounded">Modifica <i class="ion-android-create"></i></button></a>
                  </div>
                </div>
              </div>
              <%
				 }
              %>
            </div>
          </div>
        </div>
      </div>
	</div>
	<a href="Aggiungi-MetodoPagamento.jsp"><button class="btn btn-primary btn-lg rounded" style="margin-left:80%">Aggiungi Metodo di Pagamento <i class="ion-android-add-circle"></i></button></a>
            	
	<%@ include file="./fragments/footer.jsp" %>	  
</body>
</html>