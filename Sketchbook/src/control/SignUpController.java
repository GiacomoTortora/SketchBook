package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserBean;
import model.dao.UserDAO;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet("/SignUpController")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
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
		UserBean newUser=new UserBean();
		String email="", email2="", firstName="", lastName="", password="", password2="";
		email=request.getParameter("email");
		if(email=="") {
			response.sendRedirect("general-error.jsp");
		}
		email2=request.getParameter("email2");
		if(email2=="") {
			response.sendRedirect("general-error.jsp");
		}
		if(!email.equals(email2)) {
			response.sendRedirect("general-error.jsp");
		}
		firstName=request.getParameter("firstName");
		if(firstName=="") {
			response.sendRedirect("general-error.jsp");
		}
		lastName=request.getParameter("lastName");
		if(lastName=="") {
			response.sendRedirect("general-error.jsp");
		}
		password=request.getParameter("password");
		if(password=="") {
			response.sendRedirect("general-error.jsp");
		}
		password2=request.getParameter("password2");
		if(password2=="") {
			response.sendRedirect("general-error.jsp");
		}
		if(!password.equals(password2)) {
			response.sendRedirect("general-error.jsp");
		}
		System.out.println(email2);
		System.out.println(firstName);
		System.out.println(lastName);
		System.out.println(password2);
		newUser.setEmail(email2);
		newUser.setFirstName(firstName);
		newUser.setLastName(lastName);
		newUser.setPassword(password2);
		if(UserDAO.isUniqueEmail(newUser)==true) {
			UserDAO.doSubmit(newUser);
			 request.getRequestDispatcher("ProductView.jsp").forward(request, response);;
		} else response.sendRedirect("general-error.jsp");
	}

}