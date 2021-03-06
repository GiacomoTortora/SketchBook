<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	Collection<?> products = new ProductDAO().doRetrieveByCategory(Integer.parseInt(request.getParameter("categoria")));
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.ProductBean, model.Cart, model.bean.UserBean, model.dao.ProductDAO"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Catalogo</title>
    
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/css/carousel-product.css" rel="stylesheet">
    <link href="assets/ionicons-2.0.1/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href='https://fonts.googleapis.com/css?family=Catamaran:400,100,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/custom-scroll/jquery.mCustomScrollbar.css" rel="stylesheet">
</head>

<body>

	<%@ include file="/fragments/header.jsp" %>	
	
    <hr class="offset-lg">
    <hr class="offset-lg">

	<%
		switch(Integer.parseInt(request.getParameter("categoria"))) {
		case 1:
	%>
	<h1 class="align-center">Matite</h1>
	<%
		break;
		case 2:
	%>
	<h1 class="align-center">Pennarelli</h1>
	<%
		break;
		case 3:
	%>
	<h1 class="align-center">Pittura</h1>
	<%
		break;
		case 4:
	%>
	<h1 class="align-center">Pennelli</h1>
	<%
		break;
		case 5:
	%>
	<h1 class="align-center">Fogli</h1>
	<%
		break;
		case 6:
	%>
	<h1 class="align-center">Tele</h1>
	<%
		break;
		}
	%>

    <div class="container">
      <div class="row">
        <div class="col-sm-4 col-md-3">
          <hr class="offset-lg">
        </div>

        <!-- Prodotti -->
        <div class="col-sm-8 col-md-9" style="margin-left:12%">
          <hr class="offset-lg">

          <div class="products">
            <div class="row">

					<%
							Iterator<?> it = products.iterator();
							while (it.hasNext()) {
							ProductBean bean = (ProductBean) it.next();
					%>

              <div class="col-sm-5 col-md-4 product">
                <div class="body">
                  <a href="details?action=read&id=<%=bean.getId()%>"><img src="assets/img/product/<%=bean.getId()%>/1.jpg" alt="<%=bean.getNome()%>"/></a>

                  <div class="content">
                    <h1 class="h3"><%=bean.getNome()%></h1>
                    
                    <%
              			double price=0.0;
              			price = bean.getPrezzoTot();       	
              		%>
                    
                    <p class="price">???<%= String.format("%.2f", price) %></p>
					<hr class="offset-xs">
                   <%
                  		if(bean.getQuantitaCatalogo() == 0) {
		              %>
		              <button class="btn btn-danger rounded disabled"><i class="ion-bag"></i> Prodotto Esaurito</button>
		              <%
		                  }
		                  else {
		              %>
		              <a href="CartController?action=addC&id=<%=bean.getId() %>" data-toggle="modal" data-target="#Modal-Cart"><button class="btn btn-primary btn-md rounded"> <i class="ion-bag"></i> Aggiungi al carrello</button></a>
		              <%
		                  }
		              %>
                  </div>
                </div>
              </div>
              <%
				 }
              %>
             </div>
            </div>
           </div>
          </div>
         </div>
        <nav>
       </nav>

    
	
	<%@ include file="./fragments/footer.jsp" %>
</body>
</html>