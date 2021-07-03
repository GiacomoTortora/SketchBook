<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="model.bean.UserBean"
%>
  
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.OrderBean, model.Cart, model.bean.UserBean, model.dao.OrderDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Funzioni Admin</title>
    
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

 <h1> Pagina protetta</h1>
 <br>
 
 <h1 class="align-center"><i class="ion-wrench"></i> Funzioni admin <i class="ion-wrench"></i></h1>
 
 <div class="container">
   <div class="row">
   <div class="col-sm-12 col-md-13">
          <hr class="offset-lg">
          <div class="products">
            <div class="row">

              <div class="col-sm-5 col-md-4 product">
                <div class="body">
                  <div class="content">
                    <h1 class="h3" style="color:#3ab5da">Visualizza Ordini Totali <i class="ion-ios-pricetag"></i></h1>                    
                    <h4 class="h5">Permette di visualizzare tutti gli ordini effettuati da tutti i clienti.</h4>
                    <hr class="offset-xl">
                    <a href="AllOrders.jsp"><button class="btn btn-primary btn-sm rounded">Vai</button></a>
                  </div>
                </div>
              </div>
              
               <div class="col-sm-5 col-md-4 product">
                <div class="body">
                  <div class="content">
                    <h1 class="h3" style="color:#3ab5da">Gestisci Catalogo Prodotti <i class="ion-ios-list"></i></h1>                       
                    <h4 class="h5">Permette di gestire il catalogo prodotti. (Aggiungere, rimuovere, modificare)</h4>
                    <hr class="offset-xl">
                    <a href="ModificaCatalogo.jsp"><button class="btn btn-primary btn-sm rounded">Vai</button></a>
                  </div>
                </div>
              </div>
              
              <div class="col-sm-5 col-md-4 product">
                <div class="body">
                  <div class="content">
                    <h1 class="h3" style="color:#3ab5da">FAQ <i class="ion-help"></i></h1>                       
                    <h4 class="h5">Hai delle domande? Prova a trovare una risposta nelle nostre FAQ.</h4>
                    <hr class="offset-xl">
                    <a href="FAQ.jsp"><button class="btn btn-primary btn-sm rounded">Vai</button></a>
                  </div>
                </div>
              </div>
     
            </div>
          </div>
        </div>
      </div>
	</div>
 
 <%@ include file="/fragments/footer.jsp" %>
</body>
</html>