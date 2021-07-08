<%@page import="org.eclipse.jdt.internal.compiler.ast.ThisReference"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    

	
<!DOCTYPE html>
<html>
<%@ page import="java.util.*,model.bean.ProductBean, model.Cart,model.bean.UserBean"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Carrello</title>
    <script>window.onpaint = refresh()
            function refresh(){
				if(window.location.href.includes("CartController"))
    				window.location.href = "Cart.jsp";
			}
    </script>
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
</head>

<body style="background-color: #FFFFFF">
	<%@ include file="./fragments/header.jsp" %>
	
    <%	
    List<ProductBean> products= cart.getProducts();
    double totale=0;
	%>

	<hr class="offset-md">
	<hr class="offset-md">
	<hr class="offset-md">

    <div class="box">
      <div class="container">
          <h1>Carrello</h1>
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
                      <div id="content" class="content">
                   <% if (products.isEmpty()) {%>
                   <h3 class="align-center"> Il carrello è vuoto :( </h3>
                   <%} else for(ProductBean prod : products){ %>
                   
                          <div class="media">
                            <div class="media-left">
                              <a href="details?action=read&id=<%=prod.getId()%>">
                                <img class="media-object" src="assets/img/product/<%=prod.getId()%>/1.jpg" alt="<%=prod.getNome()%>"/>
                              </a>
                            </div>
                            <div class="media-body">
                              <h2 class="h4 media-heading"><%=prod.getNome()%></h2>
                              <p id="price" class="price">€<%=String.format("%.2f", prod.getPrezzoTot())%></p>
                            </div>
                            
                            <div class="controls">
                              <div class="input-group">
                              <div id="row" class="row">
                              <div class="col-md-4">
                               
                                <span class="input-group-btn">
                                <a href="CartController?action=minus&id=<%=prod.getId()%>"><button class="btn btn-default btn-sm" type="button" data-action="minus"><i class="ion-minus-round"></i></button></a> 
                                </span>

                                <input type="text" class="form-control input-sm" placeholder="Qty" value="<%=prod.getQuantitaCarrello()%>" readonly="">
                                <span class="input-group-btn">
                                 <a href="CartController?action=plus&id=<%=prod.getId()%>"><button class="btn btn-default btn-sm" type="button" data-action="plus"><i class="ion-plus-round"></i></button></a>
                                </span>
							  	</div>
							  	<div class="col-sm-2">
							  	</div>
                              </div><!-- /input-group -->
                              <hr class="offset-md">
                              <a href="CartController?action=deleteC&id=<%=prod.getId()%>"><button class="btn btn-primary btn-xs rounded"> <i class="ion-close"></i> Rimuovi</button></a>
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
            
            <div class="col-sm-8 col-md-4">
              <hr class="offset-md visible-sm">
                <div class="panel panel-default">
                  <div class="panel-body">
                    <h2 class="no-margin">Riepilogo</h2>
                    <hr class="offset-md">

                    <div id="toUpdate" class="container-fluid">
                        <div class="row">
                            <div class="col-xs-6">
                                <p>Subtotale</p>
                            </div>
                            <div id="update" class="col-xs-6">
                                <p><b>€ <%=String.format("%.2f", cart.getSubTotale())%></b></p>
                            </div>
                        </div>
                    </div>
                   
                    <div id="toUpdate" class="container-fluid">
                        <div class="row">
                        <% if (!(products.isEmpty())) {%>
                            <div class="col-xs-6">
                                <p>IVA</p>
                            </div>
                            <div class="col-xs-6"> 
                            	<p><b>22%</b></p>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <hr>

                    <div id="toUpdate" class="container-fluid">
                        <div class="row">
                            <div class="col-xs-6">
                                <h3 class="no-margin">Totale</h3>
                            </div>
                            <div id="update" class="col-xs-6">
                                <h3 class="no-margin">€<%=String.format("%.2f", cart.getTotale())%></h3>
                            </div>
                        </div>
                    </div>
                    <hr class="offset-md">
                     <form action="SvuotaCarrelloController" method="post">
                     <%if(!products.isEmpty()){ %>
                     <button id="svuota" type="submit" class="btn btn-danger btn-md align-center"><i class="ion-android-delete"></i> Svuota Carrello</button>
                     <hr class="offset-md">
                     <%
                     	}
                     %>
                     </form>
                        
                    <%if(!products.isEmpty()){ %>
					<%if(currUser==null && admin==null) { %>
                    <a href="#signin" data-toggle="modal" data-target="#Modal-SignIn" class="btn btn-primary btn-lg justify"><i class="ion-android-checkbox-outline"></i>&nbsp;&nbsp; Checkout</a>
                    <%} else { %>
                    <a href="checkout.jsp" class="btn btn-primary btn-lg justify"><i class="ion-android-checkbox-outline"></i>&nbsp;&nbsp; Checkout</a>
                    <hr class="offset-md">
                    <%} } %>
                    </div>
                  </div>
                </div>
            </div>
        </div>        
    <hr class="offset-lg">
    
    <%@ include file="./fragments/footer.jsp" %>  
</body>
</html>