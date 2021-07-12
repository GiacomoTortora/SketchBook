package control;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.bean.OrderBean;
import model.bean.ProductBean;
import model.bean.UserBean;
import model.dao.OrderDAO;

/**
 * Servlet implementation class CheckoutController
 */
@WebServlet("/CheckoutController")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CheckoutController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {	
				OrderBean ordine = new OrderBean();
				HttpSession session = request.getSession(false); 
				Cart cart = (Cart)session.getAttribute("cart");
				UserBean user = (UserBean) session.getAttribute("currentSessionUser");
				if(user == null) {
					user = (UserBean)session.getAttribute("adminSession");
				}
				List<ProductBean> prodotti = cart.getProducts();
				ordine.setIdCliente(user.getId());
				ordine.setData(LocalDate.now().plusDays(1));
				ordine.setProdotti(prodotti);
				ordine.setStato("Ordinato");
				new OrderDAO().doSave(ordine);
				session.removeAttribute("cart");
				response.sendRedirect("ConfermaOrdine.jsp");
		}catch(Exception e) {
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
