/**
 * 
 */
/**
 * 
 */
const regExpMail= /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,32}))$/;

const regExpPwd= /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,16}$/;
/*
regExpPwd= accettate lettere minuscole, maiuscole, numeri. Necessita almeno un carattere minuscolo, uno maiuscolo, 
un numero ed un carattere speciale ([#?!@$%^&*-), la pass dev'essere compresa fra 4 e 16 caratteri
*/
const regExpName= /^[a-zA-Z ]{2,32}$/;
//regExpName= accettati solo caratteri minuscoli e maiuscoli dalla A-Z e nome/cognome dev'essere compreso fra 2 e 32 caratteri

const regExpCard=/^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/

const regExpCap=/^\d{5}$/;

const regExpPlace=/^[a-zA-Z ]{2,16}$/;

function validateProduct(form){
	var nome=form.nome.value;
	var descrizione=form.descrizione.value;
	var prezzo=form.prezzo.value;
	var iva=form.iva.value;
	var quantita=form.quantita.value;
	var isValid=true;
	$('#nomeErr').html(""); 
	$('#descrizioneErr').html(""); 
	$('#prezzoErr').html(""); 
	$('#ivaErr').html(""); 
	$('#quantitaErr').html(""); 
	
	if(nome.length<4 || nome.length>64){
		form.nome.focus();
		$('#nomeErr').html("Nome non valido"); 
		isValid=false;
	}
	
	if(descrizione.length<8 || descrizione.length>512){
		form.descrizione.focus();
		$('#descrizioneErr').html("Descrizione non valida"); 
		isValid=false;
	}
	
	if(prezzo<0 || prezzo>1000000){
		form.prezzo.focus();
		$('#prezzoErr').html("Prezzo non valido");
		isValid=false;
	}
	
	if(iva<1 || iva>99){
		form.iva.focus();
		$('#ivaErr').html("Iva non valida"); 
		isValid=false;
	}
	
	if(quantita<1 || quantita>999){
		form.quantita.focus();
		$('#quantitaErr').html("Quantità non valida"); 
		isValid=false;
	}
	
	if( isValid==false ) {
		return false;
	}
	else return true;
}


function validateSignUpForm(form){
	
	var firstName=form.firstName.value;
	var lastName=form.lastName.value;
	var email=form.email.value;
	var email2=form.email2.value;
	var password=form.password.value;
	var password2=form.password2.value;
	var isValid=true;
	$('#fnameErr').html("");     //elimina messaggio di errore quando l'utente clicca submit dopo aver corretto input nel form
	$('#lnameErr').html("");
	$('#newPasswordErr').html("");
	$('#newEmailErr').html("");
    $('#newPassword2Err').html("");
    $('#newEmail2Err').html("");
	
	if(!regExpName.test(firstName)){
		form.firstName.focus();
	    $('#fnameErr').html("Inserire nome valido");
        isValid=false;
	} 
	if(!regExpName.test(lastName)){
		form.lastName.focus();
	    $('#lnameErr').html("Inserire cognome valido");
        isValid=false;
	}
	if(!regExpPwd.test(password)){
		form.password.focus();
	    $('#newPasswordErr').html("Inserire Password valida");
        isValid=false;
	}
	if(!regExpMail.test(email)){
		form.email.focus();
	    $('#newEmailErr').html("Inserire formato valido per l'email");
        isValid=false;
	}
	if(password2!=password){
		form.password2.focus();
	    $('#newPassword2Err').html("Le due password non coincidono");
        isValid=false;
	}
	if(email2!=email){
		form.email2.focus();
	    $('#newEmail2Err').html("Le due email non coincidono");
        isValid=false;
	}
	if( isValid==false ) {
		return false;
	}
	else return true;
}

function validateLoginForm(form){ 
	
var email=form.email.value;  
var password=form.password.value;
var isValid=true;
$('#emailErr').html("");
$('#pwdErr').html("");

if(!regExpPwd.test(password)){
	form.password.focus();
	$('#pwdErr').html("Inserire password valida");
	isValid=false;
  }
if(!regExpMail.test(email)){
	 form.email.focus();
     $('#emailErr').html("Inserire email valida");
     isValid=false;
   }
if(isValid==false) {
	return false;
  }
  else return true;
}

function validateMetodoPagamento(form){
var carta=form.carta.value;
var tipo=form.tipo.value;
var isValid=true;
$('#cartaErr').html("");
$('#tipoErr').html("");
if(!regExpCard.test(carta)){
	form.carta.focus();
	$('#cartaErr').html("Inserire carta valida");
	isValid=false;
  }
if(!regExpName.test(tipo)){
	form.tipo.focus();
	$('#tipoErr').html("inserire tipo valido");
	isValid=false;
 }

 if(isValid==false){
	 return false;
  }
  else return true;
}

