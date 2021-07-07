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
import model.bean.ProductBean;
import model.dao.ProductDAO;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
	
	private static final long serialVersionUID = 9155027043637128429L;

	static boolean isDataSource = true;

    public CartController() {
       super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		ProductDAO prodotti= new ProductDAO();
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("setQuant")) {

						int id = Integer.parseInt(request.getParameter("id"));
						int qty = Integer.parseInt(request.getParameter("qty"));
						cart.updateQty(id, qty);
						request.getSession().setAttribute("cart", cart);
						request.setAttribute("cart", cart);
						System.out.println("id" + id + "e qnt" + qty);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
						dispatcher.forward(request, response);
					
				}	
				if (action.equalsIgnoreCase("addC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductBean prodotto = prodotti.doRetrieveByKey(id);
					prodotto.incrementaQuantita();
					cart.addProduct(prodotto);
					request.getSession().setAttribute("cart", cart);
					request.setAttribute("cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("");
					dispatcher.forward(request, response);
					
				} else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(prodotti.doRetrieveByKey(id));
					request.getSession().setAttribute("cart", cart);
					request.setAttribute("cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
					dispatcher.forward(request, response);
					
				}
			}
		}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}