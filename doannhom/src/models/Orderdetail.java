package models;

public class Orderdetail extends MyModel{
	private int orderdetailID;
	private int orderID;
	private int productID;
	private int quantity;
	private int unitprice;
	private String chatlieu;
	private String mau;
	private String kichthuoc;
	
	public Orderdetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setOrderdetailID(int orderdetailID) {
		this.orderdetailID = orderdetailID;
	}public int getOrderdetailID() {
		return orderdetailID;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}
	public String getChatlieu() {
		return chatlieu;
	}
	public void setChatlieu(String chatlieu) {
		this.chatlieu = chatlieu;
	}
	public String getMau() {
		return mau;
	}
	public void setMau(String mau) {
		this.mau = mau;
	}
	public String getKichthuoc() {
		return kichthuoc;
	}
	public void setKichthuoc(String kichthuoc) {
		this.kichthuoc = kichthuoc;
	}
	@Override
	public String toString() {
		return "Orderdetail [orderdetailID=" + orderdetailID + ", orderID=" + orderID + ", productID=" + productID
				+ ", quantity=" + quantity + ", unitprice=" + unitprice + ", chatlieu=" + chatlieu + ", mau=" + mau
				+ ", kichthuoc=" + kichthuoc + "]";
	}
	public Orderdetail(int orderdetailID, int orderID, int productID, int quantity, int unitprice, String chatlieu,
			String mau, String kichthuoc) {
		super();
		this.orderdetailID = orderdetailID;
		this.orderID = orderID;
		this.productID = productID;
		this.quantity = quantity;
		this.unitprice = unitprice;
		this.chatlieu = chatlieu;
		this.mau = mau;
		this.kichthuoc = kichthuoc;
	}
	
}
