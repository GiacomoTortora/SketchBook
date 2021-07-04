package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.IndirizzoSpedizioneBean;
import model.bean.MetodoPagamentoBean;
import model.bean.UserBean;
import model.dao.IndirizzoSpedizioneDAO;
import model.dao.MetodoPagamentoDAO;

/**
 * Servlet implementation class AggiungiMetodoController
 */
@WebServlet("/AggiungiMetodoController")
public class AggiungiMetodoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiMetodoController() {
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
			System.out.println("agg pagamento");
			MetodoPagamentoDAO save=new MetodoPagamentoDAO();
			MetodoPagamentoBean metodo=new MetodoPagamentoBean();
			UserBean user= new UserBean();
			
			HttpSession session=request.getSession();
			user=(UserBean) session.getAttribute("currentSessionUser");
			if(user==null) {
				user=(UserBean) session.getAttribute("adminSession");
			}
			metodo.setNumCarta(request.getParameter("carta"));
			metodo.setTipo(request.getParameter("tipo"));
			save.doSave(metodo, user);
			response.sendRedirect("MetodiPagamento.jsp");
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
