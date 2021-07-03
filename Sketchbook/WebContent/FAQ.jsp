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
        <div class="container checkout">
            <h1>FAQ</h1>
            <hr class="offset-sm">
        </div>
    </div>
    <hr class="offset-md">

    <div class="container faq">
        <div class="row">
          <div class="col-sm-6">
            <a class="" data-toggle="collapse" href="#question1" role="button" aria-expanded="true" aria-controls="question1">
              <h1 class="h3">Cos'è SketchBook?</h1>
            </a>

            <div class="collapse" id="question1">
              <div class="well">
                <p>
                  SketchBook è un progetto di WebSite, per il corso di Tecnologie Software per il Web, Dipartimento
                  di Informatica, Università di Salerno, tenuto dalla Professoressa Francese Rita.
                </p>
              </div>
            </div>
            <br>
            <!-- //// -->

            <a class="" role="button" data-toggle="collapse" href="#question3" aria-expanded="false" aria-controls="question3">
              <h1 class="h3">Quanto tempo avete impiegato?</h1>
            </a>

            <div class="collapse" id="question3">
              <div class="well">
                <p>
                  Il sito è stato interamente sviluppato in un paio di mesi.
                </p>
              </div>
            </div>
            <br>
            <!-- //// -->

            <a class="" role="button" data-toggle="collapse" href="#question5" aria-expanded="false" aria-controls="question5">
              <h1 class="h3">Il sito è funzionante?</h1>
            </a>

            <div class="collapse" id="question5">
              <div class="well">
                <p>
                  Il sito è pienamente funzionante e utilizza un database MySQL per il recupero dei dati.
                  Utilizza diversi DAO che si interfacciano con il database per numerose operazioni.
                </p>
              </div>
            </div>
            <br>
            <!-- //// -->
          </div>
          <div class="col-sm-6">
            <a class="" role="button" data-toggle="collapse" href="#question2" aria-expanded="true" aria-controls="question2">
              <h1 class="h3">Chi sono gli autori?</h1>
            </a>

            <div class="collapse" id="question2">
              <div class="well">
                <p>
                  Il sito è stato sviluppato da Tortora Giacomo, Califano Simone e Parisi Raffaele,
                  del corso di Laurea in Informatica, Università di Salerno. Il progetto è stato sviluppato nel 2021.
                  Sono stati utilizzati Eclipse e Tomcat Server.
                </p>
              </div>
            </div>
            <br>
            <!-- //// -->

            <a class="" role="button" data-toggle="collapse" href="#question4" aria-expanded="false" aria-controls="question4">
              <h1 class="h3">Il sito è adatto solo per Web Browser PC?</h1>
            </a>

            <div class="collapse" id="question4">
              <div class="well">
                <p>
                  No, il sito è full responsive e compatibile con tutti i Web Browsers più famosi.
                </p>
              </div>
            </div>
            <br>
            <!-- //// -->

            <a class="" role="button" data-toggle="collapse" href="#question6" aria-expanded="false" aria-controls="question6">
              <h1 class="h3">Siete soddisfatti del lavoro ottenuto?</h1>
            </a>

            <div class="collapse" id="question6">
              <div class="well">
                <p>
                  Si, siamo molto soddisfatti del lavoro ottenuto. Abbiamo lavorato in team, partizionato bene i compiti
                  e siamo fieri di dire che abbiamo messo tutti noi stessi in questo sito.
                </p>
              </div>
            </div>
            <br>
            <!-- //// -->
          </div>
        </div>
    </div>

  <%@ include file="/fragments/footer.jsp" %>
    <script type="text/javascript">
      $(document).ready(function(){
        setTimeout(function(){
          $('.container.faq').find('.col-sm-6 > a:nth-child(1)').trigger('click');
        }, 500);
      });
    </script>

  </body>
</html>