package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import dao.OrderdetailDAO;
import dao.ProductDAO;
import models.Product;
import models.Thongke;
import tools.Sendmail;

/**
 * Servlet implementation class ServletQLdonhang
 */
@WebServlet("/ServletQLdonhang")
public class ServletQLdonhang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       OrderDAO orderDAO = new OrderDAO();
       ProductDAO productDAO= new ProductDAO();
       OrderdetailDAO orderdetailDAO= new OrderdetailDAO();
       ArrayList<Thongke> ltk;
       Sendmail sendmail= new Sendmail();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletQLdonhang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		String luachon = request.getParameter("luachon");
		String orderID=request.getParameter("orderID");
     	
		String email=request.getParameter("email");
		String text;
		switch (luachon) {
		
		case "delete":
			
    text="<h4 style=\"color:red;\"> YÊU CẦU HỦY ĐƠN HÀNG :"+orderID+" CỦA QUÝ KHÁCH THÀNH CÔNG    </h4><h4 style=\"color:green;\"> XIN CHÀO VÀ HẸN GẶP LẠI </h4>";
			

	ltk=  orderdetailDAO.sosanphammuatheo(Integer.parseInt(orderID));
	for (int i = 0; i < ltk.size(); i++) {
		Thongke k= ltk.get(i);
	Product  pro=(Product)productDAO.getModel(Integer.parseInt(k.getTen()));
		productDAO.updatesoluong(Integer.parseInt(k.getTen()), pro.getTotal()+k.getSoluong());
		
	}
	
    
    
  
       orderDAO.delete(Integer.parseInt(orderID));
       orderDAO.deletetheodonhang(Integer.parseInt(orderID));
      
       sendmail.sendMail(email, "Shop MANGA XIN CHÀO QUÝ KHÁCH", text);
       
       
			response.sendRedirect("Admin/manager_order.jsp");
			break;
		case "active":
			 text="<h4 style=\"color:red;\"> CẢM ƠN QUÝ KHÁCH ĐÃ MUA HÀNG TẠI SHOP CHÚNG TÔI</h4> <h4 style=\"color:red;\"> CHÚC QUÝ KHÁCH MỘT NGÀY VUI VẺ </h4> <h4 style=\"color:red;\"> XIN CẢM ƠN VA HẸN GẶP LẠI </h4>";
			
			 sendmail.sendMail(email, "Shop MANGA XIN CHÀO QUÝ KHÁCH", text);		
				
			 orderDAO.active(Integer.parseInt(orderID));
				response.sendRedirect("Admin/manager_order.jsp");
			break;
				
		case "danggiao":
			 text="<h4 style=\"color:red;\"> NHÂN VIÊN  CHÚNG TÔI ĐANG GIAO HÀNG</h4> <h4 style=\"color:red;\">  NẾU KHÔNG NHẬN ĐƯỢC HÀNG XIN LIÊN HỆ BẰNG DICH VỤ TƯ VẤN TRÊN WEB HOẶC  </h4> <h4 style=\"color:red;\">SỐ ĐIỆN THOẠI 01658240006 </h4>";
									
			

				 ltk=  orderdetailDAO.sosanphammuatheo(Integer.parseInt(orderID));
				for (int i = 0; i < ltk.size(); i++) {
					Thongke k= ltk.get(i);
				Product  pro=(Product)productDAO.getModel(Integer.parseInt(k.getTen()));
					productDAO.updatesoluong(Integer.parseInt(k.getTen()), pro.getTotal()-k.getSoluong());
					
				}
				
				
			 orderDAO.danggiao(Integer.parseInt(orderID));
			 sendmail.sendMail(email, "Shop MANGA XIN CHÀO QUÝ KHÁCH", text);	
				response.sendRedirect("Admin/manager_order.jsp");
			
				
				break;
		case "chuaxem":
			
				 orderDAO.chuaxem(Integer.parseInt(orderID));
				response.sendRedirect("Admin/manager_order.jsp");
				break;
				
				
} 
    	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
