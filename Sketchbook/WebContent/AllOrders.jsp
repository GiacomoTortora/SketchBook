<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	Collection<?> orders = new OrderDAO().doRetrieveAll("");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.OrderBean, model.Cart, model.bean.UserBean, model.dao.OrderDAO, model.dao.UserDAO"%>

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
    
   <h1 style="margin-left: 19.5%">Ordini Totali di tutti i Clienti</h1>
    
   <div class="container">
   <div class="row">
   <div class="col-sm-12 col-md-13">
          <hr class="offset-lg">

          <div class="products">
            <div class="row">

					<%
							Iterator<?> it = orders.iterator();
							while (it.hasNext()) {
							OrderBean bean = (OrderBean) it.next();
							UserBean usBean=new UserDAO().doRetrieveByKey(bean.getIdCliente());
					%>

              <div class="col-sm-5 col-md-4 product">
                <div class="body">
                  <div class="content">
                    <h1 class="h3">ID Ordine: <%=bean.getId()%></h1>
                    <h2 class="h3">Cliente: <%=usBean.getFirstName()%> <%=usBean.getLastName()%></h2>
                    
                    <%
              			double price=0.0;
              			price = bean.getTotale();       	
              		%>
                    
                    <h1 class="h4">Stato: <%=bean.getStato()%></h1>
                    <hr class="offset-lg">
                    <p class="price">Totale: €<%= String.format("%.2f", price) %></p>
                    <hr class="offset-xl">
                    <a href="OrderDetails?action=read&id=<%=bean.getId() %>"><button class="btn btn-primary btn-sm rounded">Visualizza Dettagli</button></a>
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

	<%@ include file="./fragments/footer.jsp" %>
	
	<script src="assets/js/jquery-latest.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/core.js"></script>
    <script type="text/javascript" src="assets/js/store.js"></script>
    <script type="text/javascript" src="assets/js/carousel-product.js"></script>
    <script type="text/javascript" src="assets/js/jquery.touchSwipe.min.js"></script>
    <script type="text/javascript" src="assets/js/custom-scroll/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="assets/js/jquery.ui.touch-punch.js"></script>
    
</body>
</html>