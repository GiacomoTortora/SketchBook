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

import model.bean.MetodoPagamentoBean;
import model.bean.UserBean;

public class MetodoPagamentoDAO {
	private static DataSource ds;
	public static final String TABLE_NAME1 = "metodo_pagamento";
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
	
	public synchronized Collection<MetodoPagamentoBean> doRetrieveAll(String order) throws SQLException{
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<MetodoPagamentoBean> metodi_pagamento = new LinkedList<MetodoPagamentoBean>();
		
		String selectSQL = "SELECT * FROM " + MetodoPagamentoDAO.TABLE_NAME1;
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				MetodoPagamentoBean bean = new MetodoPagamentoBean();
				
				bean.setId(rs.getInt("id"));
				bean.setNumCarta(rs.getString("#Carta"));
				bean.setTipo(rs.getString("Tipo"));
				bean.setIdCliente(rs.getInt("ID_Cliente"));
				
				metodi_pagamento.add(bean);
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
		return metodi_pagamento;
	}
	
	public synchronized MetodoPagamentoBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		MetodoPagamentoBean bean = new MetodoPagamentoBean();
		String selectSQL = "SELECT * FROM " + MetodoPagamentoDAO.TABLE_NAME1 + " WHERE ID = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setNumCarta(rs.getString("#Carta"));
				bean.setTipo(rs.getString("Tipo"));
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
	
	
	

	public synchronized void doSave(MetodoPagamentoBean metodo_pagamento) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + OrderDAO.TABLE_NAME1
				+ " (ID, #CARTA, TIPO, ID_CLIENTE) VALUES (?, ?, ?, ?)";
		

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setInt(1, metodo_pagamento.getId());
			preparedStatement.setString(2, metodo_pagamento.getNumCarta());
			preparedStatement.setString(3, metodo_pagamento.getTipo());
			preparedStatement.setInt(4, metodo_pagamento.getIdCliente());
			
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
	
	
		public synchronized Collection<MetodoPagamentoBean> doRetrieveByUser(UserBean user, String order) throws SQLException{
	
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<MetodoPagamentoBean> ordini = new LinkedList<MetodoPagamentoBean>();
	
		String selectSQL = "select * " + 
							"FROM " + MetodoPagamentoDAO.TABLE_NAME1 +
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
				MetodoPagamentoBean bean = new MetodoPagamentoBean();
				
				bean.setId(rs.getInt("id"));
				bean.setNumCarta(rs.getString("#Carta"));
				bean.setTipo(rs.getString("Tipo"));
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
		
		public synchronized void doUpdate(MetodoPagamentoBean ordine) throws SQLException {
			Connection connection = null;
			PreparedStatement preparedStatement = null;

			String updateSQL = "UPDATE " + MetodoPagamentoDAO.TABLE_NAME1 + 
								" SET #CARTA = ?, TIPO = ? " +
								"WHERE ID = ?";

			try {
				connection = ds.getConnection();
				connection.setAutoCommit(false);
				preparedStatement = connection.prepareStatement(updateSQL);
				
				preparedStatement = connection.prepareStatement(updateSQL);
				preparedStatement.setString(1, ordine.getNumCarta());
				preparedStatement.setString(2, ordine.getTipo());
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