package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import model.Cart;
import model.bean.*;

@WebServlet("/SvuotaCarrelloController")
public class SvuotaCarrelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SvuotaCarrelloController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   try {
		   HttpSession session=request.getSession();
		   Cart cart = (Cart)  session.getAttribute("cart");
		   cart.svuota();
		   response.sendRedirect("Cart.jsp");
	   } catch(Exception e) {
		   System.out.println(e);
	   }
	}

}
