<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%
	ProductBean product = (ProductBean) request.getAttribute("product");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*, model.bean.ProductBean, model.Cart, model.bean.UserBean"%>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <%
    	String name = product.getNome();
    %>
    
    <title><%= name %></title>
    
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/css/carousel-product.css" rel="stylesheet">
    <link href="assets/ionicons-2.0.1/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href='https://fonts.googleapis.com/css?family=Catamaran:400,100,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/custom-scroll/jquery.mCustomScrollbar.css" rel="stylesheet">
</head>

<body>

	<%@ include file="/fragments/header.jsp" %>	
	
    <hr class="offset-lg">
    <hr class="offset-lg">
    <hr class="offset-lg">
    <hr class="offset-lg">

    <section class="product">
      <div class="container">
        <div class="row">
          <div class="col-sm-7 col-md-7 white no-padding">
            <div class="carousel-product" data-count="4" data-current="1">

              <div class="items">
                <button class="btn btn-control" data-direction="right"> <i class="ion-ios-arrow-right"></i></button>
                <button class="btn btn-control" data-direction="left"> <i class="ion-ios-arrow-left"></i></button>


                <div class="item center" data-marker="1">
                  <img src="assets/img/product/<%=product.getId()%>/1.jpg" alt="<%=product.getNome()%>" class="background"/>
                </div>
                
                <div class="item" data-marker="2">
                  <img src="assets/img/product/<%=product.getId()%>/2.jpg" alt="<%=product.getNome()%>" class="background"/>
                </div>

                <div class="item" data-marker="3">
                  <img src="assets/img/product/<%=product.getId()%>/3.jpg" alt="<%=product.getNome()%>" class="background"/>
                </div>

                <div class="item" data-marker="4">
                  <img src="assets/img/product/<%=product.getId()%>/4.jpg" alt="<%=product.getNome()%>" class="background"/>

                  <div class="tiles">
                    <a href="https://www.youtube.com/watch?v=uKxyLmbOc0Q&ab_channel=YugoKanno%28tema%29YugoKanno%28tema%29">
                        <img src="assets/img/product/<%=product.getId()%>/4.jpg" alt="<%=product.getNome()%>">
                        

                      <div class="overlay"></div>
                      <div class="content">
                        <div class="content-outside">
                          <div class="content-inside">
                            <i class="ion-ios-play"></i>
                            <h2 class="white hidden-xs"><br><%=product.getNome()%></h2>
                          </div>
                        </div>
                      </div>
                    </a>
                  </div>
                </div>
              </div>

              <ul class="markers">
                <li data-marker="1" class="active"></li>
                <li data-marker="2"></li>
                <li data-marker="3"></li>
                <li data-marker="4"></li>
              </ul>

            </div>
          </div>
          <div class="col-sm-5 col-md-5 no-padding-xs">
            <div class="caption">
              <img src="assets/img/brands/<%=product.getId()%>.png" alt="<%=product.getNome()%>" class="brand hidden-xs hidden-sm" />

              <h1><%=product.getNome() %></h1>

              <p> &middot; Alta Qualità</p>
              <p> &middot; Prestazioni Eccellenti</p>
              <p> &middot; Materiali di Ottima Fattura</p>
              <hr class="offset-md hidden-sm">
              <hr class="offset-sm visible-sm">
              <hr class="offset-xs visible-sm">

			  <%
              	double price=0.0;
              	price = product.getPrezzoTot();       	
              %>

              <p class="price">€<%= String.format("%.2f", price) %></p>
              <hr class="offset-md">
              <form id= "aggiungiIndirizzo" name="aggiungiIndirizzo" class="join" method="post" onsubmit="return validateSignUpForm(this)">
			      <input type="number" id="quantita" name="quantita" min="1" max="<%=product.getQuantitaCatalogo()%>" value="1">
			  </form>
			  <hr class="offset-sm">
			  <%
			  	if(product.getQuantitaCatalogo() == 0) {
			  %>
			  <h4 class="align-left" style="color:red">Questo articolo è esaurito.</h4>
			  <button class="btn btn-primary rounded disabled"><i class="ion-bag"></i> Aggiungi al carrello</button>
			  <%
			  	}
			  	else {
			  %>
              <a href="CartController?action=addC&id=<%=product.getId() %>"><button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi al carrello</button></a>
              <%
			  	}
              %>
            </div>
          </div>
        </div>
        <hr class="offset-sm hidden-xs">

        <div class="row">
          <div class="col-sm-7 white sm-padding">
            <hr class="offset-sm visible-xs">

            <h2 class="h1">Dettagli Prodotto</h2>
            <br>

            <p style="font-size:150%">
              <%=product.getDescrizione()%>
            </p>
            <br>
              <hr class="offset-lg">
          </div>
          <div class="col-sm-5 no-padding-xs">
            <div class="talk white">
              <h2 class="h3">Hai qualche domanda?</h2>
              <p class="">Mandaci un messaggio su WhatsApp</p>
              <hr class="offset-md">

              <a href="tel:+391234567890" class="btn btn-primary btn-sm"> <i class="ion-social-whatsapp"></i> +39 123 456 7890 </a>
              <hr class="offset-md visible-xs">
            </div>
            <hr class="offset-sm hidden-xs">          
          </div>
        </div>
      </div>
    </section>
    <hr class="offset-lg">

    <section class="products">
      <div class="container">
        <h2 class="upp align-center-xs"> Gli altri hanno acquistato </h2>
        <hr class="offset-lg">

        <div class="row">

          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="details?action=read&id=10"><img src="assets/img/product-home/10.jpg" alt="Derwent 6pz"/></a>

              <div class="content align-center">
                <p class="price">€8.95</p>
                <h2 class="h3">Derwent Matite 6pz</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi</button>
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

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi</button>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-3 product">
            <div class="body">
              <a href="details?action=read&id=15"><img src="assets/img/product-home/ecoline.jpg" alt="Ecoline Brush Pen"/></a>

              <div class="content align-center">
                <p class="price">€14.78</p>
                <h2 class="h3">Ecoline Brush Pen</h2>
                <hr class="offset-sm">

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi</button>
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

                <button class="btn btn-primary btn-sm rounded"> <i class="ion-bag"></i> Aggiungi</button>
             </div>
           </div>
         </div>
       </div>
     </div>

    </section>
	
	<%@ include file="./fragments/footer.jsp" %>	
</body>
</html>