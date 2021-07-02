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
          <div class="col-sm-6 hidden-sm hidden-md hidden-lg" style="right:80px">
            <video width="640" height="432" autoplay muted>
  				<source src="assets/img/about/video.mp4" type="video/mp4">
			</video>
          </div>
          <div class="col-sm-6">
            <hr class="offset-lg hidden-xs hidden-sm">
            <hr class="offset-lg hidden-xs hidden-sm">
            <h2 class="featurette-heading">Chi Siamo?</h2>
            <hr class="offset-md">

            <p class="lead">
              Jack, Simone e Raffaele sono tre amici e colleghi di studio all'università che cercano di andare avanti tra gli innumerevoli CFU da sconfiggere.
              Questo sito è il frutto del loro lavoro durante l'esame di Tecnologie Software per il Web tenuto dalla Professoressa Francese Rita.
              <br><br>"Si dai Jack, è carino il disegno"
              <br>-Simone
            </p>
          </div>
          <div class="col-sm-6 hidden-xs">
            <hr class="offset-lg visible-sm">
            <hr class="offset-lg visible-sm">
            <video width="640" height="432" autoplay muted>
  				<source src="assets/img/about/video.mp4" type="video/mp4">
			</video>
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
            <img src="assets/img/about/1.png" alt="SketchBook Art Shop" title="SketchBook Art Shop"/>
          </div>
          <div class="col-sm-6">
            <hr class="offset-lg hidden-xs hidden-sm">
            <hr class="offset-lg hidden-xs hidden-sm">
            <h2 class="featurette-heading">Il nostro negozio</h2>
            <hr class="offset-md">

            <p class="lead">
              Il sito nasce dall'idea di fare qualcosa di diverso dal solito, cavalcando il fatto che a Jack e Simone piace disegnare e se
              ne intendono (poco eh) di questo mondo. 
              <br><br>"Che bello! Abbiamo unito l'utile al dilettevole!"
              <br>-Jack
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
            <img src="assets/img/about/2.png" alt="Sleek and colorful" title="Sleek and colorful"/>
          </div>
          <div class="col-sm-6">
            <hr class="offset-lg hidden-xs hidden-sm">
            <hr class="offset-lg hidden-xs hidden-sm">
            <h2 class="featurette-heading">I nostri prodotti</h2>
            <hr class="offset-md">

            <p class="lead">
             I nostri prodotti sono solo un esempio di cosa può offrire il mercato e abbiamo selezionato una
             gamma di prodotti esemplificativi per questo progetto.
             <br><br>"Secondo me sono troppi"
             <br>-Raffaele
            </p>
          </div>
          <div class="col-sm-6 hidden-xs">
            <hr class="offset-lg visible-sm">
            <img src="assets/img/about/2.png" alt="Sleek and colorful" title="Sleek and colorful"/>
          </div>
        </div>
      </div>

      <hr class="offset-lg">
    </div>
	
	<%@ include file="/fragments/footer.jsp" %>
</body>
</html>