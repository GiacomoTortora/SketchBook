package model;
import model.bean.*;
import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	private double totale;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public boolean isEmpty() {
		return products.isEmpty();
	}
	
	public void aggiornaTotale() {
	    totale = 0;
		for(ProductBean p : products)
			totale += p.getPrezzoTot()*p.getQuantitaCarrello();
    }
	
	public void addProduct(ProductBean product) {
	   boolean flag = false;
       for(int i = 0; !flag && i < products.size(); ++i) {
    	   if(products.get(i).equals(product)) {
    		   products.get(i).incrementaQuantita();
    		   flag = true;
    	   }
       }
       if(!flag)
    	   products.add(product);
       aggiornaTotale();
    }
	
	public void deleteProduct(ProductBean product) {
		products.remove(product);
		aggiornaTotale();
 	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
	
	public double getTotale() {
		return totale;
	}
	
	public double getSubTotale() {
		double subtotale = 0;
		for(ProductBean p: products)
			subtotale += p.getPrezzo()*p.getQuantitaCarrello();
		return subtotale;
	}
	
	public void svuota() {
		products.clear();
		totale=0;
	}
	
	
}
