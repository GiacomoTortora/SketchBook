<%@page import="org.eclipse.jdt.internal.compiler.ast.ThisReference"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%	
	Cart cart = (Cart) request.getAttribute("cart");
    UserBean currUser= (UserBean) session.getAttribute("currentSessionUser");
    double totale=0;
	%>
	
<!DOCTYPE html>
<html>
<%@ page import="java.util.*, model.ProductBean, model.Cart, model.UserBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" href="./immagini/favicon.png"/>
	<title>Carrello</title>
</head>

<body style="background-color: #FFCC7C">
<!--  cart non pienamente funzionante -->
		<h2>Carrello</h2>
		<h3 style="text-align: right"><a href="home">Prodotti</a></h3>
		<table border="1">
		<tr>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Quantità</th>
			<th>Azioni</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
			   totale += beancart.getPrice();
		%>
		<tr>
	   <td> <%=beancart.getName() %></td>
	   <td> <%=beancart.getPrice() %></td>
	   <td> <%=beancart.getQuantitaCarrello() %></td>
	   <td><a href="cart?action=deleteC&id=<%=beancart.getID()%>">Rimuovi dal carrello</a></td>
	 </tr>
	  <% }%>
	</table>
	<h2>Totale: &#8364 <%=totale%></h2>
	
	<% 
	 String print="Acquista";
	 if(currUser==null) {
	 %>
	 <h2 style="text-align: right"><a href="LoginPage.jsp"><%=print%></a></h2>
	 <%
        } 
        else { print="Acquista";
    %>
	  <h2 style="text-align: right"><a href="acquisto"><%=print%></a></h2> <!-- da implementare -->
	   <%
        }
    %>
</body>
</html>