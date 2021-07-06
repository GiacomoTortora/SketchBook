package control;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.OrderDAO;


@WebServlet("/SearchByDateController")
public class SearchByDateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SearchByDateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			  System.out.println("ciao");
			  LocalDate data1=(LocalDate.parse(request.getParameter("data1")));
			  LocalDate data2=(LocalDate.parse(request.getParameter("data2")));
			  HttpSession session= request.getSession();
			  session.setAttribute("data1", data1);
			  session.setAttribute("data2", data2);
			  response.sendRedirect("FoundOrdersByDate.jsp");
			} catch(Exception e) {
				System.out.println(e);
			}
	}

}
