package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.UserBean;
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
		UserDAO signup=new UserDAO();
		try {
		UserBean newUser=new UserBean();
		String firstName="", lastName="", newPassword2="", newEmail2="";
		newEmail2=request.getParameter("newEmail2");
		firstName=request.getParameter("firstName");
		lastName=request.getParameter("lastName");
		newPassword2=request.getParameter("newPassword2");
		System.out.println(newEmail2);
		System.out.println(firstName);
		System.out.println(lastName);
		System.out.println(newPassword2);
		newUser.setEmail(newEmail2);
		newUser.setFirstName(firstName);
		newUser.setLastName(lastName);
		newUser.setPassword(newPassword2);
			if(signup.doRetrieveUniqueEmail(newUser)==true) {
				signup.doSave(newUser);
				 request.getRequestDispatcher("ProductView.jsp").forward(request, response);
			} else response.sendRedirect("general-error.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}