package model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String nome;
	private String descrizione;
	private double prezzo;
	private int quantita;
	private int quantitaCarrello;

	public ProductBean() {
		id = -1;
		nome = "";
		descrizione = "";
		quantita = 0;
		quantitaCarrello=1;
	}

	public int getID() {
		return id;
	}

	public void setID(int code) {
		id = code;
	}

	public String getName() {
		return nome;
	}

	public void setName(String name) {
		nome = name;
	}

	public String getDescription() {
		return descrizione;
	}

	public void setDescription(String description) {
		descrizione = description;
	}

	public double getPrice() {
		return prezzo;
	}

	public void setPrice(double price) {
		prezzo = price;
	}

	public int getQuantity() {
		return quantita;
	}

	public void setQuantity(int quantity) {
		quantita = quantity;
	}
	
	public int getQuantitaCarrello() {
		return quantitaCarrello;
	}
	
	public void setQuantitaCarrello() {
		quantitaCarrello++;
	}

	@Override
	public String toString() {
		return nome + " (" + id + "), " + prezzo + " " + quantita + ". " + descrizione;
	}

}
