package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cart;
import model.ProductModel;
import model.ProductModelDM;
import model.ProductModelDS;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
	
	private static final long serialVersionUID = 9155027043637128429L;

	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
		if (isDataSource) {
			model = new ProductModelDS();
		} else {
			model = new ProductModelDM();
		}
	}

    public CartController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.addProduct(model.doRetrieveByKey(id));
				} else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(model.doRetrieveByKey(id));
				}
			}
		}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
		dispatcher.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}