package models;

public class Item extends MyModel{
private Product product;
private int quantity;
public Item(Product product, int quantity) {
	super();
	this.product = product;
	this.quantity = quantity;
}
public Item() {
	super();
	// TODO Auto-generated constructor stub
}
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}

}
