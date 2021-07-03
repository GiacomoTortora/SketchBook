<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	MetodoPagamentoBean metodoPag = new MetodoPagamentoDAO().doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.MetodoPagamentoBean, model.dao.MetodoPagamentoDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     
    <title>Modifica Metodo Pagamento</title>
    
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/css/carousel-product.css" rel="stylesheet">
    <link href="assets/ionicons-2.0.1/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href='https://fonts.googleapis.com/css?family=Catamaran:400,100,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/custom-scroll/jquery.mCustomScrollbar.css" rel="stylesheet">
</head>

<body>

	<%@ include file="/fragments/header.jsp" %>	
	
    <hr class="offset-lg">
    <hr class="offset-lg">

    <div class="box">
      <div class="container align-center">
      	<div class="row">
          <h1 class="align-center">Modifica Metodo Pagamento</h1>
          <h3 class="align-center">Numero Carta: #<%=metodoPag.getNumCarta() %></h3>
          <hr class="offset-sm">
          </div>
      </div>
    </div>
    <hr class="offset-md">


    <div class="container" style="margin-right:9%">
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                  <div class="panel-body">
                    <div class="checkout-cart">
                      <div class="content">	
                      	                            			
            			<div class="media">
                            <div class="media-body align-center">
                             <form id= "modificaMetodoPagamento" name="modificaMetodoPagamento" class="join" method="post">
        
			                  	<h5>Numero Carta</h5>
			                    <input id="numeroCarta" type="text" name="numeroCarta" value="" placeholder="Numero Carta" required=""/>
			                    
			                    <h5>Tipo</h5>
			                    <input id="tipo" type="text" name="tipo" value="" placeholder="Tipo Carta" required=""/>
			                    
			                    <hr class="offset-lg">
			                    <button id="refresh" type="submit" class="btn btn-primary btn-sm">Aggiorna Metodo Pagamento</button> &nbsp;&nbsp;
			                    <h5>OPPURE</h5>
			                    <button id="delete" type="submit" class="btn btn-primary btn-sm">Elimina Metodo Pagamento</button> &nbsp;&nbsp;
			                  </form>
                            </div>
            			</div>
            			
           			</div>
          		</div>
         	</div>
        </div>
    </div>
</div>
</div>
                      
    <hr class="offset-lg">
	<%@ include file="./fragments/footer.jsp"%>
</body>
</html>