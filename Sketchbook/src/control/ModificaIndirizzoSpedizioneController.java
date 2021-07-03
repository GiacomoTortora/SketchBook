package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.IndirizzoSpedizioneDAO;
import model.dao.MetodoPagamentoDAO;

@WebServlet("/ModificaIndirizzoSpedizioneController")
public class ModificaIndirizzoSpedizioneController extends HttpServlet {
	
	private static final long serialVersionUID = 6542932021034042140L;

	static boolean isDataSource = true;

    public ModificaIndirizzoSpedizioneController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		IndirizzoSpedizioneDAO indirizzoSpedizione=new IndirizzoSpedizioneDAO();

		try {
			if (action != null) {
				} if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("newIndirizzoSpedizione");
					request.setAttribute("newIndirizzoSpedizione", indirizzoSpedizione.doRetrieveByKey(id));
				}
		
			}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ModificaIndirizzoSpedizione.jsp");
		dispatcher.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
