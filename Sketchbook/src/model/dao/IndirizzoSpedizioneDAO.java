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
	public static final String TABLE_NAME2 = "locazione";
	
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

		String deleteSQL = "DELETE FROM " + IndirizzoSpedizioneDAO.TABLE_NAME1 + " WHERE ID = ?";

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
	
	
	

	public synchronized void doSave(IndirizzoSpedizioneBean indirizzo, UserBean user) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String checkSQL = "SELECT ID_CLIENTE FROM " + IndirizzoSpedizioneDAO.TABLE_NAME1
							+ " JOIN " + IndirizzoSpedizioneDAO.TABLE_NAME2 +
							" ON ID=ID_INDIRIZZO " +
						   "WHERE VIA = ?,   CITTA = ?, CAP = ?, PROVINCIA = ?, STATO = ?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(checkSQL);
			
			preparedStatement.setString(1, indirizzo.getVia());
			preparedStatement.setString(2, indirizzo.getCitta());
			preparedStatement.setString(3, indirizzo.getCAP());
			preparedStatement.setString(4, indirizzo.getProvincia());
			preparedStatement.setString(5, indirizzo.getStato());
			
			ResultSet rs = preparedStatement.executeQuery();
		
			while(rs.next()) {
				if(rs.getInt("id_cliente") == user.getId())
					return;
			}
			
			String insertSQL = "INSERT INTO " + IndirizzoSpedizioneDAO.TABLE_NAME1
					+ " (ID, VIA, CITTA, CAP, PROVINCIA, STATO) VALUES (?, ?, ?, ?, ?, ?)";
			
			String insertSQL2 = "INSERT INTO " + IndirizzoSpedizioneDAO.TABLE_NAME2 + 
								" (ID_CLIENTE, ID_INDIRIZZO) VALUES (?, ?)";

		
			preparedStatement = connection.prepareStatement(insertSQL);
			PreparedStatement preparedStatement2 = connection.prepareStatement(insertSQL2);
			
			preparedStatement.setInt(1, indirizzo.getId());
			preparedStatement.setString(2, indirizzo.getVia());
			preparedStatement.setString(3, indirizzo.getCitta());
			preparedStatement.setString(4, indirizzo.getCAP());
			preparedStatement.setString(5, indirizzo.getProvincia());
			preparedStatement.setString(6, indirizzo.getStato());
			
			preparedStatement2.setInt(1, indirizzo.getId());
			preparedStatement2.setInt(2, user.getId());
			
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
	
	
		public synchronized Collection<IndirizzoSpedizioneBean> doRetrieveByUser(UserBean user, String order) throws SQLException{
	
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<IndirizzoSpedizioneBean> indirizzi = new LinkedList<IndirizzoSpedizioneBean>();
	
		String selectSQL = "select * " + 
							"FROM " + IndirizzoSpedizioneDAO.TABLE_NAME1 +
							" JOIN " + IndirizzoSpedizioneDAO.TABLE_NAME2 +
							" ON ID = ID_INDIRIZZO" +
							" WHERE ID_CLIENTE = ?";
				
		
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
}