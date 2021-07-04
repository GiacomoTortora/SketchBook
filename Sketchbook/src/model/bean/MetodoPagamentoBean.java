package model.bean;

public class MetodoPagamentoBean {

	private int id;
	private String numCarta;
	private String tipo;
		
	public int getId() {
		return this.id;
	}
	
	public void setId(int newId) {
		this.id=newId;
	}
	
	public String getNumCarta() {
		return this.numCarta;
	}
	
	public String setNumCarta(String newNumCarta) {
		return this.numCarta = newNumCarta;
	}
	
	public String getTipo() {
		return this.tipo;
	}
	
	public void setTipo(String newTipo) {
		this.tipo=newTipo;
	}
	
	public String toString() {
        return "Numero: " + getNumCarta() + ", " + getTipo();
    }
	
}
