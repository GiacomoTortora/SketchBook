<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<%@ page import="java.util.*, model.ProductBean, model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Dettagli</title>
</head>

<body>
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
			<td><%=product.getPrice()%></td>
			<td><%=product.getQuantity()%></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>