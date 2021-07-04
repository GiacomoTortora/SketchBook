package control;

import java.io.IOException;
import java.util.Date;
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
		try {System.out.println("xd1");
				OrderBean ordine = new OrderBean();
				HttpSession session = request.getSession(false); 
				System.out.println("xd2");
				Cart cart = (Cart)session.getAttribute("cart");
				UserBean user = (UserBean) session.getAttribute("currentSessionUser");
				System.out.println("xd3");
				if(user == null) {
					System.out.println("xd4");
					user = (UserBean)session.getAttribute("adminSession");
				}
				System.out.println("xd5");
				List<ProductBean> prodotti = cart.getProducts();
				System.out.println("xd6");
				ordine.setIdCliente(user.getId());
				ordine.setData((java.sql.Date) new Date());
				ordine.setProdotti(prodotti);
				ordine.setStato("Ordinato");
				System.out.println("xd7");
				new OrderDAO().doSave(ordine);
				session.removeAttribute("cart");
				System.out.println("xd8");
				response.sendRedirect("ProductView.jsp");
		}catch(Exception e) {
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
