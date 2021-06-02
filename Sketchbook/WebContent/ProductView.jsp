<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./home");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
	
	UserBean currUser=new UserBean();
	
	currUser= (UserBean) session.getAttribute("currentSessionUser");
	
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=ISO-8859-1" import="java.util.*, model.ProductBean, model.Cart, model.UserBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" href="./immagini/favicon.png"/>
	<title>Prodotti</title>
</head>

<body style="background-color: #FFCC7C" >

	<%@ include file="./fragments/header.jsp" %>	
	<% 
	 String print="Login";
	 if(currUser==null) { 
	        } 
	        else { print="Logout";
	    %>
		  <h4 style="text-align: right"><a href="LogoutController"><%=print%></a></h4>
		   <%
	        }
	    %>
		<% 

		 if(currUser==null) {
	        } 
	        else { String prints="Salve, "+currUser.getFirstName();
	    %>
		  <h3 style="text-align: left"><a href="UserPage.jsp"><%=prints %></a></h3>
		   <%
	        } 
	    %>
		 
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
			<td><a href="details?action=read&id=<%=bean.getID()%>">Dettagli</a><br><br>
				<a href="cart?action=addC&id=<%=bean.getID()%>">Aggiungi al Carrello</a>
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
	
	<%@ include file="./fragments/footer.jsp" %>
</body>
</html>