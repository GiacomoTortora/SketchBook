package model.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.bean.OrderBean;
import model.bean.ProductBean;
import model.bean.UserBean;

public class OrderDAO {
	private static DataSource ds;
	public static final String TABLE_NAME1 = "ordine";
	public static final String TABLE_NAME2 = "dettagli_ordine";
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/ecommerce");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		  }
	}
	
	public synchronized Collection<OrderBean> doRetrieveAll(String order) throws SQLException{
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrderBean> ordini = new LinkedList<OrderBean>();
		ProductDAO prodotti = new ProductDAO();
		
		String selectSQL = "SELECT * FROM " + OrderDAO.TABLE_NAME1;
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrderBean bean = new OrderBean();
				
				bean.setId(rs.getInt("id"));
				bean.setProdotti(prodotti.doRetrieveByOrder(bean.getId()));
				bean.setData(rs.getDate("Data"));
				bean.setStato(rs.getString("Stato"));
				bean.setIdCliente(rs.getInt("ID_Cliente"));
				bean.aggiornaTotale();
				
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
	
	public synchronized OrderBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		OrderBean bean = new OrderBean();
		ProductDAO prodotti = new ProductDAO();
		
		String selectSQL = "SELECT * FROM " + OrderDAO.TABLE_NAME1 + " WHERE CODE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setProdotti(prodotti.doRetrieveByOrder(bean.getId()));
				bean.setData(rs.getDate("Data"));
				bean.setStato(rs.getString("Stato"));
				bean.setIdCliente(rs.getInt("ID_Cliente"));
				bean.aggiornaTotale();
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

		String deleteSQL = "DELETE FROM " + OrderDAO.TABLE_NAME1 + " WHERE CODE = ?";

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
	
	
	

	public synchronized void doSave(OrderBean ordine) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + OrderDAO.TABLE_NAME1
				+ " (ID, DATA, STATO, ID_CLIENTE) VALUES (?, ?, ?, ?)";
		
		String insertSQL2 = "INSERT INTO " + OrderDAO.TABLE_NAME2 
							+ "ID_ORDINE, ID_PRODOTTO, NOMEPRODOTTO, PREZZOPRODOTTO " + 
							"IVAPRODOTTO, DESCRIZIONEPRODOTTO, QUANTITà" +
							"VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setInt(1, ordine.getId());
			preparedStatement.setDate(2, ordine.getData());
			preparedStatement.setString(3, ordine.getStato());
			preparedStatement.setInt(4, ordine.getIdCliente());
			
			preparedStatement.executeUpdate();
			
			List<ProductBean> prodotti = ordine.getProdotti();
			
			for(int i = 0; i < prodotti.size(); ++i) {
				ProductBean prodotto = prodotti.get(i);
				preparedStatement = connection.prepareStatement(insertSQL2);
				
				preparedStatement.setInt(1, ordine.getId());
				preparedStatement.setInt(2, prodotto.getId());
				preparedStatement.setString(3, prodotto.getNome());
				preparedStatement.setDouble(4, prodotto.getPrezzo());
				preparedStatement.setDouble(5, prodotto.getIva());
				preparedStatement.setString(6, prodotto.getDescrizione());
				preparedStatement.setInt(7, prodotto.getQuantitaCarrello());
				
				preparedStatement.executeUpdate();
				
				String update = "UPDATE prodotto SET quantità = quantità -" + prodotto.getQuantitaCarrello() +
								 "WHERE ID = " + prodotto.getId();
				
				preparedStatement = connection.prepareStatement(update);
				preparedStatement.executeUpdate();
			}
						
			

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
	
	
		public synchronized Collection<OrderBean> doRetrieveByUser(UserBean user, String order) throws SQLException{
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrderBean> ordini = new LinkedList<OrderBean>();
		ProductDAO prodotti = new ProductDAO();
		
		String selectSQL = "Select *" + 
							"FROM " + OrderDAO.TABLE_NAME1 +
							"JOIN cliente ON cliente.ID = ID_CLIENTE" +
							"WHERE cliente.ID = ?";
							
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, user.getId());
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrderBean bean = new OrderBean();
				
				bean.setId(rs.getInt("id"));
				bean.setProdotti(prodotti.doRetrieveByOrder(bean.getId()));
				bean.setData(rs.getDate("Data"));
				bean.setStato(rs.getString("Stato"));
				bean.setIdCliente(rs.getInt("ID_Cliente"));
				bean.aggiornaTotale();
				
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
	

	/* public static OrderBean doRetrieve(UserBean user) {
		 PreparedStatement preparedStatement=null;
		 OrderBean bean=new OrderBean();
		 try {
	     System.out.println(user.getFirstName());
	     System.out.println(user.getId());
		 con=DriverManagerConnectionPool.getConnection();
		 preparedStatement=con.prepareStatement("SELECT ID_Cliente, NomeProdotto, PrezzoProdotto, Sconto,"
		 		+ "Data, Stato FROM ordine JOIN dettagli_ordine ON ordine.ID=dettagli_ordine.ID_Ordine WHERE ID_Cliente=?");
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
		 
	 }*/
}
