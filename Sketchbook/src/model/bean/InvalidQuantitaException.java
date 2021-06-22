package model.bean;

public class InvalidQuantitaException extends RuntimeException {
	public InvalidQuantitaException() {
		super();
	}
	public InvalidQuantitaException(String message) {
		super(message);
	}
}
