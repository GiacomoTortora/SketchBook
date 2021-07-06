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


@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO findProd=new ProductDAO(); 
		PrintWriter out = response.getWriter();
		JsonArray arr=new JsonArray();
		
		try {
			String input= request.getParameter("term");
			Collection<ProductBean> list=new LinkedList<ProductBean>();
			list=findProd.doRetrieveByName(input);
			for(ProductBean bean : list) {
				arr.add(bean.getNome());
			}
			out.println(arr.toString());
			out.close();
		}catch(Throwable e) {
			System.out.println();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
