package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProductBean;
import model.dao.ProductDAO;

/**
 * Servlet implementation class ModProdottoController
 */
@WebServlet("/ModProdottoController")
public class ModProdottoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModProdottoController() {
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
		try {
			System.out.println("bene");
			ProductDAO save=new ProductDAO();
			ProductBean product=new ProductBean();
			product.setNome(request.getParameter("nome"));
			product.setDescrizione(request.getParameter("descrizione"));
			product.setIva(Double.valueOf(request.getParameter("iva")));
			product.setPrezzo(Double.valueOf(request.getParameter("prezzo")));
			product.setQuantitaCatalogo(Integer.valueOf(request.getParameter("prezzo")));
			save.doUpdate(product);
			//response.sendRedirect("Aggiungi-Indirizzo.jsp");
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
