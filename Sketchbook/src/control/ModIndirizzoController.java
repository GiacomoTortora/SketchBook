package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.IndirizzoSpedizioneBean;
import model.bean.UserBean;
import model.dao.IndirizzoSpedizioneDAO;

/**
 * Servlet implementation class ModIndirizzoController
 */
@WebServlet("/ModIndirizzoController")
public class ModIndirizzoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModIndirizzoController() {
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
			System.out.println("mod ind");
			IndirizzoSpedizioneDAO save=new IndirizzoSpedizioneDAO();
			IndirizzoSpedizioneBean indirizzo=new IndirizzoSpedizioneBean();
			indirizzo.setVia(request.getParameter("via"));
			System.out.println(request.getParameter("via"));
			indirizzo.setCitta(request.getParameter("citta"));
			System.out.println(request.getParameter("citta"));
			indirizzo.setCAP(request.getParameter("cap"));
			System.out.println(request.getParameter("cap"));
			indirizzo.setProvincia(request.getParameter("provincia"));
			System.out.println(request.getParameter("provincia"));
			indirizzo.setStato(request.getParameter("stato"));
			System.out.println(request.getParameter("stato"));
			indirizzo.setId(Integer.valueOf(request.getParameter("idbello")));
			System.out.println(request.getParameter("idbello"));
			save.doUpdate(indirizzo);
			//response.sendRedirect("Aggiungi-Indirizzo.jsp");
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
