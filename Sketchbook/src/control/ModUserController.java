package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.UserBean;
import model.dao.UserDAO;

/**
 * Servlet implementation class ModUserController
 */
@WebServlet("/ModUserController")
public class ModUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModUserController() {
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
		UserDAO update=new UserDAO();
		try {
			System.out.println("ciao");
		UserBean newUser=new UserBean();
		UserBean user=new UserBean();
		String reMail=request.getParameter("reMail");
		System.out.println(reMail);
		HttpSession session= request.getSession();
		user=(UserBean)session.getAttribute("currentSessionUser");
		if(user==null) {
			user=(UserBean) session.getAttribute("adminSession");
		}
		newUser.setId(user.getId());
		newUser.setEmail(request.getParameter("reMail"));
		newUser.setFirstName(request.getParameter("name"));
		newUser.setLastName(request.getParameter("surname"));
		newUser.setPassword(request.getParameter("rePwd"));
		update.doUpdate(newUser);
		if(session.getAttribute("currentSessionUser")==null) 
		session.setAttribute("adminSession", newUser);
		else session.setAttribute("currentSessionUser", newUser);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