function validateIndirizzo(form){ 
	
var via=form.via.value;  
var città=form.citta.value;
var cap=form.cap.value;
var provincia=form.provincia.value;
var stato=form.stato.value;
var isValid=true;
$('#viaErr').html("");
$('#cittaErr').html("");
$('#capErr').html("");
$('#provinciaErr').html("");
$('#statoErr').html("");


if(!regExpPlace.test(via)){
	form.via.focus();
	$('#viaErr').html("Inserire via valida");
	isValid=false;
  }
if(!regExpPlace.test(città)){
	 form.citta.focus();
     $('#cittaErr').html("Inserire città valida");
     isValid=false;
   }

if(!regExpCap.test(cap)){
	 form.cap.focus();
     $('#capErr').html("Inserire cap valido");
     isValid=false;
   }

if(!regExpPlace.test(provincia)){
	 form.provincia.focus();
     $('#provinciaErr').html("Inserire provincia valida");
     isValid=false;
   }

if(!regExpPlace.test(stato)){
	 form.stato.focus();
     $('#statoErr').html("Inserire Stato valido");
     isValid=false;
   }

if(isValid==false) {
	return false;
  }
  else return true;
}

function validateUser(form){
	
	var name=form.name.value;
	var surname=form.surname.value;
	var reMail=form.reMail.value;
	var rePwd=form.rePwd.value;
	var isValid=true;
	$('#nameErr').html("");     //elimina messaggio di errore quando l'utente clicca submit dopo aver corretto input nel form
	$('#surnameErr').html("");
	$('#reMailErr').html("");
    $('#newPwdErr').html("");
	
	if(!regExpName.test(name)){
		form.name.focus();
	    $('#nameErr').html("Inserire nome valido");
        isValid=false;
	} 
	if(!regExpName.test(surname)){
		form.surname.focus();
	    $('#surnameErr').html("Inserire cognome valido");
        isValid=false;
	}
	if(!regExpPwd.test(rePwd)){
		form.rePwd.focus();
	    $('#newPwdErr').html("Inserire Password valida");
        isValid=false;
	}
	if(!regExpMail.test(reMail)){
		form.reMail.focus();
	    $('#ReMailErr').html("Inserire formato valido per l'email");
        isValid=false;
	}
	
	if( isValid==false ) {
		return false;
	}
	else return true;
}


$(document).ready(function(){
       $('#aggiungiProdotto').on('submit',function(e)
       { 
	      e.preventDefault(); //blocca il submit del form
          var nome=$('#nome').val();
          var descrizione=$('#descrizione').val();
          var prezzo=$('#prezzo').val();
          var iva=$('#iva').val();
          var quantita=$('#quantita').val();
          if(validateProduct(this)){
	      //il form è corretto, siamo fuori dal preventdefault e quindi il form viene passato alla servlet dopo il controllo
          $.ajax({
               type: "POST",
               url:"AggiungiProdottoController",
               data:{"nome":nome,"descrizione":descrizione, "prezzo":prezzo, "iva": iva, "quantita": quantita},
               success: function () {
	                location.reload(); //aggiorna la pagina                
               }
             });   
             }                        
           });
         });

$(document).ready(function(){
       $('#modificaProdotto').on('submit',function(e)
       { 
	      e.preventDefault(); //blocca il submit del form
          var nome=$('#nome').val();
          var descrizione=$('#descrizione').val();
          var prezzo=$('#prezzo').val();
          var iva=$('#iva').val();
          var quantita=$('#quantita').val();
          if(validateProduct(this)){
	      //il form è corretto, siamo fuori dal preventdefault e quindi il form viene passato alla servlet dopo il controllo
          $.ajax({
               type: "POST",
               url:"ModProdottoController",
               data:{"nome":nome,"descrizione":descrizione, "prezzo":prezzo, "iva": iva, "quantita": quantita},
               success: function () {
	                location.reload(); //aggiorna la pagina                
               }
             });   
             }                        
           });
         });


$(document).ready(function(){
       $('#aggiungiMetodo').on('submit',function(e)
       { 
	      e.preventDefault(); //blocca il submit del form
          var carta=$('#carta').val();
          var tipo=$('#tipo').val();
          if(validateMetodoPagamento(this)){
	      //il form è corretto, siamo fuori dal preventdefault e quindi il form viene passato alla servlet dopo il controllo
          $.ajax({
               type: "POST",
               url:"AggiungiMetodoController",
               data:{"carta":carta,"tipo":tipo},
               success: function () {
	                location.reload(); //aggiorna la pagina                
               }
             });   
             }                        
           });
         });

