package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.ProductBean;
import model.dao.ProductDAO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("ciao");
		ProductDAO findProd=new ProductDAO(); 
		PrintWriter out = response.getWriter();
		JsonArray arr=new JsonArray();
		
		try {
			String input= request.getParameter("term");
			//System.out.println("Data from ajax call " + input);
			Collection<ProductBean> list=new LinkedList<ProductBean>();
			list=findProd.doRetrieveByName(input);
			for(ProductBean bean : list) {
				//System.out.println(bean.getNome());
				arr.add(bean.getNome());
			}
			out.println(arr.toString());
			out.close();
		}catch(Throwable e) {
			System.out.println();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
