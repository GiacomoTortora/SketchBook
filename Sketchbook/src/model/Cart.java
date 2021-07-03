package model;
import model.bean.*;
import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public boolean isEmpty() {
		return products.isEmpty();
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
    }
	
	public void deleteProduct(ProductBean product) {
		products.remove(product);
 	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
	
	public double getPrezzoCart() {
		double prezzo=0;
		for(ProductBean bean : products) {
			prezzo=bean.getPrezzoTot()+prezzo;
		}
		return prezzo;
	}
	
	
}
