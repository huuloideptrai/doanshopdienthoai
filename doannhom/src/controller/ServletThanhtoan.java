package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IDAO;
import dao.OrderDAO;
import dao.OrderdetailDAO;
import models.Cart;
import models.Item;
import models.Order;
import models.Orderdetail;
import models.User;
import tools.Sendmail;

/**
 * Servlet implementation class ServletThanhtoan
 */
@WebServlet("/ServletThanhtoan")
public class ServletThanhtoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       IDAO orderDAO= new OrderDAO();
       IDAO orderdetailDAO= new OrderdetailDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletThanhtoan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        String luachon= request.getParameter("luachon");
	     
	        switch (luachon) {
	        
	        
			case "checkout":  
	        System.out.println(luachon);
	        
	int i,o,p;
	String e1,mau,kthuoc;
	String tensp;
	ArrayList<String> lh= new ArrayList<>();
		String name= request.getParameter("name");
		String phone= request.getParameter("phone");
		String address= request.getParameter("address");
		HttpSession session = request.getSession();
		Cart cart= (Cart)session.getAttribute("cart");
		User user= (User)session.getAttribute("user");
		System.out.println(user.toString());
		try {
			java.sql.Date d= new java.sql.Date(new Date().getTime());
			int sdt= Integer.parseInt(phone);
			Order order= new Order();
		int	 id = (int) new Date().getTime();
			order.setOrderID(id);
			order.setUserID(user.getUserID());
			order.setDatecreate(d);
			order.setStatus(sdt);
			order.setTotal(cart.tongtien());
			order.setPay(address);
			order.setHide(0);
			orderDAO.insert(order);
		lh.add("<table border=\"1\" bordercolor=\"green\" width=\"100%\"><tr><th >Sản phẩm</th><th>Số lượng</th><th>Chất liệu</th><th>Màu sắc</th><th>Kích thước</th><th>Giá tiền</th></tr>");
			System.out.println(cart.demItem());
			for(Entry<Integer, Item> list :cart.getCartHashMap().entrySet()){
				tensp=list.getValue().getProduct().getProductName();
				
				i= list.getValue().getProduct().getProductID();
				o=list.getValue().getQuantity();
				e1=list.getValue().getProduct().getMaterial();
				mau=list.getValue().getProduct().getColor();
				kthuoc=list.getValue().getProduct().getSize();
				p=list.getValue().getProduct().getPrice()-(list.getValue().getProduct().getPrice()*list.getValue().getProduct().getPriority()/100);
				orderdetailDAO.insert(new Orderdetail(0,id,i,o,p,e1,mau,kthuoc)); 
				
				lh.add("<tr><td >"+tensp+"</td><td >"+o+"</td><td >"+e1+"</td><td >"+mau+"</td><td >"+kthuoc+"</td><td >"+p+"</td></tr>");
				System.out.println("da them san pham vao table");
			}
			lh.add("</table>");
	
			System.out.println(user.getEmail());
			Sendmail.sendMail(user.getEmail(), "Shop manga minh minh ", "<h4 style=\"color:green;\">Xin chào "+name +" Cảm ơn bạn đã đặt mua hàng từ http://shoptaothu.jelastic.skali.net/taothu/index.jsp  </h4> <br><h4 style=\"color:red;\"> Bạn vừa mua hết số tiền là "
			+cart.tongtien() +"VNĐ </h4>"
			+"<h4 style=\"color:red;\">MÃ ĐƠN HÀNG :"+id+"</h4>"
					+ "<h4 style=\"color:red;\">Ngày Đặt hàng: "+d+"</h4>"
			+intable(lh.toString().split(","))+"<br>"
		+" <h3 style=\"color:red;\">vui lòng giữ mã đơn hàng chúng tôi sẽ liên hệ qua số điện thoại để xác thực đơn hàng </h3>");
//			sendmail.sendMail(user.getEmail(), "shop manga minh minh", "xin chào"+name +" MINH minh shop Cảm ơn bạn đã đặt mua hàng , Bạn vừa mua hết số tiền là "
//			+cart.tongtien() +"\n"
//			+lh.toString()+"\n"
//		+"mã xác nhận đơn hàng của quý khách là:"+ma+"\n vui lòng giữ mã xác thực chúng tôi sẽ liên hệ qua số điện thoại để xác thực đơn hàng");
//			
		
			System.out.println("da gui mai");
			cart= new Cart();
			session.setAttribute("cart", cart);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		response.sendRedirect("index.jsp");
		  break;
	        }
	      
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
//		// TODO Auto-generated method stub
		doGet(request, response);
	}
public static String intable(String[] strings){
	String a="";
	for (int i =0 ; i < strings.length; i++) {
		a+=strings[i];
	}
	 

return a.substring(1, a.length()-1);
}}
