package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.UserBean;
import model.dao.UserDAO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	 static final long serialVersionUID = 102831973239L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        UserDAO login=new UserDAO();
		try
		{	    

		     UserBean user = new UserBean();
		     user.setEmail(request.getParameter("email"));
		     user.setPassword(request.getParameter("password"));

		     user = login.doRetrieveByForm(user);
		     if (user.isValid())
		     {
			        
		          HttpSession session = request.getSession(true);
		          if(user.isAdmin()) {
		        	  session.setAttribute("adminSession", user);
		        	  System.out.println("benvenuto admin");
		        	  response.sendRedirect("ProductView.jsp");   //admin loggato
		          }
		          else if(!user.isAdmin()) {
		          session.setAttribute("currentSessionUser",user);
		          System.out.println(user.getFirstName());
		          response.sendRedirect("ProductView.jsp");  //user loggato
		          System.out.println("buono");
		          }
		     }
			        
		     else { 
		          response.sendRedirect("general-error.jsp"); //errore
		          System.out.println("male");
		     }
		} 
				
				
		catch (Throwable e) 	    
		{
		     System.out.println(e); 
		} 
		       
	}

}
