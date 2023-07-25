package models;

import java.sql.Date;

public class Order extends MyModel{
private int orderID;
private int userID;
private Date datecreate;
private int status;
private int total;
private String pay;
private int hide;
public Order(int orderID, int userID, Date datecreate, int status, int total, String pay, int hide) {
	super();
	this.orderID = orderID;
	this.userID = userID;
	this.datecreate = datecreate;
	this.status = status;
	this.total = total;
	this.pay = pay;
	this.hide = hide;
}
public Order() {
	super();
	// TODO Auto-generated constructor stub
}
public int getOrderID() {
	return orderID;
}
public void setOrderID(int orderID) {
	this.orderID = orderID;
}
public int getUserID() {
	return userID;
}
public void setUserID(int userID) {
	this.userID = userID;
}
public Date getDatecreate() {
	return datecreate;
}
public void setDatecreate(Date datecreate) {
	this.datecreate = datecreate;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}
public String getPay() {
	return pay;
}
public void setPay(String pay) {
	this.pay = pay;
}
public int getHide() {
	return hide;
}
public void setHide(int hide) {
	this.hide = hide;
}

}
