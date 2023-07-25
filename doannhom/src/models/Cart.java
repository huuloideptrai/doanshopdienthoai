package models;

import java.util.Date;
import java.util.HashMap;
import java.util.Map.Entry;

public class Cart extends MyModel {
private HashMap<Integer , Item> cartHashMap;

public Cart() {
cartHashMap= new HashMap<>();
}

public Cart(HashMap<Integer, Item> cartHashMap) {
	super();
	this.cartHashMap = cartHashMap;
}

public HashMap<Integer, Item> getCartHashMap() {
	return cartHashMap;
}

public void setCartHashMap(HashMap<Integer, Item> cartHashMap) {
	this.cartHashMap = cartHashMap;
}
//theem vao gio hang
public void addtocart(int key,Item item){
	boolean check= cartHashMap.containsKey(key);
	if(check){
		int soluong= item.getQuantity();
		item.setQuantity(soluong+1);
		cartHashMap.put(key, item);
		
	}else{
		cartHashMap.put(key, item);
	}
}

//xoa khoi gio hang

public void  removetocart(int key){
	boolean check= cartHashMap.containsKey(key);
	if(check){
		cartHashMap.remove(key);
		
	}
		

	
}	//giam soluongmua



public void giamslmua(int key, Item item){
	boolean check= cartHashMap.containsKey(key);
	if(check){
		int soluong= item.getQuantity();
		if(soluong<=1){
			cartHashMap.remove(key);
		}else{
			item.setQuantity(soluong-1);
			cartHashMap.put(key,	 item);
		}
		
		
		item.setQuantity(soluong);
	}
}
//dem so loai san pham
public int demItem(){
	return cartHashMap.size();
	
}
// tong tien phai tra
public int tongtien(){
	int dem=0;int gia;
for (Entry<Integer, Item> list	 : cartHashMap.entrySet()) {
	if(list.getValue().getProduct().getPriority()>0){
	 gia=list.getValue().getProduct().getPrice()-(list.getValue().getProduct().getPrice()*list.getValue().getProduct().getPriority()/100);
	}
	else{
		 gia=list.getValue().getProduct().getPrice();
		
	}
	dem+= gia*list.getValue().getQuantity();
	
}
return dem;

}//thay đổi soluong mua
public void doislmua(int key, Item item,int slm){
	boolean check= cartHashMap.containsKey(key);
	if(check){
	
			item.setQuantity(slm);
			cartHashMap.put(key,	 item);

	}
	
}
public int sosanphammua(){
	int dem=0;
for (Entry<Integer, Item> list	 : cartHashMap.entrySet()) {
	
	dem+= list.getValue().getQuantity();
}
return dem;

}

public void doislmua(int id, int sl) {
	boolean check= cartHashMap.containsKey(id);
	
		if(check){
//			System.out.println(cartHashMap.getValue().getQuantity());
//			list.setValue(new Item(list.getValue().getProduct(),sl));
			Product p=cartHashMap.get(id).getProduct();
	cartHashMap.put(id, new Item(p,sl));
	}
	}
	
		
		
		
		
	

public static void main(String[] args) {
	Cart c= new Cart();
	
	Product p= new Product(123, "1312", 1, 123, 123, new Date(2010, 2, 1), 123, "123", "12312", "123", 12, "123", 123);
	c.addtocart(123, new Item(p,10));
	p.setMaterial("vaichuoi");
	c.addtocart(1234, new Item(p,2));
	p.setMaterial("thoiroi");
	c.addtocart(12345, new Item(p, 2));
	for (Entry<Integer, Item> list	 : c.cartHashMap.entrySet()) {
		
			System.out.println(list.getValue().getQuantity());
	}
	c.doislmua(123, 123);
}
	
}


