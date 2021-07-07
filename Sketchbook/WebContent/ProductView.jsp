<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./home");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	ArrayList<ProductBean> prodotti = new ArrayList<ProductBean>();
	ArrayList<Integer> uscito = new ArrayList<Integer>();
	
%>

<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=utf-8" import="java.util.*,model.bean.ProductBean, model.Cart, model.bean.UserBean, model.dao.ProductDAO"%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> SketchBook Art Shop</title>

    <meta name="description" content="SketchBook Art Shop">
    <link rel="shortcut icon" href="assets/img/favicon.png"/>

    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/css/carousel.css" rel="stylesheet">
    <link href="assets/ionicons-2.0.1/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href='https://fonts.googleapis.com/css?family=Catamaran:400,100,300' rel='stylesheet' type='text/css'>

    <link href="assets/css/custom-scroll/jquery.mCustomScrollbar.css" rel="stylesheet">
  </head>
  
  <body>
    
    <%@ include file="/fragments/header.jsp" %>

    <header>
      <div class="carousel" data-count="3" data-current="1">

        <div class="items">
          <button class="btn btn-control" data-direction="right"> <i class="ion-ios-arrow-right"></i></button>
          <button class="btn btn-control" data-direction="left"> <i class="ion-ios-arrow-left"></i></button>


          <div class="item center" data-marker="1">
            <img src="assets/img/carousel/bckg-2.png" alt="Background" class="background hidden-xs hidden-sm"/>
            <img src="assets/img/carousel/bckg-2-sm.png" alt="Background" class="background visible-sm"/>
            <img src="assets/img/carousel/bckg-2-xs.png" alt="Background" class="background visible-xs"/>

            <div class="content">
              <div class="outside-content">
                <div class="inside-content">
                  <div class="container align-right">

                    <h1 class="h3 colorful blue hidden-xs">Il kit perfetto per iniziare</h1>

                    <hr class="offset-sm">
                    <h2 class="h1 lg upp colorful blue">TINTORETTO <br> RIMO KIT 7914</h2>
                    <hr class="offset-md">
                    <hr class="offset-md">
                    <a href="AllProducts.jsp" rel="nofollow" class="btn btn-primary btn-lg black"> Scopri di più </a>

                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="item" data-marker="2">
            <img src="assets/img/carousel/bckg-1.png" alt="Background" class="background hidden-xs hidden-sm"/>
            <img src="assets/img/carousel/bckg-1-sm.png" alt="Background" class="background visible-sm"/>
            <img src="assets/img/carousel/bckg-1-xs.png" alt="Background" class="background visible-xs"/>

            <div class="content">
              <div class="outside-content">
                <div class="inside-content">
                  <div class="container">

                    <h1 class="h3 colorful blue hidden-xs">Fatto su misura per i più creativi</h1>
                    <hr class="offset-sm">

                    <h2 class="h1 lg upp colorful blue">TINTORETTO <br> THIERRY DUVAL KIT</h2>
                    <hr class="offset-md">
                    <hr class="offset-md">
                    <a href="AllProducts.jsp" rel="nofollow" class="btn btn-primary btn-lg black"> Scopri di più </a>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="item" data-marker="3">
            <img src="assets/img/carousel/bckg-3.png" alt="Background" class="background hidden-xs hidden-sm"/>
            <img src="assets/img/carousel/bckg-3-sm.png" alt="Background" class="background visible-sm"/>
            <img src="assets/img/carousel/bckg-3-xs.png" alt="Background" class="background visible-xs"/>

            <div class="content">
              <div class="outside-content">
                <div class="inside-content">
                  <div class="container align-right">
                  
                    <h1 class="h3 colorful blue hidden-xs">I migliori prodotti solo da noi</h1>

                    <hr class="offset-sm">
                    <h2 class="h1 lg upp colorful blue">Pennelli e <br class="hidden-xs"> materiale da pittura</h2>
                    <hr class="offset-md">
                    <hr class="offset-md">
                    <a href="AllProducts.jsp" rel="nofollow" class="btn btn-primary btn-lg black"> Scopri di più </a>
                      
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <ul class="markers">
          <li data-marker="1" data-style="white" class="active"></li>
          <li data-marker="2" data-style="white"></li>
          <li data-marker="3" data-style="white"></li>
        </ul>

      </div>
    </header>
    <hr class="offset-lg">
    <hr class="offset-lg">

    <div class="bars">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-md-4 no-padding padding-xs">
            <div class="bar medium" data-background="assets/img/bars/pencil.jpg">
              <h3 class="title black">Matite</h3>

              <div class="wrapper">
                <div class="content">
                  <hr class="offset-sm">
                  <a href="ProductCategory?action=read&categoria=1" rel="nofollow" class="btn btn-default black"> Vedi <i class="ion-android-arrow-forward"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="bar small" data-background="assets/img/bars/brush.jpg">
              <h3 class="title black">Pennelli</h3>

              <div class="wrapper">
                <div class="content">
                  <hr class="offset-sm">
                  <a href="ProductCategory?action=read&categoria=4" rel="nofollow" class="btn btn-primary black"> Vedi <i class="ion-android-arrow-forward"></i></a>
                </div>
              </div>
            </div>

            <hr class="offset-xs">
            <hr class="offset-xs">

            <div class="bar small" data-background="assets/img/bars/paper.jpg">
              <h3 class="title black">Fogli</h3>
              
              <div class="wrapper">
                <div class="content">
                  <hr class="offset-sm">
                  <a href="ProductCategory?action=read&categoria=5" rel="nofollow" class="btn btn-primary black"> Vedi <i class="ion-android-arrow-forward"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-4 no-padding hidden-xs hidden-sm">
            <div class="bar medium" data-background="assets/img/bars/oil-colors.jpg">
              <h3 class="title black">Pittura</h3>
              
              <div class="wrapper">
                <div class="content">
                  <hr class="offset-sm">
                  <a href="ProductCategory?action=read&categoria=3" rel="nofollow" class="btn btn-primary black"> Vedi <i class="ion-android-arrow-forward"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <hr class="offset-lg">
    <hr class="offset-md">


    <section class="products">
      <div class="container">
        <h2 class="h2 upp align-center"> I più venduti </h2>
        <hr class="offset-lg">

        <div class="row">

		<%

			Iterator<?> it = products.iterator();
			while (it.hasNext()) 
			prodotti.add((ProductBean) it.next());

		
			for(int i=0; i<4; i++) {
				Random generator = new Random();
				int random = 1+(generator.nextInt(prodotti.size()-1));
				while(uscito.contains(random) || (prodotti.get(random).getQuantitaCatalogo() == 0)) {
					random = 1+(generator.nextInt(prodotti.size()-1));
				}
				
				uscito.add(random);
		%>

          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="details?action=read&id=<%=prodotti.get(random).getId()%>"><img src="assets/img/product/<%=prodotti.get(random).getId()%>/1.jpg"/></a>

              <div class="content align-center">
              <%
              			double price=0.0;
              			price = prodotti.get(random).getPrezzoTot();       	
              %>
                <p class="price">€<%= String.format("%.2f", price) %></p>
                <h2 class="h3"><%=prodotti.get(random).getNome()%></h2>
                <hr class="offset-sm">
              <a href="CartController?action=addC&id=<%=prodotti.get(random).getId()%>" data-toggle="modal" data-target="#Modal-Cart"><button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al carrello</button></a>
              </div>
            </div>
          </div>
          <%
			}
          %>
        </div>

        <div class="align-right align-center-xs">
          <hr class="offset-sm">
          <a href="AllProducts.jsp"> <h5 class="upp">Scopri di più </h5> </a>
        </div>
      </div>
    </section>

    <section class="products">
      <div class="container">
        <h2 class="h2 upp align-center"> In Sconto </h2>
        <hr class="offset-lg">

        <div class="row">

		<%	
			for(int i=0; i<3; i++) {
				Random generator = new Random();
				int random = 1+(generator.nextInt(prodotti.size()-1));
				while(uscito.contains(random) || (prodotti.get(random).getQuantitaCatalogo() == 0)) {
					random = 1+(generator.nextInt(prodotti.size()-1));
				}
				
				uscito.add(random);
		%>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="details?action=read&id=<%=prodotti.get(random).getId()%>"><img src="assets/img/product/<%=prodotti.get(random).getId()%>/1.jpg"/></a>
              <div class="content align-center">
              <%
              			double price=0.0;
              			price = prodotti.get(random).getPrezzoTot();       	
              %>
                <p class="price">€<%= String.format("%.2f", price) %></p>
                <p class="price through">€<%= String.format("%.2f", price+10) %></p>
                <h2 class="h3"><%=prodotti.get(random).getNome()%></h2>
                <hr class="offset-sm">
                <a href="CartController?action=addC&id=<%=prodotti.get(random).getId()%>" data-toggle="modal" data-target="#Modal-Cart"><button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al carrello</button></a>
              </div>
            </div>
          </div>
		<%
			}
		%>
        </div>
        <div class="align-right align-center-xs">
          <hr class="offset-sm">
          <a href="AllProducts.jsp"> <h5 class="upp">Scopri di più </h5> </a>
        </div>
      </div>
    </section>


    <section class="products">
      <div class="container">
        <h2 class="h2 upp align-center">Gli altri hanno acquistato</h2>
        <hr class="offset-lg">

        <div class="row">

		<%	
			for(int i=0; i<3; i++) {
				Random generator = new Random();
				int random = 1+(generator.nextInt(prodotti.size()-1));
				while(uscito.contains(random) || (prodotti.get(random).getQuantitaCatalogo() == 0)) {
					random = 1+(generator.nextInt(prodotti.size()-1));
				}
				
				uscito.add(random);
		%>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="details?action=read&id=<%=prodotti.get(random).getId()%>"><img src="assets/img/product/<%=prodotti.get(random).getId()%>/1.jpg"/></a>
              <div class="content align-center">
              <%
              			double price=0.0;
              			price = prodotti.get(random).getPrezzoTot();       	
              %>
                <p class="price">€<%= String.format("%.2f", price) %></p>
                <h2 class="h3"><%=prodotti.get(random).getNome()%></h2>
                <hr class="offset-sm">
                <a href="CartController?action=addC&id=<%=prodotti.get(random).getId()%>" data-toggle="modal" data-target="#Modal-Cart"><button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al carrello</button></a>
              </div>
            </div>
          </div>
        <%
			}
        %>

        <div class="align-right align-center-xs">
          <hr class="offset-sm">
          <a href="AllProducts.jsp"> <h5 class="upp">Scopri di più</h5> </a>
        </div>
    </section>


    	<div class="container gallery">
    	<h2 class="h2 upp align-center">Galleria Immagini</h2>
        <div class="row">
        <%
        	for(int i=1; i<4; i++) {
   
        %>
          <div class="col-xs-12 col-sm-6 col-md-4">
            <div class="preview" data-preview="assets/img/blog/<%=i%>.jpg" data-gallery="#photo" data-source="assets/img/blog/<%=i%>.jpg">
              <div class="title">
                <div class="caption">
                  <i class="ion-ios-albums-outline"></i>
                  <h4> Vedi </h4>
                </div>
              </div>
            </div>
          </div>
          <%
        	}
          %>
          <div class="align-right align-center-xs">
          <hr class="offset-sm">
          <a href="Galleria.jsp"> <h5 class="upp">Vedi Galleria Completa</h5> </a>
        </div>
          </div>
          </div>


	<%@ include file="/fragments/footer.jsp" %>
  </body>
</html>