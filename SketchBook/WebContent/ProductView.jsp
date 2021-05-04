<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, model.ProductBean, model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Prodotti</title>
</head>

<body style="background-color: #c0c0c0" >
	<h2>Prodotti</h2>
	<table border="1">
		<tr>
			<th>ID <a href="product?sort=id">Ordina</a></th>
			<th>Nome <a href="product?sort=nome">Ordina</a></th>
			<th>Descrizione <a href="product?sort=descrizione">Ordina</a></th>
			<th>Azioni</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getID()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getDescription()%></td>
			<td><a href="product?action=read&id=<%=bean.getID()%>">Dettagli</a><br>
				<a href="product?action=addC&id=<%=bean.getID()%>">Aggiungi al Carrello</a>
				</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">Nessun prodotto disponibile</td>
		</tr>
		<%
			}
		%>
	</table>
	
	<h2>Details</h2>
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
		</tr>
		<tr>
			<td><%=product.getID()%></td>
			<td><%=product.getName()%></td>
			<td><%=product.getDescription()%></td>
			<td><%=product.getPrice()%>€</td>
			<td><%=product.getQuantity()%></td>
		</tr>
	</table>
	<%
		}
	%>
	<% if(cart != null) { %>
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
		<%} %>
	</table>		
	<% } %>	
</body>
</html>