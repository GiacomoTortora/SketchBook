<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	Collection<?> products = new ProductDAO().doRetrieveAll("");
	ProductBean product = (ProductBean) request.getAttribute("product");
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
    <link href="assets/css/table.css" rel="stylesheet">
</head>

<body>

	<%@ include file="/fragments/header.jsp" %>	
	
    <hr class="offset-lg">
    <hr class="offset-lg">
    <h1 class="align-center">Tutti i Prodotti</h1>

    <div class="container">
      <div class="row">
      
        <!-- Filtri -->
        <div class="col-sm-4 col-md-3">
          <hr class="offset-lg">

          <div class="filter">           
            <div class="item">
                <div class="title">
                    <a href="#clear" data-action="open" class="down"> <i class="ion-android-arrow-dropdown"></i> Open</a>
                    <a href="#clear" data-action="clear"> <i class="ion-ios-trash-outline"></i> Reset</a>
                    <h1 class="h4">Marca</h1>
                </div>

                <div class="controls">
                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                      <div class="label" data-value="Canson">Canson</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>

                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                      <div class="label" data-value="Cobra">Cobra</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>

                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="Copic">Copic</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>

                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="Derwent">Derwent</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>

                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="Ecoline">Ecoline</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>

                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="FaberCastel">Faber Castel</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>

                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="Fabriano">Fabriano</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>
                  
                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="LefrancBourgeois">LeFranc Bourgeois</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>
                  
                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="Lyra">Lyra</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>
                  
                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="Pintura">Pintura</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>
                  
                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="VanGogh">Van Gogh</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>

                  <div class="checkbox-group" data-status="inactive">
                      <div class="checkbox"><i class="ion-android-done"></i></div>
                       <div class="label" data-value="Winsor&Newton">Winsor & Newton</div>
                      <input type="checkbox" name="checkbox" value="">
                  </div>
                </div>
            </div>
          </div>
        </div>
        <!-- /// -->

        <!-- Prodotti -->
        <div class="col-sm-8 col-md-9">
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
                    
                    <p class="price">€<%= String.format("%.2f", price) %></p>

                    <button class="btn btn-link"> <i class="ion-ios-heart"></i> Aggiungi ai Preferiti</button>
                    <a href="CartController?action=addC&id=<%=bean.getId() %>"><button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al carrello!</button></a>
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