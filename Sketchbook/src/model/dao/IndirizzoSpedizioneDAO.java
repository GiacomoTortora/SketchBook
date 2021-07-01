package model.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.bean.IndirizzoSpedizioneBean;
import model.bean.UserBean;

public class IndirizzoSpedizioneDAO {
	private static DataSource ds;
	public static final String TABLE_NAME1 = "indirizzo";
	public static final String TABLE_NAME2 = "cliente";
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/ecommerce");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		  }
	}
	
	public synchronized Collection<IndirizzoSpedizioneBean> doRetrieveAll(String order) throws SQLException{
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<IndirizzoSpedizioneBean> indirizzi = new LinkedList<IndirizzoSpedizioneBean>();
		
		String selectSQL = "SELECT * FROM " + IndirizzoSpedizioneDAO.TABLE_NAME1;
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				IndirizzoSpedizioneBean bean = new IndirizzoSpedizioneBean();
				
				bean.setId(rs.getInt("id"));
				bean.setVia(rs.getString("Via"));
				bean.setCitta(rs.getString("Citta"));
				bean.setCAP(rs.getString("CAP"));
				bean.setProvincia(rs.getString("Provincia"));
				bean.setStato(rs.getString("Stato"));
				bean.setIdCliente(rs.getInt("ID_Cliente"));
				
				indirizzi.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return indirizzi;
	}
	
	public synchronized IndirizzoSpedizioneBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		IndirizzoSpedizioneBean bean = new IndirizzoSpedizioneBean();
		String selectSQL = "SELECT * FROM " + IndirizzoSpedizioneDAO.TABLE_NAME1 + " WHERE ID = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setVia(rs.getString("Via"));
				bean.setCitta(rs.getString("Citta"));
				bean.setCAP(rs.getString("CAP"));
				bean.setProvincia(rs.getString("Provincia"));
				bean.setStato(rs.getString("Stato"));
				bean.setIdCliente(rs.getInt("ID_Cliente"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}
	
	
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + MetodoPagamentoDAO.TABLE_NAME1 + " WHERE ID = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}
	
	
	

	public synchronized void doSave(IndirizzoSpedizioneBean indirizzo) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + IndirizzoSpedizioneDAO.TABLE_NAME1
				+ " (ID, VIA, CITTA, CAP, PROVINCIA, STATO, ID_CLIENTE) VALUES (?, ?, ?, ?, ?, ?, ?)";
		

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setInt(1, indirizzo.getId());
			preparedStatement.setString(2, indirizzo.getVia());
			preparedStatement.setString(3, indirizzo.getCitta());
			preparedStatement.setString(4, indirizzo.getCAP());
			preparedStatement.setString(5, indirizzo.getProvincia());
			preparedStatement.setString(6, indirizzo.getStato());
			preparedStatement.setInt(7, indirizzo.getIdCliente());
			
			preparedStatement.executeUpdate();
				
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	
		public synchronized Collection<IndirizzoSpedizioneBean> doRetrieveByUser(UserBean user, String order) throws SQLException{
	
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<IndirizzoSpedizioneBean> ordini = new LinkedList<IndirizzoSpedizioneBean>();
	
		String selectSQL = "select * " + 
							"FROM " + IndirizzoSpedizioneDAO.TABLE_NAME1 +
							" JOIN cliente ON cliente.ID = ID_CLIENTE" +
							" WHERE cliente.ID = ?";
				
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, user.getId());
			
			ResultSet rs = preparedStatement.executeQuery();
		
			while (rs.next()) {				
				IndirizzoSpedizioneBean bean = new IndirizzoSpedizioneBean();
				
				bean.setId(rs.getInt("id"));
				bean.setVia(rs.getString("Via"));
				bean.setCitta(rs.getString("Citta"));
				bean.setCAP(rs.getString("CAP"));
				bean.setProvincia(rs.getString("Provincia"));
				bean.setStato(rs.getString("Stato"));
				bean.setIdCliente(rs.getInt("ID_Cliente"));
				
				ordini.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return ordini;
	}
		
		public synchronized void doUpdate(IndirizzoSpedizioneBean indirizzo) throws SQLException {
			Connection connection = null;
			PreparedStatement preparedStatement = null;

			String updateSQL = "UPDATE " + IndirizzoSpedizioneDAO.TABLE_NAME1 + 
								" SET VIA = ?, CITTA = ?, CAP = ?, PROVINCIA = ?, STATO = ?" +
								"WHERE ID = ?";

			try {
				connection = ds.getConnection();
				connection.setAutoCommit(false);
				preparedStatement = connection.prepareStatement(updateSQL);
				
				preparedStatement = connection.prepareStatement(updateSQL);
				preparedStatement.setString(1, indirizzo.getVia());
				preparedStatement.setString(2, indirizzo.getCitta());
				preparedStatement.setString(3, indirizzo.getCAP());
				preparedStatement.setString(4, indirizzo.getProvincia());
				preparedStatement.setString(5, indirizzo.getStato());
				preparedStatement.setInt(6, indirizzo.getId());
				
				preparedStatement.executeUpdate();

				connection.commit();
			} finally {
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
			}
		}
	

	/*public static synchronized ArrayList<OrderBean> doRetrieveByUser2(UserBean user) {
		 PreparedStatement preparedStatement=null;
		 OrderBean order=new OrderBean();
		 ArrayList<OrderBean> orders=new ArrayList<OrderBean>();
		 Connection connection=null;
		 ResultSet rs=null;
		 try {
		 connection=ds.getConnection();
	     System.out.println(user.getFirstName());
	     System.out.println(user.getId());
		 preparedStatement=connection.prepareStatement("SELECT ordine.ID_Cliente, dettagli_ordine.NomeProdotto, dettagli_ordine.PrezzoProdotto,"
		 		+ "ordine.Data, ordine.Stato "
		 		+ "FROM ordine INNER JOIN dettagli_ordine ON ordine.ID=dettagli_ordine.ID_Ordine WHERE ordine.ID_Cliente=?");
		 preparedStatement.setInt(1, user.getId());
		 rs=preparedStatement.executeQuery();
		 while(rs.next()) {
	        ProductBean product=new ProductBean();
			int id=rs.getInt(1);
			order.setIdCliente(id);
			String nome=rs.getString(2);
			product.setNome(nome);
			Double prezzo=rs.getDouble(3);
			product.setPrezzo(prezzo);
			Date data=rs.getDate(4);
			order.setData(data);
			String stato=rs.getString(5);
			order.setStato(stato);
			System.out.println("nome prodotto: "+nome);
			order.addProduct(product);
		 }
		 
         
		 } catch(Exception e) {
			 System.out.println("Errore: "+e);
		 }
		return orders;
		 
	 }*/
}