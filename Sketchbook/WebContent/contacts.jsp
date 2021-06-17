<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Contatti </title>
    
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
    
  </head>
  <body>
  <%@ include file="/fragments/header.jsp" %>

	<hr class="offset-top">

    <div class="white">
      <hr class="offset-sm">

      <div class="container">
          <div class="row">
            <div class="col-sm-4">
              <div id="Address">
                <address>
                  <label class="h3">SketchBook, Co.</label><br>
                  Via Tal dei Tali,<br>
                  Salerno, SA, Italy<br>
                  <abbr title="Phone">tel:</abbr> +39 123 456 7890
                </address>

                <address>
                  <strong>Supporto</strong><br>
                  <a href="mailto:#">assistenza@sketchbook.com</a>
                  <br><br>

                  <strong>Informazioni</strong><br>
                  <a href="mailto:#">info@sketchbook.com</a>
                </address>
              </div>
            </div>
            <div class="col-sm-8">
              <div id="GoMap">
              	<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d8558.230218100685!2d14.771571026473268!3d40.678566911299214!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sit!4v1623184333256!5m2!1sen!2sit" width="800" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
              </div>
            </div>
          </div>
      </div>

      <hr class="offset-lg">
    </div>

    <div class="gray">
      <hr class="offset-lg">

      <div class="container align-center">
        <h1 class="upp"> Bisogno di aiuto? </h1>
        <p> Inviaci una domanda dal box qui sotto. </p>
        <hr class="offset-md">

        <div class="row">
          <div class="col-sm-4 col-sm-offset-4">
            <form class="contact" action="index.php" method="post">
              <textarea class="form-control" name="message" placeholder="Messaggio..." required="" rows="5"></textarea>
              <br>

              <input type="email" name="email" value="" placeholder="E-mail" required="" class="form-control" />
              <br>

              <button type="submit" class="btn btn-primary justify"> Invia </button>
            </form>
          </div>
        </div>
      </div>
      <br>
    </div>

  <%@ include file="/fragments/footer.jsp" %>

	<script src="assets/js/jquery-latest.min.js"></script>
    
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/core.js"></script>
    <script type="text/javascript" src="assets/js/store.js"></script>
    <script type="text/javascript" src="assets/js/jquery.touchSwipe.min.js"></script>

    <script type="text/javascript" src="assets/js/custom-scroll/jquery.mCustomScrollbar.concat.min.js"></script>

    <script type="text/javascript" src="assets/js/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="assets/js/jquery.ui.touch-punch.js"></script>

  </body>
</html>