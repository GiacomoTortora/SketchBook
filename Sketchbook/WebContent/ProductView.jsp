<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./home");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	
	
	
%>

<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=utf-8" import="java.util.*,model.bean.ProductBean, model.Cart,model.bean.UserBean"%>
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

          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="details?action=read&id=10"><img src="assets/img/product-home/10.jpg" alt="Derwent 6pz"/></a>

              <div class="content align-center">
                <p class="price">€8.95</p>
                <h2 class="h3">Derwent Matite 6pz</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="details?action=read&id=13"><img src="assets/img/product-home/winsor-newton-promarkers.jpg" alt="Winsor&Newton ProMarker"/></a>

              <div class="content align-center">
                <p class="price">€17.36</p>
                <h2 class="h3">W&N Promarkers</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="details?action=read&id=15"><img src="assets/img/product-home/ecoline.jpg" alt="Ecoline Brush Pen"/></a>

              <div class="content align-center">
                <p class="price">€14.79</p>
                <h2 class="h3">Ecoline Brush Pen</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>


          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="details?action=read&id=17"><img src="assets/img/product-home/wn-acquerelli.jpg" alt="Winsor&Newton Set Acquerelli"/></a>

              <div class="content align-center">
                <p class="price">€14.49</p>
                <h2 class="h3">W&N Acquerelli</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>


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

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="details?action=read&id=19"><img src="assets/img/product-home/derwent-paintkit.jpg" alt="Derwent Paint Kit"/></a>

              <div class="content align-center">
                <p class="price">€23.80</p>
                <p class="price through">€39.90</p>
                <h2 class="h3">Derwent Paint Kit</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="details?action=read&id=16"><img src="assets/img/product-home/promarker-color.jpg" alt="Winsor&Newton Promarker Color"/></a>

              <div class="content align-center">
                <p class="sale">€16.24</p>
                <p class="price through">€21.99</p>
                <h2 class="h3">W&N Promarker Color</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="details?action=read&id=5"><img src="assets/img/product-home/art-book.jpg" alt="Canson Art Book"/></a>

              <div class="content align-center">
                <p class="price">€9.99</p>
                <p class="price through">€14.99</p>
                                <h2 class="h3">Canson Art Book</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>
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

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="details?action=read&id=7"><img src="assets/img/product-home/faber-castell.jpg" alt="Faber Castel Polychromos"/></a>

              <div class="content align-center">
                <p class="price">€55.00</p>
                <h2 class="h3">Faber-Castel Polychromos</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="details?action=read&id=22"><img src="assets/img/product-home/pennelli.jpg" alt="Pennelli LeFranc"/></a>

              <div class="content align-center">
                <p class="price">€6.16</p>
                <h2 class="h3">Pennelli LeFranc Bougeois</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="details?action=read&id=24"><img src="assets/img/product-home/tela.jpg" alt="Tela Pintura 30x40"/></a>

              <div class="content align-center">
                <p class="price">€5.29</p>
                <h2 class="h3">Tela Pintura 30x40</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al Carrello</button>
              </div>
            </div>
          </div>
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