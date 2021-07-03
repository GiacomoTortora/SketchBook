<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	OrderBean order = new OrderDAO().doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
	Collection<?> products = new ProductDAO().doRetrieveByOrder(Integer.parseInt(request.getParameter("id")));
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.OrderBean, model.bean.ProductBean, model.dao.ProductDAO, model.dao.OrderDAO, model.bean.UserBean"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <%
    	int id = Integer.parseInt(request.getParameter("id"));
    %>
    
    <title>Dettagli Ordine ID <%=id %></title>
    
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
	
	<% if(currUser==null && admin==null) response.sendRedirect("401error.jsp"); %>
	
    <hr class="offset-lg">
    <hr class="offset-lg">

    <div class="box">
      <div class="container">
          <h1>Dettagli Ordine ID: <%=id %></h1>
          <hr class="offset-sm">
      </div>
    </div>
    <hr class="offset-md">


    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                  <div class="panel-body">
                    <div class="checkout-cart">
                      <div class="content">		
                        <%
							Iterator<?> it = products.iterator();
							while (it.hasNext()) {
							ProductBean bean = (ProductBean) it.next();
						%>
                      			
						<%
              					double price=0.0;
                                int quantita = 1;	//va implementata una funzione che ritorna la quantità di un prodotto nell'ordine
              					price = quantita * (bean.getPrezzoTot()); 
              			%>
                           
                          <div class="media">
                            <div class="media-left">
                              <a href="details?action=read&id=<%=bean.getId()%>">
                                <img class="media-object" src="assets/img/product/<%=bean.getId()%>/1.jpg" alt="<%=bean.getNome()%>"/>
                              </a>
                            </div>
                            <div class="media-body">
                              <h2 class="h4 media-heading"><%=bean.getNome()%></h2>  
                              <label>Quantità: <%=quantita%></label>
                              <p class="price">€<%= String.format("%.2f", price)%></p>
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
    <div class="col-sm-8 col-md-4">
              <hr class="offset-md visible-sm">
                <div class="panel panel-default">
                  <div class="panel-body">
                    <h2 class="no-margin">Riepilogo</h2>
                    <hr class="offset-md">

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-6">
                                <p>Subtotale</p>
                            </div>
                            <div class="col-xs-6">
							<p><b>€ <%=String.format("%.2f", ((order.getTotale()*100)/122))%></b></p>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-6">
                                <p>IVA</p>
                            </div>
                            <div class="col-xs-6">
                                <p><b>22%</b></p>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-6">
                                <h3 class="no-margin">Totale</h3>
                            </div>
                            <div class="col-xs-6">
                                <h3 class="no-margin">€<%=String.format("%.2f", order.getTotale()) %></h3>
                            </div>
                        </div>
                    </div>
                    </div>
                  </div>
                </div>
</div>
</div>
                      
    <hr class="offset-lg">
	<%@ include file="./fragments/footer.jsp"%>
</body>
</html>