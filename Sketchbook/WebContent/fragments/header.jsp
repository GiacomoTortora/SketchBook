<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="model.bean.UserBean"
    %>
    
<% 
 UserBean currUser=new UserBean();
 
 UserBean admin=new UserBean();

 currUser= (UserBean) session.getAttribute("currentSessionUser");
 
 admin=(UserBean) session.getAttribute("adminSession");
 
%>


    
<!DOCTYPE html>
<html lang="en">

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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/js/loginajax.js"> </script>
    <script type="text/javascript" src="assets/js/autocomplete.js"> </script>
    
</head>



<body>

    <div class="toplinks">
     <%
      if (currUser==null && admin==null) {
     %>
      <a href="#signin" data-toggle="modal" data-target="#Modal-Registration"> <i class="ion-person"></i> Registrati</a>
      <a href="#signin" data-toggle="modal" data-target="#Modal-SignIn"> <i class="ion-unlocked"></i> Login</a>
     <%
      }
      else if(currUser!=null && admin==null) {
     %>
      <a href="LogoutController"><i class="ion-log-out"></i> Logout</a>
      <a href="preferiti.jsp"> <i class="ion-ios-heart"></i> Preferiti </a>
      <a href="registeredUser.jsp"><i class="ion-person"></i> Salve, <%= currUser.getFirstName() %> </a>
       <%
      }
     else if(currUser==null && admin!=null) {
     %>
      <a href="LogoutController"><i class="ion-log-out"></i> Logout</a>
      <a href="protected.jsp"><i class="ion-wrench"></i> Benvenuto, Admin <%=admin.getFirstName() %></a>
      
       <%
     }
       %>
      <a href="#" class="hidden-xs"> <i class="ion-android-call"></i> +39 123 456 7890 </a>
    </div>
    
    <nav class="navbar navbar-default">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"
            		style="z-index: 2">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="home" style="font-weight:bold; font-size:30px"> SketchBook </a>
            <a class="navbar-brand pull-right hidden-sm hidden-md hidden-lg hidden-xs" href="Cart.jsp"> <i class="ion-bag"></i></a>
          </div>

          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="./"><i class="ion-android-home"></i> Home</a></li>
              <li class="dropdown">
                <a href="./store/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  <i class="ion-pricetag"></i> Prodotti <i class="ion-android-arrow-dropdown"></i>
                </a>
                <ul class="dropdown-menu">
                  <li><a href="AllProducts.jsp">Tutti i Prodotti</a></li>
                  <li><a href="ProductCategory?action=read&categoria=1">Matite</a></li>
                  <li><a href="ProductCategory?action=read&categoria=2">Pennarelli</a></li>
                  <li><a href="ProductCategory?action=read&categoria=3">Pittura</a></li>
                  <li><a href="ProductCategory?action=read&categoria=4">Pennelli</a></li>
                  <li><a href="ProductCategory?action=read&categoria=5">Fogli</a></li>
                  <li><a href="ProductCategory?action=read&categoria=6">Tele</a></li>
                </ul>
              </li>
              <li><a href="Cart.jsp"><i class="ion-ios-cart"></i> Carrello</a></li>
              <li><a href="about.jsp"><i class="ion-help"></i> Chi Siamo</a></li>
            </ul>
          </div>
         <form action="FoundProdController">
          <div class="search" data-style="hidden">
            <div class="input">
              <button type="button"><i class="ion-ios-search"></i></button>
              <input id="searchInput" type="text" name="search" value="" placeholder="Cerca..."/>
            </div>
          </div>
         </form>
        </div>
    </nav>
    
    <div class="modal fade" id="Modal-SignIn" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="ion-android-close"></i></span></button>
          </div>
          <div class="modal-body">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                  <h2 class="modal-title text-center">Login</h2>
                  <br>
                  

                  <form id="loginFrm" name="loginFrm" class="signin" method="post" onsubmit="return validateLoginForm(this)">
                    <input id="email" type="email" name="email" value="" placeholder="E-mail" required="" class="form-control"/>
                    <p class="errormsg" id="emailErr" name="emailErr"></p>
                    <br>
                    <input id="password" type="password" name="password" value="" placeholder="Password" required="" class="form-control" />
                    <p class="errormsg" id="pwdErr" name="pwdErr"></p>
                    <br>

                    <button type="submit" class="btn btn-primary">Login</button>
                    <a href="#forgin-password" data-action="Forgot-Password">Recupera password ></a>
                  </form>
                  <br>

                  <div class="social-login">
                      <div class="or"><p>OPPURE</p></div>
                      <a href="#"><i class="icon" data-src="assets/img/icons/facebook.svg"></i></a>
                      <p>via</p>
                      <a href="#"><i class="icon" data-src="assets/img/icons/google-plus.svg"></i></a>
                  </div>
                  <br><br>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>
    
    <div class="modal fade" id="Modal-Registration" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="ion-android-close"></i></span></button>
          </div>
          <div class="modal-body">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                  <h2 class="modal-title text-center">Registrati</h2>
                  <br>
                <form id= "signupFrm" name="signupFrm" class="join" method="post" onsubmit="return validateSignUpForm(this)">
        
                  	<h5>Nome (max 32 caratteri)</h5>
                    <input id="firstName" type="text" name="firstName" value="" placeholder="Il nome contiene solo lettere" required="" class="form-control" />
                    <p class="errormsg" id="fnameErr" name="fnameErr"></p>
                    
                    <h5>Cognome (max 32 caratteri)</h5>
                    <input id="lastName" type="text" name="lastName" value="" placeholder="Il cognome contiene solo lettere" required="" class="form-control" />
                    <p class="errormsg" id="lnameErr" name="lnameErr"></p>
                    
					<h5>Email</h5>
                    <input id="newEmail" type="email" name="email" value="" placeholder="Inserire email corretta" required="" class="form-control" />
                    <p class="errormsg" id="newEmailErr" name="newEmailErr"></p>
                    
                    <h5>Conferma Email</h5>
                     <input id="newEmail2" type="email" name="email2" value="" placeholder="Ripeti E-mail" required="" class="form-control" />
                     <p class="errormsg" id="newEmail2Err" name="newEmail2Err"></p>
                    
					<h5>Password (4-16 caratteri)</h5>
                    <input id="newPassword" type="password" name="password" value="" placeholder="1 minuscola,1 maiuscola,1 speciale" required="" class="form-control" />
                    <p class="errormsg" id="newPasswordErr" name="newPasswordErr"></p>
                    
					<h5>Conferma Password</h5>
                    <input id="newPassword2" type="text" name="password2" value="" placeholder="Ripeti Password" required="" class="form-control" />
                    <p class="errormsg" id="newPassword2Err" name="newPassword2Err"></p>

                    <button id="signupBtn" type="submit" class="btn btn-primary btn-sm">Registrati</button> &nbsp;&nbsp;
                    <a href="#">Termini e condizioni ></a>

                    <br><br>
                    <p>
                      Creando un account potrai fare shopping più velocemente, controllare i tuoi ordini, e restare aggiornato sulle novità.
                    </p>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="Modal-ForgotPassword" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="ion-android-close"></i></span></button>
          </div>
          <div class="modal-body">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6">
                  <h4 class="modal-title">Hai dimenticato la tua password?</h4>
                  <br>

                  <form class="join" action="index.php" method="post">
                    <input type="email" name="email" value="" placeholder="E-mail" required="" class="form-control" />
                    <br>

                    <button type="submit" class="btn btn-primary btn-sm">Continua</button>
                    <a href="#Sign-In" data-action="Sign-In">Indietro ></a>
                  </form>
                </div>
                <div class="col-sm-6">
                  <br><br>
                  <p>
                    Inserisci la e-mail associata al tuo account. Fai click su continua per ricevere la tua password via mail.
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>
    
  
    <div class="modal fade" id="Modal-Gallery" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="ion-android-close"></i></span></button>
          </div>
          <div class="modal-body">
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>
    
    
    <script src="./assets/js/jquery-latest.min.js"></script>
    
    <script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./assets/js/core.js"></script>
    <script type="text/javascript" src="./assets/js/store.js"></script>
    
	<script type="text/javascript" src="./assets/js/custom-scroll/jquery.mCustomScrollbar.concat.min.js"></script>

    <script type="text/javascript" src="./assets/js/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.ui.touch-punch.js"></script>
    
    </body>
</html>