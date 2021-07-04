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


@WebServlet("/AggiungiIndirizzoController")
public class AggiungiIndirizzoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AggiungiIndirizzoController() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("bene");
			IndirizzoSpedizioneDAO save=new IndirizzoSpedizioneDAO();
			IndirizzoSpedizioneBean indirizzo=new IndirizzoSpedizioneBean();
			UserBean user= new UserBean();
			HttpSession session=request.getSession();
			user=(UserBean) session.getAttribute("currentSessionUser");
			if(user==null) {
				user=(UserBean) session.getAttribute("adminSession");
			}
			System.out.println(user.getFirstName());
			indirizzo.setVia(request.getParameter("via"));
			indirizzo.setCitta(request.getParameter("citta"));
			indirizzo.setCAP(request.getParameter("cap"));
			indirizzo.setProvincia(request.getParameter("provincia"));
			indirizzo.setStato(request.getParameter("stato"));
			save.doSave(indirizzo, user);
			//response.sendRedirect("Aggiungi-Indirizzo.jsp");
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

}
