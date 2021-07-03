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
	public static final String TABLE_NAME2 = "utilizzo";
	
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
	
	
	

	public synchronized void doSave(MetodoPagamentoBean metodo_pagamento, UserBean user) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String checkSQL = "SELECT ID_CLIENTE FROM " + MetodoPagamentoDAO.TABLE_NAME1
						   + " JOIN " + MetodoPagamentoDAO.TABLE_NAME2 +
						   " ON ID=ID_PAGAMENTO " +
						   "WHERE #carta = ?,   tipo = ?";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(checkSQL);
			
			preparedStatement.setString(1, metodo_pagamento.getNumCarta());
			preparedStatement.setString(2, metodo_pagamento.getTipo());
			
			ResultSet rs = preparedStatement.executeQuery();
		
			while(rs.next()) {
				if(rs.getInt("id_cliente") == user.getId())
					return;
			}
			

			String insertSQL = "INSERT INTO " + MetodoPagamentoDAO.TABLE_NAME1
				+ " (ID, #CARTA, TIPO) VALUES (?, ?, ?)";
			String insertSQL2 = "INSERT INTO " + MetodoPagamentoDAO.TABLE_NAME2 +
							" (ID_CLIENTE, ID_PAGAMENTO) VALUES (?, ?)";

			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			PreparedStatement preparedStatement2 = connection.prepareStatement(insertSQL2);
			
			preparedStatement.setInt(1, metodo_pagamento.getId());
			preparedStatement.setString(2, metodo_pagamento.getNumCarta());
			preparedStatement.setString(3, metodo_pagamento.getTipo());
			
			preparedStatement2.setInt(1, user.getId());
			preparedStatement2.setInt(2, metodo_pagamento.getId());
			
			preparedStatement.executeUpdate();
			preparedStatement2.executeUpdate();
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

		Collection<MetodoPagamentoBean> metodi = new LinkedList<MetodoPagamentoBean>();
	
		String selectSQL =  "SELECT * FROM ecommerce."+MetodoPagamentoDAO.TABLE_NAME1+
							" JOIN ecommerce."+MetodoPagamentoDAO.TABLE_NAME2+
							" ON ID = ID_Pagamento WHERE "+MetodoPagamentoDAO.TABLE_NAME2+
							".ID_Cliente = ?";
		
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
				
				metodi.add(bean);
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
		return metodi;
	}
		
		public synchronized void doUpdate(MetodoPagamentoBean metodo) throws SQLException {
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
				preparedStatement.setString(1, metodo.getNumCarta());
				preparedStatement.setString(2, metodo.getTipo());
				preparedStatement.setInt(3, metodo.getId());
				
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
}