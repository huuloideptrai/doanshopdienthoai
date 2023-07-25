package models;

public class Category extends MyModel {
private int categoryID;
private String categoryName;
private String discription;
private int hide;
public Category(int categoryID, String categoryName, String discription, int hide) {
	super();
	this.categoryID = categoryID;
	this.categoryName = categoryName;
	this.discription = discription;
	this.hide = hide;
}
public Category() {
	super();
	// TODO Auto-generated constructor stub
}
public int getCategoryID() {
	return categoryID;
}
public void setCategoryID(int categoryID) {
	this.categoryID = categoryID;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public String getDiscription() {
	return discription;
}
public void setDiscription(String discription) {
	this.discription = discription;
}
public int getHide() {
	return hide;
}
public void setHide(int hide) {
	this.hide = hide;
}
}
