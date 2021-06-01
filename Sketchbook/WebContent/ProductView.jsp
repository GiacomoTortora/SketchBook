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
	
	UserBean currUser=new UserBean();
	
	currUser= (UserBean) session.getAttribute("currentSessionUser");
	
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, model.ProductBean, model.Cart, model.UserBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Prodotti</title>
</head>

<body style="background-color: #FFCC7C" >
	<h2>Prodotti</h2>
	<h3 style="text-align: left"><a href="cart">Carrello</a></h3>
	
	<% 
	 String print="Login";
	 if(currUser==null) { 
		 %>
		 <h3 style="text-align: right"><a href="LoginPage.jsp"><%=print%></a></h3>
		 <h3 style="text-align: right"><a href="SignUpPage.jsp">Sign Up</a></h3>
		 <%
	        } 
	        else { print="Logout";
	    %>
		  <h4 style="text-align: right"><a href="LogoutController"><%=print%></a></h4>
		   <%
	        }
	    %>
		<% 
		 String prints="SketchBook.it";
		 if(currUser==null) {
		 %>
		 <h3 style="text-align: left"><%=prints %></h3>
		 <%
	        } 
	        else { prints="Salve, "+currUser.getFirstName();
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
</body>
</html>