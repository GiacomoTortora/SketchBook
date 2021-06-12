package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class UserDAO {
	
	 static Connection con=null;
	 static ResultSet rs=null;
	 
   public static UserBean doRetrieve(UserBean bean) {
	 
     PreparedStatement preparedStatement=null; //si usa prepared statement per evitare SQL-injection
     try {  //connessione al db
    	 con= DriverManagerConnectionPool.getConnection();
    	 preparedStatement=con.prepareStatement("SELECT * FROM cliente WHERE Email=? AND Password=?");
    	 preparedStatement.setString(1, bean.getEmail());
    	 preparedStatement.setString(2, bean.getPassword());
         rs = preparedStatement.executeQuery();
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
   
   public static boolean isUniqueEmail(UserBean bean) {
	   PreparedStatement preparedStatement=null;
	   try {
		   con= DriverManagerConnectionPool.getConnection();
		   preparedStatement=con.prepareStatement("SELECT Nome FROM cliente WHERE Email=?");
		   preparedStatement.setString(1, bean.getEmail());
		   rs=preparedStatement.executeQuery();
		   if(!rs.first()) {
			   return true;
		   } 
	   } catch(Exception e) {
		   System.out.println("Errore: "+e);
	   }
	   return false;
   }

   public static void doSubmit(UserBean bean) {
	   PreparedStatement preparedStatement=null;
	   try {  
	   con=DriverManagerConnectionPool.getConnection();
	   preparedStatement=con.prepareStatement("INSERT INTO cliente (Nome, Cognome, Email, Password) VALUES (?,?,?,?)");
	   preparedStatement.setString(1, bean.getFirstName());
	   preparedStatement.setString(2, bean.getLastName());
	   preparedStatement.setString(3, bean.getEmail());
	   preparedStatement.setString(4, bean.getPassword());
	   int i=preparedStatement.executeUpdate();
	   con.commit();
	   if(i!=0) {
		   System.out.println("success");
	   } 
	   }  catch(Exception e) {
		   System.out.println("Errore: "+e);
	   } 
   }
}
