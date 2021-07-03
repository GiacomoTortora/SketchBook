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
		form.password.focus();
		form.password2.focus();
	    $('#newPassword2Err').html("Le due password non coincidono");
        isValid=false;
	}
	if(email2!=email){
		form.email.focus();
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

