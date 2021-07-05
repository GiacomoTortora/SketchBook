package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProductBean;
import model.dao.ProductDAO;

/**
 * Servlet implementation class ModProdottoController
 */
@WebServlet("/EliminaProdottoController")
public class EliminaProdottoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminaProdottoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("mod prod");
			ProductDAO save=new ProductDAO();
			ProductBean product=new ProductBean();
			System.out.println(Integer.valueOf(request.getParameter("idbello")));
			product.setId(Integer.valueOf(request.getParameter("idbello")));
			save.doDelete(product.getId());
			response.sendRedirect("ConfermaElimina.jsp");
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
