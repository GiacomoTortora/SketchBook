package model.bean;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
public class OrderBean {

	private int id;
	private LocalDate data;
	private String stato;
	private int idCliente;
	private double totale;
	private List<ProductBean> prodotti = new ArrayList<ProductBean>();
		
	public int getId() {
		return this.id;
	}
	
	public void setId(int newId) {
		this.id=newId;
	}
	
	public LocalDate getData() {
		return this.data;
	}
	
	public void setData(LocalDate newData) {
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
	
	private void aggiornaTotale() {
		totale = 0;
		for(ProductBean p : prodotti)
			totale += p.getPrezzoTot()*p.getQuantitaCarrello();
    }
	public void setTotale(Double newPrezzo) {
		this.totale=newPrezzo;
	}
	
	public double getSubTotale() {
		double subtotale = 0;
		for(ProductBean p: prodotti)
			subtotale += p.getPrezzo()*p.getQuantitaCarrello();
		return subtotale;
	}
	
	public List<ProductBean> getProdotti(){
		return prodotti;
	}
	
	public void setProdotti(final Collection<ProductBean> collection) {
		prodotti = (List<ProductBean>) collection;
		aggiornaTotale();
	}
	
	@Override
	public String toString() {
		return " (" + id + "), " + totale + "." + stato;
	}
}
