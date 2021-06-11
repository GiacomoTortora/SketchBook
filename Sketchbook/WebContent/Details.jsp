<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	%>
	
<!DOCTYPE html>
<html>
<%@ page import="java.util.*, model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" href="./images/favicon.png"/>
	<title>Dettagli</title>
</head>

<body style="background-color: #FFFFFF">
<%@ include file="./fragments/header.jsp" %>
	<%
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Quantita</th>
			<th>Azioni</th>
		</tr>
		<tr>
			<td><%=product.getID()%></td>
			<td><%=product.getName()%></td>
			<td><%=product.getDescription()%></td>
			<td><%=product.getPrice()%></td>
			<td><%=product.getQuantity()%></td>
			<td><a href="cart?action=addC&id=<%=product.getID()%>">Aggiungi al Carrello</a></td>
		</tr>
	</table>
	<%
		}
	%>
	
	<%@ include file="./fragments/footer.jsp" %>
</body>
</html>