<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <title>Galleria</title>
    
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/css/carousel.css" rel="stylesheet">
    <link href="assets/ionicons-2.0.1/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href='https://fonts.googleapis.com/css?family=Catamaran:400,100,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/custom-scroll/jquery.mCustomScrollbar.css" rel="stylesheet">
</head>

<body>

	<%@ include file="/fragments/header.jsp" %>	
	
    <hr class="offset-lg">
    <hr class="offset-lg">
    <hr class="offset-xs">

	<div class="white">
        <div class="container checkout">
            <h1>Galleria Disegni dei Clienti</h1>
            <hr class="offset-sm">
        </div>
    </div>
    
    <div class="white">

	<div class="container gallery">
        <div class="row">
        <%
        	for(int i=1; i<15; i++) {
   
        %>
          <div class="col-xs-12 col-sm-6 col-md-4">
            <div class="preview" data-preview="assets/img/blog/<%=i%>.jpg" data-gallery="#photo" data-source="assets/img/blog/<%=i%>.jpg">
              <div class="title">
                <div class="caption">
                  <i class="ion-ios-albums-outline"></i>
                  <h4> Vedi </h4>
                </div>
              </div>
            </div>
          </div>
    	<%
        	}
    	%>
        </div>
      </div>   
    </div>
	
	<%@ include file="./fragments/footer.jsp" %>
</body>
</html>