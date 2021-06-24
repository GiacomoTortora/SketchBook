package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ProductDAO;

@WebServlet("/ProductCategory")
public class ProductCategory extends HttpServlet {
	
	private static final long serialVersionUID = 6542932021034042140L;

	static boolean isDataSource = true;

    public ProductCategory() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		ProductDAO products=new ProductDAO();

		try {
			if (action != null) {
				} if (action.equalsIgnoreCase("read")) {
					int categoria = Integer.parseInt(request.getParameter("categoria"));
					request.removeAttribute("product");
					request.setAttribute("product", products.doRetrieveByCategory(categoria));
				}
		
			}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Categoria.jsp");
		dispatcher.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
