package models;

import java.util.Date;

public class Product extends MyModel{
	private int productID;
	private String productName;
	private int categoryID;
	private int priority;
	private int price;
	private Date lastupdate;
	private int hide;
	private String description;
	private String material;
	private String size;
	private int total;
	private String color;
	private int makerID;
	public Product(int productID, String productName, int categoryID, int priority, int price, Date lastupdate,
			int hide, String description, String material, String size, int total, String color, int makerID) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.categoryID = categoryID;
		this.priority = priority;
		this.price = price;
		this.lastupdate = lastupdate;
		this.hide = hide;
		this.description = description;
		this.material = material;
		this.size = size;
		this.total = total;
		this.color = color;
		this.makerID = makerID;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getLastupdate() {
		return lastupdate;
	}
	public void setLastupdate(Date lastupdate) {
		this.lastupdate = lastupdate;
	}
	public int getHide() {
		return hide;
	}
	public void setHide(int hide) {
		this.hide = hide;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getMakerID() {
		return makerID;
	}
	public void setMakerID(int makerID) {
		this.makerID = makerID;
	}
	@Override
	public String toString() {
		return "Product [productID=" + productID + ", productName=" + productName + ", categoryID=" + categoryID
				+ ", priority=" + priority + ", price=" + price + ", lastupdate=" + lastupdate + ", hide=" + hide
				+ ", description=" + description + ", material=" + material + ", size=" + size + ", total=" + total
				+ ", color=" + color + ", makerID=" + makerID + "]";
	}
	


}