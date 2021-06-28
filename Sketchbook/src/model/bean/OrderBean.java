package model.bean;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
public class OrderBean {

	private int id;
	private Date data;
	private String stato;
	private int idCliente;
	private double totale=0;
	private List<ProductBean> prodotti = new ArrayList<ProductBean>();
		
	public int getId() {
		return this.id;
	}
	
	public void setId(int newId) {
		this.id=newId;
	}
	
	public Date getData() {
		return this.data;
	}
	
	public void setData(Date newData) {
		this.data=newData;
	}
	
	public String getStato() {
		return this.stato;
	}
	
	public void setStato(String newStato) {
		this.stato=newStato;
	}
	
	public int getIdCliente() {
		return this.idCliente;
	}
	
	public void setIdCliente(int newIdCliente) {
		this.idCliente=newIdCliente;
	}
	
	public double getTotale() {
		return this.totale;
	}
	
	public void aggiornaTotale() {
		for(ProductBean p : prodotti)
			totale += p.getPrezzoTot();
    }
	public void setTotale(Double newPrezzo) {
		this.totale=newPrezzo;
	}
	
	
	
	public List<ProductBean> getProdotti(){
		return prodotti;
	}
	
	public void setProdotti(final Collection<ProductBean> collection) {
		prodotti = (List<ProductBean>) collection;
		aggiornaTotale();
	}
	
	public void addProduct(ProductBean p) {
		prodotti.add(p);
		totale += p.getPrezzo();
	}
	
	public void removeProduct(ProductBean p) {
		prodotti.remove(p);
		totale -= p.getPrezzo();
	}
	
	@Override
	public String toString() {
		return " (" + id + "), " + totale + "." + stato;
	}
}
