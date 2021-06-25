/**
 * 
 */
/**
 * 
 */
const regExpMail= /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

function validateSignUpForm(form){
	
	var firstName=form.firstName.value;
	var lastName=form.lastName.value;
	var email=form.email.value;
	var email2=form.email2.value;
	var password=form.password.value;
	var password2=form.password2.value;
	
	if(firstName=="" || firstName==null || firstName.length<3){
		form.firstName.focus();
	    $('#fnameErr').html("Inserire nome valido");
	} else if(lastName=="" || lastName==null || lastName.length<3){
		form.lastName.focus();
	    $('#lnameErr').html("Inserire cognome valido");
	} else if(email==null || email==""){
		form.email.focus();
	    $('#newEmailErr').html("Inserire email");
	} else if(email2==null || email2==""){
		form.email2.focus();
	    $('#newEmailErr2').html("Inserire email di conferma valida");
	} else if(password=="" || password==null || password.length<4){
		form.password.focus();
	    $('#newPasswordErr').html("La password dev'essere più lunga di 4 caratteri");
	} else if(password2=="" || password2==null || password2.length<4){
		form.password2.focus();
	    $('#newPassword2Err').html("La password di conferma dev'essere più lunga di 4 caratteri");
	} else if(!regExpMail.test(email)){
		form.email.focus();
	    $('#newEmailErr').html("Inserire formato valido per l'email");
	} else if(password2!=password){
		form.password.focus();
		form.password2.focus();
	    $('#newPassword2Err').html("Le due password non coincidono");
	} else if(email2!=email){
		form.email.focus();
		form.email2.focus();
	    $('#newEmail2Err').html("Le due email non coincidono");
	}
	if(firstName=="" || firstName==null || firstName.length<3 || lastName=="" || lastName==null || lastName.length<3 || email==null || email==""
	 || email2==null || email2=="" || password=="" || password==null || password.length<4 || password2=="" || password2==null || password2.length<4
     || !regExpMail.test(email) || password2!=password || email2!=email
	) {
		return false;
	}
	else return true;
}

function validateLoginForm(form){ 
	
var email=form.email.value;  
var password=form.password.value;
if (email==null || email=="" || email.length<6){
	form.email.focus();
	$('#emailErr').html("L'email dev'essere più lunga di 6 caratteri");
}else if(password.length<4){
	form.password.focus();
	$('#pwdErr').html("La password dev'essere più lunga di 4 caratteri");
  } else if(!regExpMail.test(email)){
	 form.email.focus();
     $('#emailErr').html("Inserire email valida");
   }
  if(email==null || email=="" || email.length<6 || password.length<4 || !regExpMail.test(email) ) {
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
	      //siamo fuori dal preventdefault e quindi il form viene passato alla servlet dopo il controllo
	      location.reload(); //aggiorna la pagina
          $.ajax({
               type: "POST",
               url:"LoginController",
               data:{"email":email,"password":password},
               success: function (data) {
                  if(data=='True'){
                    //$(location).attr('href','ProductView.jsp');
                  }else{
                      
                  }
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
          var newEmail=$('#newEmail').val();
          var newEmail2=$('#newEmail2').val();
          var newPassword=$('#newPassword').val();
          var newPassword2=$('#newPassword2').val();
          if(validateSignUpForm(this)){
	      location.reload();
          $.ajax({
               type: "POST",
               url:"SignUpController",
               data:{
	           "firstName":firstName, "lastName":lastName, "newEmail":newEmail,"newPassword":newPassword,
               "newEmail2": newEmail2, "newPassword2": newPassword2
               },
               success: function (data) {
                  if(data=='True'){
                    //$(location).attr('href','ProductView.jsp');
                  }else{
                      
                  }
               }
             });
             }                                
           });
         });

         