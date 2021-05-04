<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%	
	Cart cart = (Cart) request.getAttribute("cart");
	%>
	
<!DOCTYPE html>
<html>
<%@ page import="java.util.*, model.ProductBean, model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Carrello</title>
</head>

<body>
		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Nome</th>
			<th>Azioni</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getName()%></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getID()%>">Rimuovi dal carrello</a></td>
		</tr>
		<% } %>
	</table>		
</body>
</html>