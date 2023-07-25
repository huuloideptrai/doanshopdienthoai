package models;

public class Images extends MyModel {
//`imageID`, `productID`, `link`, `hide`, `thumbnail`
	int imagesID;
int productID;

String link;
int type;
int thumbnail;


public Images(int imagesID, int productID, String link, int type, int thumbnail) {
	super();
	this.imagesID = imagesID;
	this.productID = productID;
	this.link = link;
	this.type = type;
	this.thumbnail = thumbnail;
}
public Images() {
	super();
	// TODO Auto-generated constructor stub
}
public int getProductID() {
	return productID;
}
public void setProductID(int productID) {
	this.productID = productID;
}
public int getImagesID() {
	return imagesID;
}
public void setImagesID(int imagesID) {
	this.imagesID = imagesID;
}
public String getLink() {
	return link;
}
public void setLink(String link) {
	this.link = link;
}
public int getType() {
	return type;
}
public void setType(int type) {
	this.type = type;
}
public int getThumbnail() {
	return thumbnail;
}
public void setThumbnail(int thumbnail) {
	this.thumbnail = thumbnail;
}
}
