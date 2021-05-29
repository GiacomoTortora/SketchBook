package model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String nome;
	private String descrizione;
	private int prezzo;
	private int quantita;

	public ProductBean() {
		id = -1;
		nome = "";
		descrizione = "";
		quantita = 0;
	}

	public int getID() {
		return id;
	}

	public void setID(int code) {
		this.id = code;
	}

	public String getName() {
		return nome;
	}

	public void setName(String name) {
		this.nome = name;
	}

	public String getDescription() {
		return descrizione;
	}

	public void setDescription(String description) {
		this.descrizione = description;
	}

	public double getPrice() {
		return prezzo;
	}

	public void setPrice(int price) {
		this.prezzo = price;
	}

	public int getQuantity() {
		return quantita;
	}

	public void setQuantity(int quantity) {
		this.quantita = quantity;
	}

	@Override
	public String toString() {
		return nome + " (" + id + "), " + prezzo + " " + quantita + ". " + descrizione;
	}

}
