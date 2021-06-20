package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDAO {
	 static Connection con=null;
	 static ResultSet rs=null;
	 
	 public static OrderBean doRetrieve(UserBean user) {
		 PreparedStatement preparedStatement=null;
		 OrderBean bean=new OrderBean();
		 try {
	     System.out.println(user.getFirstName());
	     System.out.println(user.getId());
		 con=DriverManagerConnectionPool.getConnection();
		 preparedStatement=con.prepareStatement("SELECT ordine.ID_Cliente, dettagli_ordine.NomeProdotto, dettagli_ordine.PrezzoProdotto, dettagli_ordine.Sconto,"
		 		+ "ordine.Data, ordine.Stato FROM ordine INNER JOIN dettagli_ordine ON ordine.ID=dettagli_ordine.ID_Ordine WHERE ordine.ID_Cliente=?");
		 preparedStatement.setInt(1, user.getId());
		 rs=preparedStatement.executeQuery();
		 while(rs.next()) {
			int id=rs.getInt(1);
			bean.setId(id);
			String nome=rs.getString(2);
			bean.setNome(nome);
			Double prezzo=rs.getDouble(3);
			bean.setPrezzo(prezzo);
		    Double sconto=rs.getDouble(4);
		    bean.setSconto(sconto);
			Date data=rs.getDate(5);
			bean.setData(data);
			String stato=rs.getString(6);
			bean.setStato(stato);
			System.out.println("nome prodotto: "+nome);
		 }
		 
		 } catch(Exception e) {
			 System.out.println("Errore: "+e);
		 }
		return bean;
		 
	 }
}
