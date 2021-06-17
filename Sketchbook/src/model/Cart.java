package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public boolean isEmpty() {
		if(products.isEmpty()) return true;
		else return false;
	}
	
	public void addProduct(ProductBean product) {
       products.add(product);
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getID() == product.getID()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	/*public boolean sameProduct(String name) {
		for (ProductBean prod: products) {
			if(prod.getName().equals(name)){
				System.out.println("same");
			}
		}
		return true;
	} */
	
	public List<ProductBean> getProducts() {
		return  products;
	}
}
