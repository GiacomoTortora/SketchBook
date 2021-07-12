<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	ProductBean product = new ProductDAO().doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.ProductBean, model.dao.ProductDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     
    <title>Modifica Prodotto</title>
    
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
	<% if(admin==null) response.sendRedirect("401error.jsp"); %>
	
    <hr class="offset-lg">
    <hr class="offset-lg">

    <div class="box">
      <div class="container align-center">
      	<div class="row">
          <h1 class="align-center">Modifica Prodotto</h1>
          <h3 class="align-center"><%=product.getNome()%></h3>
          <a href="details?action=read&id=<%=product.getId()%>"><img src="assets/img/product/<%=product.getId()%>/1.jpg" alt="<%=product.getNome()%>" style="width:20%; height:20%"/></a>
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
                             <form id= "modificaProdotto" name="modificaProdotto" class="join" method="post" onsubmit="return validateProduct(this)">
        
			                  	<h5>Nome</h5>
			                    <input id="nome" type="text" name="nome" value="<%=product.getNome()%>" placeholder="Nome Prodotto" required=""/>
			                    <p class="errormsg" id="nomeErr"></p>
			                    
			                    <h5>Descrizione</h5>
			                    <input id="descrizione" type="text" name="descrizione" value="<%=product.getDescrizione()%>" placeholder="Descrizione Prodotto" required=""/>
			                    <p class="errormsg" id="descrizioneErr"></p>
			                    
								<h5>Prezzo</h5>
			                    <input id="prezzo" type="text" name="prezzo" value="<%= String.format("%.2f", product.getPrezzoTot()) %>" placeholder="Prezzo" required=""/>
			                    <p class="errormsg" id="prezzoErr"></p>
			                    
			                    <h5>IVA %</h5>
			                     <input id="iva" type="text" name="iva" value="22" required=""/>
			                     <p class="errormsg" id="ivaErr"></p>
			                    
								<h5>Quantità</h5>
			                    <input id="quantita" type="number" name="quantita" value="1" required=""/>
			                    <p class="errormsg" id="quantitaErr"></p>
			                    
			                    <h5>Categoria</h5>
			                    <select name="cat" id="cat">
								    <option value="1">Matite</option>
								    <option value="2">Pennarelli</option>
								    <option value="3">Pittura</option>
								    <option value="4">Pennelli</option>
								    <option value="5">Fogli</option>
								    <option value="6">Tele</option>
							  	</select>
							  	
							  	<input id="idbello" name="idbello" type="hidden" value="<%=product.getId()%>"/>
			                    
			                    <hr class="offset-lg">
			                    <button id="refresh" type="submit" class="btn btn-primary btn-sm">Aggiorna Prodotto</button>
			                    <h5>OPPURE</h5>
			                    </form>
			                    <form id= "eliminaProdotto" name="eliminaProdotto" class="join" method="post" action="EliminaProdottoController">
			                    	<input id="idbello" name="idbello" type="hidden" value="<%=product.getId()%>"/>
			                    	<button id="delete" type="submit" class="btn btn-primary btn-sm">Elimina Prodotto</button>
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