package models;

public class Thongke extends MyModel{
private String ten;
private int soluong;
public Thongke(String ten, int soluong) {
	super();
	this.ten = ten;
	this.soluong = soluong;
}
public Thongke() {
	super();
	// TODO Auto-generated constructor stub
}
public String getTen() {
	return ten;
}
public void setTen(String ten) {
	this.ten = ten;
}
public int getSoluong() {
	return soluong;
}
public void setSoluong(int soluong) {
	this.soluong = soluong;
}
@Override
public String toString() {
	return "[" +ten+ ","+  soluong + "]";
}

}
