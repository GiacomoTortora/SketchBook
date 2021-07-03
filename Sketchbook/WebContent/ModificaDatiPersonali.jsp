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
     
    <title>Modifica Dati Personali</title>
    
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
	<% if(currUser==null) response.sendRedirect("401error.jsp"); %>
	
    <hr class="offset-lg">
    <hr class="offset-lg">

    <div class="box">
      <div class="container align-center">
          <h1>Modifica Dati Personali</h1>
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
                            <div class="media-body">
                              <h2 class="h4 media-heading">Nome: </h2>  
                              <label><%=currUser.getFirstName()%></label><br>
                              <hr class="offset-sm">
                              <a href="#"><button class="btn btn-primary btn-sm rounded">Modifica <i class="ion-android-create"></i></button></a>
                            </div>
            			</div>
            			
            			<div class="media">
                            <div class="media-body">
                              <h2 class="h4 media-heading">Cognome: </h2>  
                              <label><%=currUser.getLastName()%></label><br>
                              <hr class="offset-sm">
                              <a href="#"><button class="btn btn-primary btn-sm rounded">Modifica <i class="ion-android-create"></i></button></a>
                            </div>
            			</div>
            			
            			<div class="media">
                            <div class="media-body">
                              <h2 class="h4 media-heading">Email: </h2>  
                              <label><%=currUser.getEmail()%></label><br>
                              <hr class="offset-sm">
                              <a href="#"><button class="btn btn-primary btn-sm rounded">Modifica <i class="ion-android-create"></i></button></a>
                            </div>
            			</div>
            			
            			<div class="media">
                            <div class="media-body">
                              <h2 class="h4 media-heading">Password: </h2>  
                              <label><%=currUser.getPassword()%></label><br>
                              <hr class="offset-sm">
                              <a href="#"><button class="btn btn-primary btn-sm rounded">Modifica <i class="ion-android-create"></i></button></a>
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