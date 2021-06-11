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

            <h1 class="h3 upp">Iscriviti alla nostra newsletter</h1>
            <p>Per avere informazioni e ricevere sconti speciali sui nostri prodotti.</p>
            <hr class="offset-sm">

            <form action="index.php" method="post">
              <div class="input-group">
                <input type="email" name="email" value="" placeholder="E-mail" required="" class="form-control">
                <span class="input-group-btn">
                  <button type="submit" class="btn btn-primary"> Iscriviti <i class="ion-android-send"></i> </button>
                </span>
              </div><!-- /input-group -->
            </form>
            <hr class="offset-lg">
            <hr class="offset-md">

            <div class="social">
              <a href="#"><i class="ion-social-facebook"></i></a>
              <a href="#"><i class="ion-social-twitter"></i></a>
              <a href="#"><i class="ion-social-instagram-outline"></i></a>
              <a href="#"><i class="ion-social-linkedin-outline"></i></a>
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
              <a href="#" class="list-group-item">Chi Siamo</a>
              <a href="#" class="list-group-item">Termini e Condizioni</a>
              <a href="#" class="list-group-item">Ordini</a>
              <a href="#" class="list-group-item">Spedizioni</a>
            </div>
          </div>  
          <div class="col-sm-3 col-md-2">
            <h1 class="h4">Prodotti <i class="ion-plus-round hidden-sm hidden-md hidden-lg"></i> </h1>

            <div class="list-group">
              <a href="#" class="list-group-item">Disegno</a>
              <a href="#" class="list-group-item">Pittura</a>
              <a href="#" class="list-group-item">Colori</a>
            </div>
          </div>
          <div class="col-sm-3 col-md-2">
          	<h1 class="h4">Supporto <i class="ion-plus-round hidden-sm hidden-md hidden-lg"></i> </h1>

            <div class="list-group">
              <a href="#" class="list-group-item">Resi</a>
              <a href="#" class="list-group-item">FAQ</a>
              <a href="#" class="list-group-item">Contatti</a>
            </div>
          </div>
          <div class="col-sm-3 col-md-2">
            <h1 class="h4">Location</h1>

            <div class="dropdown">
      			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      			    Lingua
      			    <span class="caret"></span>
      			  </button>
      			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
      			    <li><a href="#English"> <img src="assets/img/flags/gb.png" alt="Eng"/> English</a></li>
      			    <li><a href="#Spanish"> <img src="assets/img/flags/es.png" alt="Spa"/> Spanish</a></li>
      			    <li><a href="#Deutch"> <img src="assets/img/flags/de.png" alt="De"/> Deutch</a></li>
      			    <li><a href="#French"> <img src="assets/img/flags/fr.png" alt="Fr"/> French</a></li>
      			  </ul>
      			</div>
      			<hr class="offset-xs">

      			<div class="dropdown">
      			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      			    Valuta
      			    <span class="caret"></span>
      			  </button>
      			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
      			    <li><a href="#Euro"><i class="ion-social-euro"></i> Euro</a></li>
      			    <li><a href="#Dollar"><i class="ion-social-usd"></i> Dollar</a></li>
      			    <li><a href="#Yen"><i class="ion-social-yen"></i> Yen</a></li>
      			    <li><a href="#Bitcoin"><i class="ion-social-bitcoin"></i> Bitcoin</a></li>
      			  </ul>
      			</div>

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
    
    
	<script src="./assets/js/jquery-latest.min.js"></script>
    
    <script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./assets/js/core.js"></script>
    <script type="text/javascript" src="./assets/js/store.js"></script>
    
	<script type="text/javascript" src="./assets/js/custom-scroll/jquery.mCustomScrollbar.concat.min.js"></script>

    <script type="text/javascript" src="./assets/js/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.ui.touch-punch.js"></script>
    
</body>
</html>