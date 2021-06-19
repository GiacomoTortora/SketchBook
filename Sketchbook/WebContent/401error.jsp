<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Unauthorized access</title>

    <link rel="shortcut icon" href="assets/img/favicon.png"/>
    <link rel="stylesheet" href="assets/css/error-page.css"/>
	
</head>
<body>
<%@ include file="/fragments/header.jsp" %>

 	<img src="assets/img/404.png">
    <div class="content">
    	<h1 style="font-size: 3000%">401</h1>
    	<br><br><br><br><br><br><br><br>
        <h1>Hey, non dovresti essere qui!</h1>
        <h2>La risorsa a cui stai tentando di accedere è off-limits.</h2>
        <a href="home">Torna alla home</a><br><br><br>
    </div>
    
	<%@ include file="/fragments/footer.jsp" %>
</body>
</html>
