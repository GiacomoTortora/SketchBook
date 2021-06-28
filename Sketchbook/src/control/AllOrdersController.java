package control;

import java.io.IOException;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.UserBean;
import model.bean.OrderBean;
import model.dao.OrderDAO;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/AllOrdersController")
public class AllOrdersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllOrdersController() {
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
			UserBean user = (UserBean)request.getSession().getAttribute("currentSessionUser");
			if(user!=null) {
			orders=order.doRetrieveByUser(user,"");
			}
		} catch(Throwable e) {
			System.out.println();
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AllOrders.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
