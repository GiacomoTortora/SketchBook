package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.MetodoPagamentoBean;
import model.bean.UserBean;
import model.dao.MetodoPagamentoDAO;

/**
 * Servlet implementation class ModPagamentoController
 */
@WebServlet("/ModPagamentoController")
public class ModPagamentoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModPagamentoController() {
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
			System.out.println("mod pagamento");
			MetodoPagamentoDAO save=new MetodoPagamentoDAO();
			MetodoPagamentoBean metodo=new MetodoPagamentoBean();
			metodo.setNumCarta(request.getParameter("carta"));
			metodo.setTipo(request.getParameter("tipo"));
			
			System.out.println(request.getParameter("carta"));
			System.out.println(request.getParameter("tipo"));
			System.out.println(request.getParameter("idbello"));
			int faccioFunzionareTutto = (Integer.parseInt(request.getParameter("idbello")));
			metodo.setId(faccioFunzionareTutto);
			
			save.doUpdate(metodo);
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
