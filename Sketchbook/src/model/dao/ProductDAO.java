package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.util.*;
import model.bean.ProductBean;

public class ProductDAO {
	private static DataSource ds;
	public static final String TABLE_NAME1 = "prodotto";
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
	
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException{
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> prodotti = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME1;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setIva(rs.getDouble("iva"));
				bean.setQuantitaCatalogo(rs.getInt("Quantita"));
				
				prodotti.add(bean);
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
		return prodotti;
	}
	
	
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME1 + " WHERE ID = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setIva(rs.getDouble("iva"));
				bean.setQuantitaCatalogo(rs.getInt("Quantita"));
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
	
	public synchronized Collection<ProductBean> doRetrieveByOrder(int code) throws SQLException {
		{
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			
			Collection<ProductBean> prodotti = new LinkedList<ProductBean>();			

			String selectSQL = "SELECT ID_PRODOTTO, NOMEPRODOTTO, PREZZOPRODOTTO, IVAPRODOTTO" +
								", DESCRIZIONEPRODOTTO, QUANTITA " +
								"FROM " + ProductDAO.TABLE_NAME2 + " JOIN " + OrderDAO.TABLE_NAME1 +
								" ON ID_ORDINE = ID " +
								"WHERE ID = ?";
			

			try {
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setInt(1, code);
				
				ResultSet rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					ProductBean bean = new ProductBean();
					
					bean.setId(rs.getInt("ID_PRODOTTO"));
					bean.setNome(rs.getString("NOMEPRODOTTO"));
					bean.setDescrizione(rs.getString("DESCRIZIONEPRODOTTO"));
					bean.setPrezzo(rs.getDouble("PREZZOPRODOTTO"));
					bean.setIva(rs.getDouble("IVAPRODOTTO"));
					bean.setQuantitaCarrello(rs.getInt("Quantita"));
					
					prodotti.add(bean);
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
			return prodotti;
		}
	}
	
	
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductDAO.TABLE_NAME1 + " WHERE ID = ?";

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
	
	
	

	public synchronized void doSave(ProductBean product) throws SQLException {
   
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductDAO.TABLE_NAME1
				+ " (NOME, DESCRIZIONE, PREZZO, IVA, Quantita) VALUES (?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getNome());
			preparedStatement.setString(2, product.getDescrizione());
			preparedStatement.setDouble(3, product.getPrezzo());
			preparedStatement.setDouble(4, product.getIva());
			preparedStatement.setInt(5, product.getQuantitaCatalogo());
			
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
	
	public synchronized Collection<ProductBean> doRetrieveByName(String name) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		List<ProductBean> prodotti = new ArrayList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME1 +
							" WHERE NOME LIKE ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, "%" + name + "%");

			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setIva(rs.getDouble("iva"));
				bean.setQuantitaCatalogo(rs.getInt("Quantita"));
				
				prodotti.add(bean);
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
		return prodotti;
	}
	
public synchronized Collection<ProductBean> doRetrieveByCategory(int categoria) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		List<ProductBean> prodotti = new ArrayList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME1 + " WHERE CATEGORIA = ? ";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, categoria);

			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setIva(rs.getDouble("iva"));
				bean.setQuantitaCatalogo(rs.getInt("Quantita"));
				
				prodotti.add(bean);
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
		return prodotti;
	}
	
	public synchronized void doUpdate(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE prodotto NOME = ?, DESCRIZIONE = ?, PREZZO = ?, " +
							"IVA = ?, QUANTITA = ?" +
							" WHERE ID = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			
			preparedStatement.setString(1, product.getNome());
			preparedStatement.setString(2, product.getDescrizione());
			preparedStatement.setDouble(3, product.getPrezzo());
			preparedStatement.setDouble(4, product.getIva());
			preparedStatement.setInt(5, product.getQuantitaCatalogo());
			preparedStatement.setInt(6, product.getId());
			
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
	
	public synchronized Collection<ProductBean> doRetrieveByBrand(List<String> brands) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		List<ProductBean> prodotti = new ArrayList<ProductBean>();
		
		String qValues = " = ?";
		for(int i = 1; i < brands.size(); ++i) {
			qValues += ", ?";
		}
		
		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME1 +
							" WHERE MARCA" + qValues;

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, brands.get(0));
			
			for(int i = 1; i < brands.size(); ++i) {
				preparedStatement.setString(i+1, brands.get(i));
			}

			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setIva(rs.getDouble("iva"));
				bean.setQuantitaCatalogo(rs.getInt("Quantita"));
				
				prodotti.add(bean);
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
		return prodotti;
	}
}