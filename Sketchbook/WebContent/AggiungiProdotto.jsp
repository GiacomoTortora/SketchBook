<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.OrderBean, model.bean.ProductBean, model.dao.ProductDAO, model.dao.OrderDAO, model.bean.UserBean"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     
    <title>Aggiungi Nuovo Prodotto</title>
    
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/css/carousel-product.css" rel="stylesheet">
    <link href="assets/ionicons-2.0.1/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href='https://fonts.googleapis.com/css?family=Catamaran:400,100,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/custom-scroll/jquery.mCustomScrollbar.css" rel="stylesheet">
     <script type="text/javascript" src="assets/js/formValidation.js"> </script>
</head>

<body>

	<%@ include file="/fragments/header.jsp" %>	
	
    <hr class="offset-lg">
    <hr class="offset-lg">

    <div class="box">
      <div class="container align-center">
          <h1 class="align-center">Aggiungi Nuovo Prodotto</h1>
          <hr class="offset-sm">
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
                             <form id= "aggiungiProdotto" name="modificaProdotto" class="join" method="post" onsubmit="return validateProduct(this)">
        
			                  	<h5>Nome</h5>
			                    <input id="nome" type="text" name="nome" value="" placeholder="Nome Prodotto" required=""/>
			                    <p class="errormsg" id="nomeErr"></p>
			                    
			                    <h5>Descrizione</h5>
			                    <input id="descrizione" type="text" name="descrizione" value="" placeholder="Descrizione Prodotto" required=""/>
			                    <p class="errormsg" id="descrizioneErr"></p>
			                    
								<h5>Prezzo</h5>
			                    <input id="prezzo" type="text" name="prezzo" value="" placeholder="Prezzo" required=""/>
			                    <p class="errormsg" id="prezzoErr"></p>
			                    
			                    <h5>IVA %</h5>
			                     <input id="iva" type="text" name="iva" value="22" required=""/>
			                     <p class="errormsg" id="ivaErr"></p>
			                    
								<h5>Quantità</h5>
			                    <input id="quantita" type="number" name="quantita" value="1" required=""/>
			                    <p class="errormsg" id="quantitaErr"></p>
			                    <hr class="offset-lg">
			                    <button id="addBtn" type="submit" class="btn btn-primary btn-sm">Aggiungi Prodotto</button> &nbsp;&nbsp;
			                    <h5>N.B - Non scordare di caricare le immagini del prodotto sul server!</h5>
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