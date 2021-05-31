<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%	
	Cart cart = (Cart) request.getAttribute("cart");
    int totale=0;
	%>
	
<!DOCTYPE html>
<html>
<%@ page import="java.util.*, model.ProductBean, model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Carrello</title>
</head>

<body style="background-color: #FFCC7C">
		<h2>Carrello</h2>
		<h3 style="text-align: right"><a href="product">Prodotti</a></h3>
		<table border="1">
		<tr>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Azioni</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
			   totale += beancart.getPrice();
		%>
		<tr>
			<td><%=beancart.getName()%></td>
			<td><%=beancart.getPrice()%></td>
			<td><a href="cart?action=deleteC&id=<%=beancart.getID()%>">Rimuovi dal carrello</a></td>
		</tr>
		<%} %>
	</table>
	<h2>Totale: <%=totale%></h2>
</body>
</html>