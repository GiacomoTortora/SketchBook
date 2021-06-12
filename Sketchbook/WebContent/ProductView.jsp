<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./home");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
	
	
%>

<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.ProductBean, model.Cart, model.UserBean"%>
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
                    <a href="./store/" rel="nofollow" class="btn btn-primary btn-lg black"> Scopri di più </a>

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
                    <a href="./store/" rel="nofollow" class="btn btn-primary btn-lg black"> Scopri di più </a>
                    
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
                    <a href="./blog/" rel="nofollow" class="btn btn-primary btn-lg black"> Scopri di più </a>
                      
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
            <div class="bar medium" data-background="assets/img/bars/macbook.jpg">
              <h3 class="title black">MacBook Air</h3>

              <div class="wrapper">
                <div class="content">
                  <hr class="offset-sm">
                  <a href="./store/" rel="nofollow" class="btn btn-default black"> Buy now </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div class="bar small" data-background="assets/img/bars/dellinspirion.jpg">
              <h3 class="title black">Dell Inspirion 7000</h3>

              <div class="wrapper">
                <div class="content">
                  <hr class="offset-sm">
                  <a href="./store/" rel="nofollow" class="btn btn-primary black"> Buy now </a>
                </div>
              </div>
            </div>

            <hr class="offset-xs">
            <hr class="offset-xs">

            <div class="bar small" data-background="assets/img/bars/surfacestudio.jpg">
              <h3 class="title">Surface Studio</h3>
              
              <div class="wrapper">
                <div class="content">
                  <hr class="offset-sm">
                  <a href="./store/" rel="nofollow" class="btn btn-primary black"> Buy now </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-4 no-padding hidden-xs hidden-sm">
            <div class="bar medium" data-background="assets/img/bars/accessories.jpg">
              <h3 class="title black">Accessories</h3>
              
              <div class="wrapper">
                <div class="content">
                  <hr class="offset-sm">
                  <a href="./store/" rel="nofollow" class="btn btn-primary black"> Buy now </a>
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
        <h2 class="h2 upp align-center"> Pennelli </h2>
        <hr class="offset-lg">

        <div class="row">

          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/apple-imac-27-retina.jpg" alt="Apple iMac 27 Retina"/></a>

              <div class="content align-center">
                <p class="price">$2099.99</p>
                <h2 class="h3">iMac 27 Retina</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/microsoft-surface-studio.jpg" alt="Microsoft Surface Studio"/></a>

              <div class="content align-center">
                <p class="price">$3749.99</p>
                <h2 class="h3">Surface Studio</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/dell-inspiron-23.jpg" alt="Dell Inspion 23"/></a>

              <div class="content align-center">
                <p class="price">$1987.99</p>
                <h2 class="h3">Dell Inspion 23</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>


          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/lenovo-ideacenter.jpg" alt="Lenovo IdeaCenter"/></a>

              <div class="content align-center">
                <p class="price">$2487.99</p>
                <h2 class="h3">Lenovo IdeaCenter</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>


        </div>

        <div class="align-right align-center-xs">
          <hr class="offset-sm">
          <a href="./store/"> <h5 class="upp">Scopri di più </h5> </a>
        </div>
      </div>
    </section>

    <section class="products">
      <div class="container">
        <h2 class="h2 upp align-center"> Matite</h2>
        <hr class="offset-lg">

        <div class="row">

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/lenovo-yoga.jpg" alt="Lenovo Yoga 900"/></a>

              <div class="content align-center">
                <p class="price">$1899.99</p>
                <h2 class="h3">Lenovo Yoga 900</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/surface-pro.jpg" alt="Surface Pro"/></a>

              <div class="content align-center">
                <p class="sale">$2099.99</p>
                <p class="price through">$2499.99</p>
                <h2 class="h3">Microsoft Surface Pro</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/hp-spectre-x360.jpg" alt="HP Spectre x360"/></a>

              <div class="content align-center">
                <p class="price">$2994.99</p>
                <h2 class="h3">HP Spectre x360</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product visible-sm">
            <div class="body">
              <a href="./"><img src="assets/img/products/dell-inspiron-2in1.jpg" alt="Dell Inspiron 7000 2-in-1s"/></a>

              <div class="content align-center">
                <p class="price">$1994.99</p>
                <h2 class="h3">Dell Inspiron 7000</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>


        </div>
        <div class="align-right align-center-xs">
          <hr class="offset-sm">
          <a href="./store/"> <h5 class="upp">Scopri di più </h5> </a>
        </div>
      </div>
    </section>


    <section class="products">
      <div class="container">
        <h2 class="h2 upp align-center">Pitture</h2>
        <hr class="offset-lg">

        <div class="row">

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/mi-pad-2.jpg" alt="Xiamomi Mi Pad 2"/></a>

              <div class="content align-center">
                <p class="price">$899.99</p>
                <h2 class="h3">Mi Pad 2</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/ipad-air.jpg" alt="Apple iPad Air"/></a>

              <div class="content align-center">
                <p class="price">$1099.99</p>
                <h2 class="h3">Apple iPad Air</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product">
            <div class="body">
              <a href="./"><img src="assets/img/products/asus-transformer.jpg" alt="Asus Transformer"/></a>

              <div class="content align-center">
                <p class="price">$987.99</p>
                <h2 class="h3">Asus Transformer</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 product visible-sm">
            <div class="body">
              <a href="./"><img src="assets/img/products/ipad-mini.jpg" alt="iPad Mini"/></a>

              <div class="content align-center">
                <p class="price">$399.99</p>
                <h2 class="h3">iPad Mini</h2>
                <hr class="offset-sm">

                <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Add to cart</button>
              </div>
            </div>
          </div>


        </div>
        <div class="align-right align-center-xs">
          <hr class="offset-sm">
          <a href="./store/"> <h5 class="upp">Scopri di più</h5> </a>
        </div>
      </div>
    </section>


    <section class="blog">
      <div class="container">
        <h2 class="h2 upp align-center"> Recensioni </h2>
        <hr class="offset-lg">

        <div class="row">

          <div class="col-sm-6 col-md-6 item">

            <div class="body">
              <a href="assets/img/blog/3.png">
                <img src="assets/img/blog/3.png" title="Apple Devices" alt="Apple Devices">
              </a>

              <div class="caption">
                <h2 class="h3">Ottimo!!!</h2>
                <label> 07.01.2021</label>
                <hr class="offset-sm">

                <p>
                  Davvero ottimi prodotti, di buona qualità e perfetti. Guardate cosa sono riuscito a fare con queste matite!
                </p>
                <hr class="offset-sm">
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-6 item">

            <div class="body">
              <a href="assets/img/blog/2.png">
                <img src="assets/img/blog/2.png" title="Coffee" alt="Coffee">
              </a>

              <div class="caption">
                <h2 class="h3">Che gentilezza!</h2>
                <label> 08.01.2021</label>
                <hr class="offset-sm">

                <p>
                  Gentilissimi e tempi di consegna ottimi. Il disegno è uscito molto bene.
                </p>
                <hr class="offset-sm">
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-6 item">
            <div class="body">
              <a href="assets/img/blog/4.png">
                <img src="assets/img/blog/4.png" title="Coffee" alt="Coffee">
              </a>

              <div class="caption">
                <h2 class="h3">Molto soddisfatto</h2>
                <label> 09.01.2021</label>
                <hr class="offset-sm">

                <p>
                  Imballati in modo ottimo. Allego un piccolo risultato dei loro prodotti.
                </p>
                <hr class="offset-sm">
              </div>
            </div>
          </div>
          
            <div class="col-sm-6 col-md-6 item">
            <div class="body">
              <a href="assets/img/blog/1.png">
                <img src="assets/img/blog/1.png" title="Coffee" alt="Coffee">
              </a>

              <div class="caption">
                <h2 class="h3">Perfetto</h2>
                <label> 10.01.2021</label>
                <hr class="offset-sm">

                <p>
                  Nulla da dire!
                </p>
                <hr class="offset-sm">
              </div>
            </div>
          </div>
          </div>
        </div>
    </section>


	<%@ include file="/fragments/footer.jsp" %>

    <script src="assets/js/jquery-latest.min.js"></script>
    
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/core.js"></script>
    <script type="text/javascript" src="assets/js/store.js"></script>
    <script type="text/javascript" src="assets/js/carousel.js"></script>
    <script type="text/javascript" src="assets/js/jquery.touchSwipe.min.js"></script>

    <script type="text/javascript" src="assets/js/custom-scroll/jquery.mCustomScrollbar.concat.min.js"></script>

    <script type="text/javascript" src="assets/js/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="assets/js/jquery.ui.touch-punch.js"></script>

  </body>
</html>