$(document).ready(function(){
       $('#modificaMetodoPagamento').on('submit',function(e)
       { 
	      e.preventDefault(); //blocca il submit del form
          var carta=$('#carta').val();
          var tipo=$('#tipo').val();
          if(validateMetodoPagamento(this)){
	      //il form è corretto, siamo fuori dal preventdefault e quindi il form viene passato alla servlet dopo il controllo
          $.ajax({
               type: "POST",
               url:"ModPagamentoController",
               data:{"carta":carta,"tipo":tipo},
               success: function () {
	                location.reload(); //aggiorna la pagina                
               }
             });   
             }                        
           });
         });

$(document).ready(function(){
       $('#modUser').on('submit',function(e)
       {   
	      e.preventDefault();
          var name=$('#name').val();
          var surname=$('#surname').val();
          var reMail=$('#reMail').val();
          var rePwd=$('#rePwd').val();
          /*
          Vengono passati alla servlet solo i due valori di conferma per la password e email in quanto definitivamente corretti
          */
          if(validateUser(this)){
          $.ajax({
               type: "POST",
               url:"ModUserController",
               data:{
	           "name":name, "surname":surname,
               "reMail": reMail, "rePwd": rePwd
               },
               success: function () {
                  location.reload();
                  //$(location).attr('href','ProductView.jsp');   
               }
             });
             }                                
           });
         });



$(document).ready(function(){
       $('#loginFrm').on('submit',function(e)
       { 
	      e.preventDefault(); //blocca il submit del form
          var email=$('#email').val();
          var password=$('#password').val();
          if(validateLoginForm(this)){
	      //il form è corretto, siamo fuori dal preventdefault e quindi il form viene passato alla servlet dopo il controllo
          $.ajax({
               type: "POST",
               url:"LoginController",
               data:{"email":email,"password":password},
               success: function () {
	                location.reload(); //aggiorna la pagina                
               }
             });   
             }                        
           });
         });

$(document).ready(function(){
       $('#signupFrm').on('submit',function(e)
       {   
	      e.preventDefault();
          var firstName=$('#firstName').val();
          var lastName=$('#lastName').val();
          var newEmail2=$('#newEmail2').val();
          var newPassword2=$('#newPassword2').val();
          /*
          Vengono passati alla servlet solo i due valori di conferma per la password e email in quanto definitivamente corretti
          */
          if(validateSignUpForm(this)){
          $.ajax({
               type: "POST",
               url:"SignUpController",
               data:{
	           "firstName":firstName, "lastName":lastName,
               "newEmail2": newEmail2, "newPassword2": newPassword2
               },
               success: function () {
                  location.reload();
                  //$(location).attr('href','ProductView.jsp');   
               }
             });
             }                                
           });
         });

$(document).ready(function(){
       $('#aggiungiIndirizzoFrm').on('submit',function(e)
       { 
	      e.preventDefault(); //blocca il submit del form
          var via=$('#via').val();
          var citta=$('#citta').val();
          var cap=$('#cap').val();
          var provincia=$('#provincia').val();
          var stato=$('#stato').val()
          if(validateIndirizzo(this)){
	      //il form è corretto, siamo fuori dal preventdefault e quindi il form viene passato alla servlet dopo il controllo
          $.ajax({
               type: "POST",
               url:"AggiungiIndirizzoController",
               data:{"via":via,"citta":citta,"cap":cap,"provincia":provincia,"stato":stato},
               success: function () {
	                location.reload(); //aggiorna la pagina                
               }
             });   
             }                        
           });
         });

$(document).ready(function(){
       $('#modificaIndirizzo').on('submit',function(e)
       { 
	      e.preventDefault(); //blocca il submit del form
          var via=$('#via').val();
          var citta=$('#citta').val();
          var cap=$('#cap').val();
          var provincia=$('#provincia').val();
          var stato=$('#stato').val()
          if(validateIndirizzo(this)){
	      //il form è corretto, siamo fuori dal preventdefault e quindi il form viene passato alla servlet dopo il controllo
          $.ajax({
               type: "POST",
               url:"ModIndirizzoController",
               data:{"via":via,"citta":citta,"cap":cap,"provincia":provincia,"stato":stato},
               success: function () {
	                location.reload(); //aggiorna la pagina                
               }
             });   
             }                        
           });
         });
