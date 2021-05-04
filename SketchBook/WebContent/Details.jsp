<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	%>
	
<!DOCTYPE html>
<html>
<%@ page import="java.util.*, model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Dettagli</title>
</head>

<body style="background-color: #FFCC7C">
	<h2>Details</h2>
	<h3 style="text-align: right"><a href="product">Prodotti</a></h3>
	<h3 style="text-align: right"><a href="cart">Carrello</a></h3>
	
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
</body>
</html>