package control;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.*;
import model.bean.*;


@WebServlet("/SearchByNameController")
public class SearchByNameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SearchByNameController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		  UserBean seekedUser=new UserBean();
		  OrderDAO seek=new OrderDAO();
		  Collection<OrderBean> list = new ArrayList<OrderBean>();
		  String nome=(request.getParameter("nome"));
		  String cognome=(request.getParameter("cognome"));
		  //list= seek.doRetrieveByName(nome,cognome);
		  for(OrderBean bean : list) {
			 
		  }
		  
		} catch(Exception e) {
			System.out.println(e);
		}
	}

}
