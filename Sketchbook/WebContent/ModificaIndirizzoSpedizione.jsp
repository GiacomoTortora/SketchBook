<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	IndirizzoSpedizioneBean indSped = new IndirizzoSpedizioneDAO().doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.IndirizzoSpedizioneBean, model.dao.IndirizzoSpedizioneDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     
    <title>Modifica Indirizzo Spedizione</title>
    
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
	<% if(admin==null && currUser==null) response.sendRedirect("401error.jsp"); %>
	
    <hr class="offset-lg">
    <hr class="offset-lg">

    <div class="box">
      <div class="container align-center">
      	<div class="row">
          <h1 class="align-center">Modifica Indirizzo Spedizione</h1>
          <h3 class="align-center">Indirizzo Via: <%=indSped.getVia() %>, <%=indSped.getCitta()%></h3>
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
                             <form id= "modificaIndirizzo" name="modificaIndirizzo" class="join" method="post" onsubmit="return validateIndirizzo(this)">
        
			                  	<h5>Via</h5>
			                    <input id="via" type="text" name="via" value="<%=indSped.getVia() %>" placeholder="Via e Civico" required/>
			                    <p class="errormsg" id="viaErr"></p>
			                    
			                    <h5>Citt??</h5>
			                    <input id="citta" type="text" name="citta" value="<%=indSped.getCitta() %>" placeholder="Citt??" required/>
			                    <p class="errormsg" id="cittaErr"></p>
			                    
								<h5>CAP</h5>
			                    <input id="cap" type="text" name="cap" value="<%=indSped.getCAP() %>" placeholder="CAP" required/>
			                    <p class="errormsg" id="capErr"></p>
			                    
			                    <h5>Provincia</h5>
			                     <input id="provincia" type="text" name="provincia" value="<%=indSped.getProvincia() %>" placeholder="Provincia" required/>
			                      <p class="errormsg" id="provinciaErr"></p>
			                    
								<h5>Stato</h5>
			                    <input id="stato" type="text" name="stato" value="<%=indSped.getStato() %>" placeholder="Stato" required/>
			                    <p class="errormsg" id="statoErr"></p>
			                    
			                    <input id="idbello" type="hidden" name="idbello" value="<%=indSped.getId()%>"/>
			                    <hr class="offset-lg">
			                    <button id="refresh" type="submit" class="btn btn-primary btn-sm">Aggiorna Indirizzo</button>
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