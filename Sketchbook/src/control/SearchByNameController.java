package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;

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
		  System.out.println("ciao");
		  String nome=(request.getParameter("nome"));
		  String cognome=(request.getParameter("cognome"));
		  HttpSession session= request.getSession();
		  session.setAttribute("seekedNome", nome);
		  session.setAttribute("seekedCognome", cognome);
		  response.sendRedirect("FoundOrdersByName.jsp");
		} catch(Exception e) {
			System.out.println(e);
		}
	}

}
