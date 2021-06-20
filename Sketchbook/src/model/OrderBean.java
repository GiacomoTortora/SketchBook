package model;

import java.sql.Date;

public class OrderBean {

	private int id;
	private Date data;
	private String stato;
	private int idCliente;
	private String nome;
	private Double prezzo;
	private Double sconto;
	
	
	public OrderBean() {
		
	}
	
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
	
	public String getNome() {
		return this.nome;
	}
	
	public void setNome(String newNome) {
		this.nome=newNome;
	}
	
	public Double getPrezzo() {
		return this.prezzo;
	}
	
	public void setPrezzo(Double newPrezzo) {
		this.prezzo=newPrezzo;
	}
	
	public Double getSconto() {
	    return this.sconto;
	}
	
	public void setSconto(Double newSconto) {
		this.sconto=newSconto;
	}
	
	@Override
	public String toString() {
		return nome + " (" + id + "), " + prezzo + " " + sconto + ". " + stato;
	}
}
