package model;

import java.io.Serializable;

public class UserBean {
	

	private String email;
	private String password;
	private String firstName;
	private String lastName;
	private int id;
	private boolean valid;
	private boolean admin;
	
	public UserBean() {
		id=-1;
		email="";
		password="";
		firstName="";
		lastName="";
		valid=true;
	}
		
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String newEmail) {
		
		this.email=newEmail;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String newPassword) {
		 this.password=newPassword;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String newFirstName) {
	   this.firstName=newFirstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String newLastName) {
		 this.lastName=newLastName;
	}
	
	public boolean isValid() {
	       return valid;
    }

	public void setValid(boolean newValid) {
	       this.valid = newValid;
	}	
	
	public int getId() {
		return id;
	}
	
	public boolean isAdmin() {
		return admin;
	}
	
	public String toString() {
		return email + " (" + id + "), " + password + " " + firstName + " " + lastName;
	}
	
}
