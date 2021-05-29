package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class UserDAO {
	
	 static Connection con=null;
	 static ResultSet rs=null;
   public static UserBean doRetrieve(UserBean bean) {
	 
     Statement stmt=null;
     String email=bean.getEmail();
     String password=bean.getPassword();
     
     String searchQuery=  "SELECT * FROM cliente WHERE Email='"
             + email
             + "' AND Password='"
             + password
             + "'";
     //controllo
     System.out.println("Your email is " + email);          
     System.out.println("Your password is " + password);
     System.out.println("Query: "+searchQuery);
     try {  //connessione al db
    	 con= DriverManagerConnectionPool.getConnection();
    	 stmt=con.createStatement();
         rs = stmt.executeQuery(searchQuery); 
         bean.setValid(false); //si presuppone riscontro negativo
             while(rs.next()) {//caso positivo, il rs esiste solo se la query ha avuto esito positivo.
        	 String firstName = rs.getString("Nome");
             String lastName = rs.getString("Cognome");
             System.out.println("Welcome " + firstName);
             bean.setFirstName(firstName);
             bean.setLastName(lastName);
             bean.setValid(true);
         }
        
     }

     
     catch(Exception e) {
    	 System.out.println("Errore: "+e);
     }
     return bean;
     
   }
}
