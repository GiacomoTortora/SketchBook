<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SketchBook</title>
    
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
    <hr class="offset-lg">
    <hr class="offset-sm">
    <footer>
      <div class="about">
        <div class="container">
          <div class="row">
            <hr class="offset-md">

            <div class="col-xs-6 col-sm-3">
              <div class="item">
                <i class="ion-ios-telephone-outline"></i>
                <h1>Assistenza Clienti<br><span>24 su 24</span></h1>
              </div>
            </div>
            <div class="col-xs-6 col-sm-3">
              <div class="item">
                <i class="ion-ios-star-outline"></i>
                <h1>Prezzo Basso <br> <span>garantito</span></h1>
              </div>
            </div>
            <div class="col-xs-6 col-sm-3">
              <div class="item">
                <i class="ion-ios-gear-outline"></i>
                <h1> Garanzia <br> <span>sui prodotti</span></h1>
              </div>
            </div>
            <div class="col-xs-6 col-sm-3">
              <div class="item">
                <i class="ion-ios-loop"></i>
                <h1> Soddisfatto <br> <span>o rimborsato</span> </h1>
              </div>
            </div>

            <hr class="offset-md">
          </div>
        </div>
      </div>

      <div class="subscribe">
        <div class="container align-center">
            <hr class="offset-md">

            <h1 class="h3 upp">Seguici sui nostri social!</h1>
            <p>Per restare sempre aggiornato sui nuovi prodotti.</p>
            <hr class="offset-sm">
            <div class="social">
              <a href="https://www.facebook.com"><i class="ion-social-facebook"></i></a>
              <a href="https://www.twitter.com"><i class="ion-social-twitter"></i></a>
              <a href="https://www.instagram.com"><i class="ion-social-instagram-outline"></i></a>
              <a href="https://www.linkedin.com"><i class="ion-social-linkedin-outline"></i></a>
            </div>


            <hr class="offset-md">
            <hr class="offset-md">
        </div>
      </div>


      <div class="container">
        <hr class="offset-md">

        <div class="row menu">
          <div class="col-sm-3 col-md-2">
            <h1 class="h4">Informazioni <i class="ion-plus-round hidden-sm hidden-md hidden-lg"></i> </h1>

            <div class="list-group">
              <a href="about.jsp" class="list-group-item">Chi Siamo</a>
              <a href="contacts.jsp" class="list-group-item">Contatti</a>
            </div>
          </div>  
          <div class="col-sm-3 col-md-2">
            <h1 class="h4">Prodotti <i class="ion-plus-round hidden-sm hidden-md hidden-lg"></i> </h1>

            <div class="list-group">
              <a href="AllProducts.jsp" class="list-group-item">Tutti i Prodotti</a>
              <a href="ProductCategory?action=read&categoria=1" class="list-group-item">Matite</a>
              <a href="ProductCategory?action=read&categoria=2" class="list-group-item">Pennarelli</a>
              <a href="ProductCategory?action=read&categoria=3" class="list-group-item">Pittura</a>
              <a href="ProductCategory?action=read&categoria=4" class="list-group-item">Pennelli</a>
              <a href="ProductCategory?action=read&categoria=5" class="list-group-item">Fogli</a>
              <a href="ProductCategory?action=read&categoria=6" class="list-group-item">Tele</a>
            </div>
          </div>
          <div class="col-sm-3 col-md-2">
          	<h1 class="h4">Supporto <i class="ion-plus-round hidden-sm hidden-md hidden-lg"></i> </h1>

            <div class="list-group">
              <a href="contacts.jsp" class="list-group-item">Contatti</a>
              <a href="FAQ.jsp" class="list-group-item">FAQ</a>
            </div>
          </div>
          <div class="col-sm-3 col-md-2">

          </div>
          <div class="col-sm-3 col-md-3 col-md-offset-1 align-right hidden-sm hidden-xs">
            <h1 class="h4">SketchBook, Co.</h1>

              <address>
                Via Tal dei Tali,<br>
                Salerno, SA, Italy<br>
                <abbr title="Phone">tel:</abbr> +39 123 456 7890
              </address>

              <address>
                <strong>Supporto</strong><br>
                <a href="mailto:#">assistenza@sketchbook.com</a>
              </address>

          </div>
        </div>
      </div>

      <hr>

      <div class="container">
        <div class="row">
          <div class="col-sm-8 col-md-9 payments">
            <p>Paga nel modo che più ti piace</p>

            <div class="payment-icons">
              <img src="assets/img/payments/paypal.svg" alt="paypal">
              <img src="assets/img/payments/visa.svg" alt="visa">
              <img src="assets/img/payments/master-card.svg" alt="mc">
              <img src="assets/img/payments/discover.svg" alt="discover">
              <img src="assets/img/payments/american-express.svg" alt="ae">
            </div>
            <br>

          </div>
          <div class="col-sm-4 col-md-3 align-right align-center-xs">
            <hr class="offset-sm hidden-sm">
            <hr class="offset-sm">
            <p>SketchBook © 2021 <br> Designed By Tortora Giacomo, Califano Simone, Parisi Raffaele</p>
            <hr class="offset-lg visible-xs">
          </div>
        </div>
      </div>
    </footer>
</body>
</html>