package models;

public class LienHe extends MyModel{
private String Ten;
private String dc;
private int sdt;
private String bando;
private String chitet;
private String cachthuc;
private String dichvu;
private String email;
public LienHe() {}
public LienHe(String ten, String dc, int sdt, String bando, String chitet, String cachthuc, String dichvu,
		String email) {
	super();
	Ten = ten;
	this.dc = dc;
	this.sdt = sdt;
	this.bando = bando;
	this.chitet = chitet;
	this.cachthuc = cachthuc;
	this.dichvu = dichvu;
	this.email = email;
}
public String getTen() {
	return Ten;
}
public void setTen(String ten) {
	Ten = ten;
}
public String getDc() {
	return dc;
}
public void setDc(String dc) {
	this.dc = dc;
}
public int getSdt() {
	return sdt;
}
public void setSdt(int sdt) {
	this.sdt = sdt;
}
public String getBando() {
	return bando;
}
public void setBando(String bando) {
	this.bando = bando;
}
public String getChitet() {
	return chitet;
}
public void setChitet(String chitet) {
	this.chitet = chitet;
}
public String getCachthuc() {
	return cachthuc;
}
public void setCachthuc(String cachthuc) {
	this.cachthuc = cachthuc;
}
public String getDichvu() {
	return dichvu;
}
public void setDichvu(String dichvu) {
	this.dichvu = dichvu;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
@Override
public String toString() {
	return "LienHe [Ten=" + Ten + ", dc=" + dc + ", sdt=" + sdt + ", bando=" + bando + ", chitet=" + chitet
			+ ", cachthuc=" + cachthuc + ", dichvu=" + dichvu + ", email=" + email + "]";
}

}