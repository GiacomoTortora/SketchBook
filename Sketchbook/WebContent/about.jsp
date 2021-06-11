<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi Siamo</title>
    
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
    
  </head>
<body>
	<%@ include file="/fragments/header.jsp" %>
    <div class="white">
      <hr class="offset-lg">
      <hr class="offset-lg">
      <hr class="offset-lg">
      <hr class="offset-lg hidden-xs hidden-sm">

      <div class="container about">
        <div class="row">
          <div class="col-sm-6 hidden-sm hidden-md hidden-lg">
            <img src="assets/img/about/anytime-mobility.png" alt="Anywhere, anytime mobility" title="Anywhere, anytime mobility"/>
          </div>
          <div class="col-sm-6">
            <hr class="offset-lg hidden-xs hidden-sm">
            <hr class="offset-lg hidden-xs hidden-sm">
            <h2 class="featurette-heading">Chi Siamo?</h2>
            <hr class="offset-md">

            <p class="lead">
              Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla.
            </p>
          </div>
          <div class="col-sm-6 hidden-xs">
            <hr class="offset-lg visible-sm">
            <hr class="offset-lg visible-sm">
            <img src="assets/img/about/anytime-mobility.png" alt="Anywhere, anytime mobility" title="Anywhere, anytime mobility"/>
          </div>
        </div>
      </div>

      <hr class="offset-lg">
      <hr class="offset-lg">
      <hr class="offset-lg hidden-xs">
    </div>
    <hr class="offset-lg">
    <hr class="offset-lg">

    <div class="">
      <hr class="offset-lg hidden-xs">
      <hr class="offset-lg hidden-xs">
      <div class="container about">
        <div class="row">
          <div class="col-sm-6">
            <hr class="offset-lg visible-sm">
            <img src="assets/img/about/new-entertainment.png" alt="Anywhere, anytime mobility" title="Anywhere, anytime mobility"/>
          </div>
          <div class="col-sm-6">
            <hr class="offset-lg hidden-xs hidden-sm">
            <hr class="offset-lg hidden-xs hidden-sm">
            <h2 class="featurette-heading">Il nostro negozio</h2>
            <hr class="offset-md">

            <p class="lead">
              Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla.
            </p>
          </div>
        </div>
      </div>
      <hr class="offset-lg">
      <hr class="offset-lg">
    </div>



    <hr class="offset-lg hidden-xs">
    <hr class="offset-lg hidden-xs">
    <hr class="offset-lg hidden-xs">
    <div class="white">
      <hr class="offset-lg hidden-xs">
      <hr class="offset-lg hidden-xs">
      <hr class="offset-lg">

      <div class="container about">
        <div class="row">
          <div class="col-sm-6 hidden-sm hidden-md hidden-lg">
            <img src="assets/img/about/sleek-and-colorful.png" alt="Sleek and colorful" title="Sleek and colorful"/>
          </div>
          <div class="col-sm-6">
            <hr class="offset-lg hidden-xs hidden-sm">
            <hr class="offset-lg hidden-xs hidden-sm">
            <h2 class="featurette-heading">I nostri prodotti</h2>
            <hr class="offset-md">

            <p class="lead">
             Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla.
            </p>
          </div>
          <div class="col-sm-6 hidden-xs">
            <hr class="offset-lg visible-sm">
            <img src="assets/img/about/sleek-and-colorful.png" alt="Sleek and colorful" title="Sleek and colorful"/>
          </div>
        </div>
      </div>

      <hr class="offset-lg">
      <hr class="offset-lg hidden-xs">
      <hr class="offset-lg hidden-xs">
    </div>
    <hr class="offset-lg hidden-xs">
    <hr class="offset-lg">

    <div class="container align-center">
      <h1 class="upp"> Contattaci </h1>
      <p> Inviaci una domanda dal box qui sotto. </p>
      <hr class="offset-md">
      
      <div class="row">
        <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
          <form class="contact" action="index.php" method="post">
            <textarea class="form-control" name="message" placeholder="Messaggio..." required="" rows="5"></textarea>
            <br>

            <input type="email" name="email" value="" placeholder="E-mail" required="" class="form-control" />
            <br>

            <button type="submit" class="btn btn-primary justify"> Invia </button>
          </form>
        </div>
      </div>
      <br>
    </div>
	
	<%@ include file="/fragments/footer.jsp" %>
	
    <script src="assets/js/jquery-latest.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/core.js"></script>
    <script src="assets/js/store.js"></script>
    <script type="text/javascript" src="assets/js/custom-scroll/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="assets/js/jquery.ui.touch-punch.js"></script>
</body>
</html>