package models;

public class Maker extends MyModel{
private int makerID;
private String name;
private int phone;
private String email;
private String address;

public Maker() {
	super();
	// TODO Auto-generated constructor stub
}

public Maker(int makerID, String name, int phone, String email, String address) {
	super();
	this.makerID = makerID;
	this.name = name;
	this.phone = phone;
	this.email = email;
	this.address = address;
}

public int getMakerID() {
	return makerID;
}

public void setMakerID(int makerID) {
	this.makerID = makerID;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public int getPhone() {
	return phone;
}

public void setPhone(int phone) {
	this.phone = phone;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

@Override
public String toString() {
	return "Maker [makerID=" + makerID + ", name=" + name + ", phone=" + phone + ", email=" + email + ", address="
			+ address + "]";
}
}