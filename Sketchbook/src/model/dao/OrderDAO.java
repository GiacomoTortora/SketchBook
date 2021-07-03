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
				bean.setTotale(rs.getDouble("totale"));
				
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
		String selectSQL = "SELECT * FROM " + OrderDAO.TABLE_NAME1 + " WHERE ID = ?";

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
				bean.setTotale(rs.getDouble("totale"));
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

		String deleteSQL = "DELETE FROM " + OrderDAO.TABLE_NAME1 + " WHERE ID = ?";

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
							+ " ID_ORDINE, ID_PRODOTTO, NOMEPRODOTTO, PREZZOPRODOTTO " + 
							"IVAPRODOTTO, DESCRIZIONEPRODOTTO, QUANTITA " +
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
				
				prodotto.setQuantitaCatalogo(prodotto.getQuantitaCatalogo() - prodotto.getQuantitaCarrello());
				new ProductDAO().doUpdate(prodotto);
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
	
		String selectSQL = "select * " + 
							"FROM " + OrderDAO.TABLE_NAME1 +
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
				ProductDAO prodotti = new ProductDAO();
				
				OrderBean bean = new OrderBean();
				bean.setId(rs.getInt("id"));
				
				bean.setProdotti(prodotti.doRetrieveByOrder(bean.getId()));
				bean.setData(rs.getDate("Data"));
				bean.setStato(rs.getString("Stato"));
				bean.setIdCliente(rs.getInt("ID_Cliente"));
				bean.setTotale(rs.getDouble("totale"));
				
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
		
		public synchronized void doUpdate(OrderBean ordine) throws SQLException {
			Connection connection = null;
			PreparedStatement preparedStatement = null;

			String updateSQL = "UPDATE " + OrderDAO.TABLE_NAME1 + 
								" SET DATA = ?, STATO = ? " +
								"WHERE ID = ?";

			try {
				connection = ds.getConnection();
				connection.setAutoCommit(false);
				preparedStatement = connection.prepareStatement(updateSQL);
				
				preparedStatement = connection.prepareStatement(updateSQL);
				preparedStatement.setDate(1, ordine.getData());
				preparedStatement.setString(2, ordine.getStato());
				preparedStatement.setInt(3, ordine.getId());
				
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
		
		public synchronized Collection<OrderBean> doRetrieveByDate(Date data1, Date data2) throws SQLException{
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;

			Collection<OrderBean> ordini = new LinkedList<OrderBean>();
		
			String selectSQL = "select * " + 
								"FROM " + OrderDAO.TABLE_NAME1 +
								" WHERE Data BETWEEN ? AND ?";

			try {
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setDate(1, (java.sql.Date)data1);
				preparedStatement.setDate(2, (java.sql.Date)data2);
				
				ResultSet rs = preparedStatement.executeQuery();
			
				while (rs.next()) {
					
					OrderBean bean = new OrderBean();
					
					bean.setId(rs.getInt("id"));
					bean.setProdotti(new ProductDAO().doRetrieveByOrder(bean.getId()));
					bean.setData(rs.getDate("Data"));
					bean.setStato(rs.getString("Stato"));
					bean.setIdCliente(rs.getInt("ID_Cliente"));
					bean.setTotale(rs.getDouble("totale"));
					
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
}