<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.UserBean, model.dao.UserDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Ordine Confermato</title>
    
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
	
	<% if(admin==null && currUser==null) response.sendRedirect("401error.jsp"); %>
	
    <hr class="offset-lg">
    <hr class="offset-lg">
    
   <h1 class="align-center"><i class="ion-android-done"></i> Grazie per il tuo ordine! <i class="ion-android-done"></i></h1>
   <h3 class="h4 align-center">L'ordine è stato preso in carica con successo.<br> Grazie!</h3>
   <hr class="offset-xl">
   <h3 class="h4 align-center"><a href="ProductView.jsp">Torna Indietro</a></h3>
    

	<%@ include file="./fragments/footer.jsp" %> 
	<script type="text/javascript" src="assets/js/tableSort2.js"></script> 
</body>
</html>