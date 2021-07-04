<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%@ page import="java.util.*,model.bean.ProductBean, model.Cart, model.bean.UserBean, model.bean.IndirizzoSpedizioneBean, model.bean.MetodoPagamentoBean, model.dao.IndirizzoSpedizioneDAO, model.dao.MetodoPagamentoDAO"%>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Checkout</title>
    
    <link rel="shortcut icon" href="assets/img/favicon.png"/>
</head>
<body>
	<%@ include file="./fragments/header.jsp" %>
	
	<% if(currUser==null && admin==null) response.sendRedirect("401error.jsp"); 
	List<ProductBean> products= cart.getProducts();
	UserBean user;
	if(currUser != null)
		user = currUser;
	else 
		user = admin;
	
	Collection<IndirizzoSpedizioneBean> indirizzi = new IndirizzoSpedizioneDAO().doRetrieveByUser(user,"");
	Collection<MetodoPagamentoBean> pagamenti = new MetodoPagamentoDAO().doRetrieveByUser(user,"");
	
	%>

	<hr class="offset-top">

    <div class="white">
        <div class="container checkout">
            <h1>Checkout</h1>
            <hr class="offset-sm">
        </div>
    </div>
    <hr class="offset-md">

    <div class="container checkout">

        <div class="row">
            <div class="col-md-5" style="padding-right:40px">
                  <div class="row group">
                    <div class="col-sm-4"><h2 class="h4">Nome</h2></div>
                    <div class="col-sm-8"> <input type="text" class="form-control" name="receiver" value="<%=user.getFirstName()%>" placeholder="Mario" /></div>
                  </div>
                  <br>
                  
                  <div class="row group">
                    <div class="col-sm-4"><h2 class="h4">Cognome</h2></div>
                    <div class="col-sm-8"> <input type="text" class="form-control" name="receiver" value="<%=user.getLastName()%>" placeholder="Rossi" /></div>
                  </div>
                  <br>

                  <div class="row group">
                    <div class="col-sm-4"><h2 class="h4">E-mail</h2></div>
                    <div class="col-sm-8"> <input type="email" class="form-control" name="email" value="<%=user.getEmail()%>" placeholder="mariorossi@mail.com" /></div>
                  </div>
                  <br>

                  <br><br>
                  <div class="">
                  	<%
                  		if(indirizzi.size() > 0) {
                  	%>
                    <div class="row group">
                    <div class="col-sm-4"><h2 class="h4">Indirizzo</h2></div>
                    <div class="col-sm-8">
                      <div class="group-select justify" tabindex='1'>
                          <input class="form-control select" id="indirizzo" name="indirizzo" value="Predefinito" required/>

                          <ul class="dropdown">
                          	<%
 
							Iterator<?> it = indirizzi.iterator();
							while (it.hasNext()) {
							IndirizzoSpedizioneBean bean = (IndirizzoSpedizioneBean) it.next();
                          	%>
                          	
                            <li data-value="<%=bean.toString()%>"><%=bean.toString()%></li>
                            <%
                          		}
                            %>
                          </ul>
                          <div class="arrow bold"><i class="ion-chevron-down"></i></div>
                      </div>
                    </div>
                  </div>
                  <%
                  		}else {
                  			
                  %>	
                    	 <a href="Aggiungi-Indirizzo.jsp"><button class="btn btn-primary pull-center btn-sm ">Aggiungi Indirizzo di Spedizione <i class="ion-android-add-circle"></i></button></a>
                    	 <hr class="offset-sm">
                  <%
                  		}
                  %>
                  </div>
                  <br>


                  <div class="">
                  	<%
                  		if(pagamenti.size() > 0) {
                  	%>
                    <div class="row group">
                    <div class="col-sm-4"><h2 class="h4">Pagamento</h2></div>
                    <div class="col-sm-8">
                      <div class="group-select justify" tabindex='1'>
                          <input class="form-control select" id="indirizzo" name="indirizzo" value="Predefinito" required/>

                          <ul class="dropdown">
                          	<%
 
							Iterator<?> it = pagamenti.iterator();
							while (it.hasNext()) {
							MetodoPagamentoBean pagamentoBean = (MetodoPagamentoBean) it.next();
                          	%>
                          	
                            <li data-value="<%=pagamentoBean.toString()%>"><%=pagamentoBean.toString()%></li>
                            <%
                          		}
                            %>
                          </ul>
                          <div class="arrow bold"><i class="ion-chevron-down"></i></div>
                      </div>
                    </div>
                  </div>
                  <%
                  		}else {
                  			
                  %>	
                    	 <a href="Aggiungi-MetodoPagamento.jsp"><button class="btn btn-primary pull-center btn-sm ">Aggiungi Metodo Pagamento <i class="ion-android-add-circle"></i></button></a>
                    	 <hr class="offset-sm">
                  <%
                  		}
                  %>
                  </div>

                  <hr class="offset-lg visible-xs visible-sm">
                  <hr class="offset-lg visible-xs">
            </div>

            <div class="col-md-7 white">
                <hr class="offset-md visible-xs visible-sm">
                <div class="checkout-cart">
                    <div class="content">
                      <% if (products.isEmpty()) {%>
                   <h3 class="align-center"> L'ordine adesso è vuoto </h3>
                   <%} else for(ProductBean prod : products){ %>
                          <div class="media">
                            <div class="media-left">
                              <a href="details?action=read&id=<%=prod.getId()%>">
                                <img class="media-object" src="assets/img/product/<%=prod.getId()%>/1.jpg" alt="<%=prod.getNome()%>"/>
                              </a>
                            </div>
                            <div class="media-body">
                              <h2 class="h4 media-heading"><%=prod.getNome()%></h2>
                           <p class="price">€<%=String.format("%.2f", prod.getPrezzoTot())%></p>
                            </div>
                            
                            <div class="controls">
                                <input type="text" class="form-control input-sm" placeholder="Qty" value="1" readonly>
                          </div>
                        </div>
                         <%
                           }
                         %>
                    </div>
                </div>
                <hr class="offset-md visible-xs visible-sm">
            </div>

            <hr class="offset-lg hidden-xs">
            <div class="col-sm-12 white">
                <hr class="offset-md">
                <div class="row">
                    <div class="col-xs-6 col-md-4">
                        <h3 class="h5 no-margin">Subtotale (IVA ESCLUSA):   €<%=String.format("%.2f", cart.getSubTotale())%></h3>
                        <hr class="offset-md">
                        <h3 class="h4 no-margin">Totale:  €<%=String.format("%.2f", cart.getTotale())%> </h3>
                    </div>
                    <div class="col-md-4 hidden-xs">
                    </div>
                    <div class="col-xs-6 col-md-4">
                    <form action="CheckoutController" method="GET">
                    <%
                  		if(pagamenti.size() > 0) {
                  	%>
                       <button class="btn btn-primary pull-right" type="submit">Conferma Ordine</button>
                    <%
                  		}else{
                    %>
                    	<button class="btn btn-primary pull-right disabled" type="submit">Conferma Ordine</button>
                    	<p class="errormsg">Inserire un metodo di pagamento prima della conferma.</p>
                    <%
                  		}
                    %>
                    </form>
                    </div>
                </div>            
                <hr class="offset-md">
            </div>
           </div>
       </div>

    <hr class="offset-lg">
    <hr class="offset-sm">

	<%@ include file="./fragments/footer.jsp" %> 
</body>
</html>