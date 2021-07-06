package model.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

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
				bean.setData(rs.getDate("Data").toLocalDate());
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
				bean.setData(rs.getDate("Data").toLocalDate());
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
				bean.setData(rs.getDate("Data").toLocalDate());
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
				preparedStatement.setDate(1, java.sql.Date.valueOf(ordine.getData()));
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
					bean.setData(rs.getDate("Data").toLocalDate());
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
		
		public synchronized Collection<OrderBean> doRetrieveByName(String nome, String cognome) throws SQLException{
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;

			Collection<OrderBean> ordini = new LinkedList<OrderBean>();
		
			String selectSQL = "select ordine.id from ordine join cliente on id_cliente = cliente.id where name = ? and cognome = ?";
								

			try {
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setString(1, nome);
				preparedStatement.setString(2, cognome);
				
				ResultSet rs = preparedStatement.executeQuery();
			
				while (rs.next()) {
					
					OrderBean bean = new OrderBean();
					
					bean.setId(rs.getInt("id"));
					bean.setProdotti(new ProductDAO().doRetrieveByOrder(bean.getId()));
					bean.setData(rs.getDate("Data").toLocalDate());
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
		
		public synchronized void doSave(OrderBean ordine) throws SQLException {
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;


			String insertSQL = "INSERT INTO " + OrderDAO.TABLE_NAME1
					+ " (DATA, STATO, ID_CLIENTE, TOTALE) VALUES (?, ?, ?, ?)";
			
			String insertSQL2 = "INSERT INTO DETTAGLI_ORDINE (ID_ORDINE, ID_PRODOTTO, NOMEPRODOTTO, PREZZOPRODOTTO," + 
								" IVAPRODOTTO, DESCRIZIONEPRODOTTO, QUANTITA) "
								+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			try {
				connection = ds.getConnection();
				connection.setAutoCommit(false);
				preparedStatement = connection.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
				
				preparedStatement.setDate(1, java.sql.Date.valueOf(ordine.getData()));
				preparedStatement.setString(2, ordine.getStato());
				preparedStatement.setInt(3, ordine.getIdCliente());
				preparedStatement.setDouble(4, ordine.getTotale());
				preparedStatement.executeUpdate();
				
				
				
				ResultSet rs = preparedStatement.getGeneratedKeys();
				
				
				int id=0;
				if(rs.next()) {
					id = (rs.getInt(1));
				}
				
				
				
				List<ProductBean> prodotti = ordine.getProdotti();
				preparedStatement.close();
				preparedStatement = connection.prepareStatement(insertSQL2);
				
				for(int i = 0; i < prodotti.size(); ++i) {
					ProductBean prodotto = prodotti.get(i);
					
					
					preparedStatement.setInt(1, id);
					preparedStatement.setInt(2, prodotto.getId());
					preparedStatement.setString(3, prodotto.getNome());
					preparedStatement.setDouble(4, prodotto.getPrezzo());
					preparedStatement.setDouble(5, prodotto.getIva());
					preparedStatement.setString(6, prodotto.getDescrizione());
					preparedStatement.setInt(7, prodotto.getQuantitaCarrello());
					preparedStatement.executeUpdate();
					prodotto.setQuantitaCatalogo(prodotto.getQuantitaCatalogo() - prodotto.getQuantitaCarrello());
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
}