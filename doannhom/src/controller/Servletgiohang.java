package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IDAO;
import dao.ProductDAO;
import models.Cart;
import models.Item;
import models.Product;

/**
 * Servlet implementation class Servletgiohang
 */
@WebServlet("/Servletgiohang")
public class Servletgiohang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       IDAO productdao= new ProductDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servletgiohang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		String productID= request.getParameter("productID");
		String soluong= request.getParameter("soluong");
		System.out.println(soluong);
		String material= request.getParameter("material");
		System.out.println(material);
		String size= request.getParameter("size");
		System.out.println(size);
		String color= request.getParameter("color");
		System.out.println(color);
		String trang=request.getParameter("trang");
		HttpSession session= request.getSession();
		String luachon= request.getParameter("luachon");
		Cart cart= (Cart) session.getAttribute("cart");
		String categoryID= request.getParameter("categoryID");
//	String hangcon=request.getParameter("hangcon");
//	System.out.println(hangcon);
	switch (luachon) {
		case "remove":
		
			try {
				if(cart.demItem()>=2){
				int id= Integer.parseInt(productID);
					cart.removetocart(id);
					System.out.println(cart.demItem());
					String url="checkout.jsp";
					response.sendRedirect(url);
				}else{
					int id= Integer.parseInt(productID);
					cart.removetocart(id);
				String url="index.jsp";
				response.sendRedirect(url);
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
				String url="index.jsp";
				response.sendRedirect(url);
			}
			
	break;
		case "insert":
			try {
				int id= Integer.parseInt(productID);
				System.out.println("chuoi");
					
				Product product= (Product)productdao.getModel(id);
			
				
				
				if(product.getMaterial().split(",").length>0){
				product.setMaterial(product.getMaterial().split(",")[0]);}
				else{
				product.setMaterial("");}
				if(product.getSize().split(",").length>0){
					product.setSize(product.getSize().split(",")[0]);}
					else{
					product.setSize("");}
				if(product.getColor().split(",").length>0){
					product.setColor(product.getColor().split(",")[0]);}
					else{
					product.setColor("");}
				if(cart.getCartHashMap().containsKey(id)){
					
					cart.addtocart(id	,new Item(product, cart.getCartHashMap().get(id).getQuantity()));
				
				}else{
					cart.addtocart(id, new Item(product, 1));
					
				}
				
				int t= Integer.parseInt(trang);
				
			if(t==0){t=1;}
				String url="/taothu/product.jsp?categoryID="+categoryID+"&trang="+t;
				response.sendRedirect(url);
				
				break;
				
				
				
			} catch (Exception e) {
				session.setAttribute("cart", cart);
				String url="/taothu/product.jsp?categoryID="+categoryID+"&trang="+trang;
				response.sendRedirect(url);
				// TODO: handle exception
			}
		case "insert1":
			try {
				int id= Integer.parseInt(productID);
				//int sl= Integer.parseInt(soluong);
				
//				int hangc= Integer.parseInt(hangcon);
//				if(hangc>cart.getCartHashMap().get(id).getQuantity()){
//					
				Product product= (Product)productdao.getModel(id);
				
					product.setMaterial(material);
					product.setSize(size);
					product.setColor(color);
				
				if(cart.getCartHashMap().containsKey(id)){
					if( cart.getCartHashMap().get(id).getProduct().getMaterial().equalsIgnoreCase(material)&&cart.getCartHashMap().get(id).getProduct().getSize().equalsIgnoreCase(size)&&cart.getCartHashMap().get(id).getProduct().getColor().equalsIgnoreCase(color)){
						
						cart.addtocart(id	,new Item(product,cart.getCartHashMap().get(id).getQuantity()));
						
							
					
					}else{
						int dd= (int) new Date().getTime();
						cart.addtocart(dd-id,new Item(product,1));
			
					}
				}else{
					cart.addtocart(id, new Item(product, 1));
					
//				}
				}
			
				String url="single.jsp?productID="+id+"&categoryID="+categoryID;
				response.sendRedirect(url);
				break;
				
				
				
			} catch (Exception e) {
				session.setAttribute("cart", cart);
				String url="single.jsp?productID="+productID+"&categoryID="+categoryID;
						response.sendRedirect(url);
				// TODO: handle exception
			}
			
			
		case "update":
			try {
			
				int id= Integer.parseInt(productID);
				//Product product= (Product)productdao.getModel(id);
				int sl= Integer.parseInt(soluong);
				
			if(sl>0){
				

//				int hangc= Integer.parseInt(hangcon);
//				if(hangc>=sl){
				cart.doislmua(id, sl);
//				}else{
//					cart.doislmua(id,hangc);
//				}
				
				
				String url="checkout.jsp";
				response.sendRedirect(url);}
			else{String url="checkout.jsp";
				request.getRequestDispatcher(url).forward(request, response);
			}
			} catch (Exception e) {
				// TODO: handle exception
				String url="checkout.jsp";
				request.getRequestDispatcher(url).forward(request, response);
			}
			
			break;
			
			
	}
	
	
	
	
	
	
		
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		doGet(request, response);
		
	
	}

}
