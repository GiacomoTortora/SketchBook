package model.bean;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String nome;
	private String descrizione;
	private double prezzo;
	private double iva;
	private int quantitaCarrello;
	private int quantitaCatalogo;
	
	public int getId() {
		return id;
	}

	public void setId(int code) {
		id = code;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String name) {
		nome = name;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String description) {
		descrizione = description;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double price) {
		prezzo = price;
	}
	
	public double getIva() {
		return iva;
	}
	
	public void setIva(double newIva) {
		if(newIva <= 0 || newIva >= 100)
			throw new BadIvaException("Valore non valido");
		iva = newIva;
	}
	
	public double getPrezzoTot() {
		return prezzo + prezzo*iva/100;
	}
	
	public int getQuantitaCarrello() {
		return quantitaCarrello;
	}

	public void setQuantitaCarrello(int quantita) {
		if(quantita > quantitaCatalogo)
			throw new InvalidQuantitaException("Quantità non valida");
		quantitaCarrello = quantita;
	}
	
	public int getQuantitaCatalogo() {
		return quantitaCatalogo;
	}

	public void setQuantitaCatalogo(int quantita) {
		quantitaCatalogo = quantita;
	}
	
	public void incrementaQuantita() {
		if(++quantitaCatalogo > quantitaCatalogo)
			throw new InvalidQuantitaException("Quantità non valida");
		quantitaCarrello++;
	}

	@Override
	public String toString() {
		return nome + " (" + id + "), " + prezzo + " " + quantitaCarrello + ". " + descrizione;
	}
	
	public boolean equals (Object o) {
		if(o instanceof ProductBean) {
			ProductBean p = (ProductBean) o;
			return id == p.getId();
		}
		return false;	
	}
}
