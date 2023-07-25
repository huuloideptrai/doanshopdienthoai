package models;

public class User extends MyModel{
private int userID;
private String username;
private String email;
private String password;
private String address;
private int sex;
private String phone;
private int active;
private int admin;
public User() {
	super();
	// TODO Auto-generated constructor stub
}
public User(int userID, String username, String email, String password, String address, int sex, String phone,
		int active, int admin) {
	super();
	this.userID = userID;
	this.username = username;
	this.email = email;
	this.password = password;
	this.address = address;
	this.sex = sex;
	this.phone = phone;
	this.active = active;
	this.admin = admin;
}
public int getUserID() {
	return userID;
}
public void setUserID(int userID) {
	this.userID = userID;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public int getSex() {
	return sex;
}
public void setSex(int sex) {
	this.sex = sex;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public int getActive() {
	return active;
}
public void setActive(int active) {
	this.active = active;
}
public int getAdmin() {
	return admin;
}
public void setAdmin(int admin) {
	this.admin = admin;
}
@Override
public String toString() {
	return "User [userID=" + userID + ", username=" + username + ", email=" + email + ", password=" + password
			+ ", address=" + address + ", sex=" + sex + ", phone=" + phone + ", active=" + active + ", admin=" + admin
			+ "]";
}

}