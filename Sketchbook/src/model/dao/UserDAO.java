package model.dao;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

import model.bean.OrderBean;
import model.bean.UserBean;


public class UserDAO {
	
	private static DataSource ds;
	public static final String TABLE_NAME = "cliente";
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/ecommerce");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		  }
	}
	
	public synchronized Collection<UserBean> doRetrieveAll(String order) throws SQLException{
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<UserBean> users = new LinkedList<UserBean>();

		String selectSQL = "SELECT * FROM " + UserDAO.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				UserBean bean = new UserBean();

				bean.setEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setFirstName(rs.getString("nome"));
				bean.setLastName(rs.getString("cognome"));
				bean.setId(rs.getInt("id"));
				bean.setValid(true);
				if(rs.getString("ruolo").equalsIgnoreCase("admin"))
						bean.setAdmin(true);
				else bean.setAdmin(false);
				
				users.add(bean);
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
		return users;
	}
	
	
	public synchronized UserBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		UserBean bean = new UserBean();

		String selectSQL = "SELECT * FROM " + UserDAO.TABLE_NAME + " WHERE ID = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setFirstName(rs.getString("nome"));
				bean.setLastName(rs.getString("cognome"));
				bean.setId(rs.getInt("id"));
				bean.setValid(true);
				if(rs.getString("ruolo").equalsIgnoreCase("admin"))
						bean.setAdmin(true);
				else bean.setAdmin(false);
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

		String deleteSQL = "DELETE FROM " + UserDAO.TABLE_NAME + " WHERE ID = ?";

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
	
	
	

	public synchronized void doSave(UserBean user) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + UserDAO.TABLE_NAME
				+ " (NOME, COGNOME, EMAIL, PASSWORD, RUOLO) VALUES (?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getLastName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPassword());
			if(user.getAdmin())
				preparedStatement.setString(5,"admin");
			else 
				preparedStatement.setString(5,"user");
			
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
 
  public UserBean doRetrieveByForm(UserBean bean) throws SQLException {
	Connection connection=null;
    PreparedStatement preparedStatement=null; //si usa prepared statement per evitare SQL-injection
    ResultSet rs=null;
     try {  
    	 connection= ds.getConnection();
    	 preparedStatement=connection.prepareStatement("SELECT * FROM cliente WHERE Email=? AND Password=?");
    	 preparedStatement.setString(1, bean.getEmail());
    	 preparedStatement.setString(2, bean.getPassword());
         rs = preparedStatement.executeQuery();
         bean.setValid(false);//valid= false, di default si presuppone riscontro negativo
             while(rs.next()) {//caso positivo, il rs esiste solo se la query ha avuto esito positivo.
        	 String firstName = rs.getString("Nome");
             String lastName = rs.getString("Cognome");
             String ruolo = rs.getString("Ruolo");
             int id=rs.getInt("ID");
             System.out.println("Welcome " + firstName);
             bean.setFirstName(firstName);
             bean.setLastName(lastName);
             bean.setId(id);
             bean.setValid(true);
             if(ruolo.equals("admin")) {
            	 bean.setAdmin(true);
             }
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
     
     
     
   
   
   public boolean doRetrieveUniqueEmail (UserBean bean) throws SQLException {
	  PreparedStatement preparedStatement=null;
	  Connection connection=null;
	  ResultSet rs=null;
	   try {
		   connection= ds.getConnection();
		   preparedStatement=connection.prepareStatement("SELECT Nome FROM cliente WHERE Email=?");
		   preparedStatement.setString(1, bean.getEmail());
		   rs=preparedStatement.executeQuery();
		   if(!rs.first()) {
			   return true;
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
	   return false;
   }
   
   public synchronized void doUpdate(UserBean user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE " + UserDAO.TABLE_NAME + 
							" SET NOME = ?, COGNOME = ?, EMAIL = ?, PASSWORD = ?, RUOLO = ?" +
							" WHERE ID = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getLastName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPassword());
			
			if(user.isAdmin())
				preparedStatement.setString(5, "admin");
			else
				preparedStatement.setString(5, "user");
			
			preparedStatement.setInt(6, user.getId());
			
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
