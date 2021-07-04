package model.bean;

public class IndirizzoSpedizioneBean {

	private int id;
	private String via;
	private String citta;
	private String CAP;
	private String provincia;
	private String stato;
		
	public int getId() {
		return this.id;
	}
	
	public void setId(int newId) {
		this.id=newId;
	}
	
	public String getVia() {
		return this.via;
	}
	
	public String setVia(String newVia){
		return this.via = newVia;
	}
	
	public String getCitta() {
		return this.citta;
	}
	
	public void setCitta(String newCitta) {
		this.citta=newCitta;
	}
	
	public String getCAP() {
		return this.CAP;
	}
	
	public void setCAP(String newCAP) {
		this.CAP=newCAP;
	}
	
	public String getProvincia() {
		return this.provincia;
	}
	
	public void setProvincia(String newProvincia) {
		this.provincia=newProvincia;
	}
	
	public String getStato() {
		return this.stato;
	}
	
	public void setStato(String newStato) {
		this.stato=newStato;
	}
	
	public String toString() {
		return "Via " + getVia() + ", " + getCitta() + ", " + getProvincia() +  ", " + getStato();
	}
}
