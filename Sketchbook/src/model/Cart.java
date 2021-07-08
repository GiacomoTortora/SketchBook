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
	
	public void plusQty(int idProdotto) {
		for(int i = 0; i<products.size();++i) {
			if(idProdotto == products.get(i).getId() && products.get(i).getQuantitaCarrello()<=products.get(i).getQuantitaCatalogo()-1)
				products.get(i).incrementaQuantita();
			aggiornaTotale();
		}
	}
	
	public void minusQty(int idProdotto) {
		for(int i = 0; i<products.size();++i) {
			if(idProdotto == products.get(i).getId() && products.get(i).getQuantitaCarrello()>1) 
				products.get(i).decrementaQuantita();
			aggiornaTotale();
		}
	}
	
	public void svuota() {
		products.clear();
		totale=0;
	}
	
	
}
