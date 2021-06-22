package control;

import java.io.IOException;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.bean.UserBean;
import model.bean.OrderBean;
import model.dao.ProductDAO;
import model.dao.OrderDAO;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/OrderController")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO order=new OrderDAO();
		try {
			Collection<OrderBean> orders = new LinkedList<OrderBean>();
			System.out.println("init");
			UserBean user = (UserBean)request.getSession().getAttribute("currentSessionUser");
			if(user!=null) {
			System.out.println("vai così!");
			orders=order.doRetrieveByUser(user,"");
			response.sendRedirect("ProductView.jsp");
			System.out.println("ma sei fortissimo! O__O");
			}
		} catch(Throwable e) {
			System.out.println();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
