package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IDAO;
import dao.ImageDAO;
import dao.ProductDAO;
import models.Images;
import models.Product;

/**
 * Servlet implementation class ServletQLsanpham
 */
@WebServlet("/ServletQLsanpham")
public class ServletQLsanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// location to store file uploaded

	ProductDAO productDAO = new ProductDAO();
	  IDAO imageDAO= new ImageDAO();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletQLsanpham() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String luachon = request.getParameter("luachon");
		String productID = request.getParameter("productID");
		switch (luachon) {

		case "delete":
			productDAO.delete(Integer.parseInt(productID));
			response.sendRedirect("Admin/manager_product.jsp");
			break;

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String luachon = request.getParameter("luachon");
		System.out.println(luachon);
		String productID = request.getParameter("productID");
		System.out.println(productID);
		String tensanpham = request.getParameter("tensanpham");
		System.out.println(tensanpham);
		String madanhmuc = request.getParameter("madanhmuc");
		System.out.println(madanhmuc);
		String priority = request.getParameter("priority");
		System.out.println(priority.trim());
		String gia = request.getParameter("gia");
		System.out.println(gia.trim());
		String anhien = request.getParameter("anhien");
		System.out.println(anhien);
		String mota = request.getParameter("mota");
		System.out.println(mota);
		String soluong = request.getParameter("total");
		System.out.println(soluong.trim());
		String mausac = request.getParameter("color");
		System.out.println(mausac);
		String chatlieu = request.getParameter("chatlieu");
		System.out.println(chatlieu);
		String kichco = request.getParameter("size");
		System.out.println(kichco);
		String maker = request.getParameter("maker");
		System.out.println(maker);
		String link = request.getParameter("link");
		System.out.println(link);
		String link1 = request.getParameter("link1");
		System.out.println(link1);
		String link2 = request.getParameter("link2");
		System.out.println(link2);
	
		boolean check = true;
		int ktlink=0;
		// String url="",error="",error1="",error2="";
		if (link.length() == 0) {
			request.setAttribute("erlink", "đồ ngốc bạn phải thêm tối thiểu 1 ảnh đại diện");
			check = false;
		}
		if (link1.length() == 0) {
			ktlink=1;
		}if (link2.length() == 0) {
			ktlink=2;
		}
		
		if (tensanpham.length() == 0) {
			request.setAttribute("e1", "đồ ngốc không nhập tên sản phẩm à");
			check = false;
		}
		if (madanhmuc.length() == 0) {
			request.setAttribute("e2", "đồ ngốc không nhập ma vào à");
			check = false;
		}
		if (priority.length() == 0) {
			request.setAttribute("e3", "đồ ngốc không nhập à");
			check = false;
		}
		if (gia.length() == 0) {
			request.setAttribute("e4", "đồ ngốc không nhập à");
			check = false;
		}
		if (anhien.length() == 0) {
			request.setAttribute("e5", "đồ ngốc không nhập  à");
			check = false;
		}
		if (mota.length() == 0) {

			request.setAttribute("e6", "đồ ngốc không nhập mô tả à");
			check = false;
		}

		try {
			int s = Integer.parseInt(anhien);
			if (!(s == 0 || s == 1)) {

				request.setAttribute("e5", "nhap 0 or 1 nha đồ ngốc");
				check = false;
			}

		} catch (Exception e) {
			request.setAttribute("e5", "không phải số");
			check = false;
		}
		try {
			Integer.parseInt(madanhmuc);

		} catch (Exception e) {
			request.setAttribute("e2", "không phải số");
			check = false;
		}

		try {
			Integer.parseInt(priority);

		} catch (Exception e) {
			request.setAttribute("e3", "không phải số");
			check = false;
		}

		try {
			Integer.parseInt(gia);

		} catch (Exception e) {
			request.setAttribute("e4", "không phải số");
			check = false;
		}

		// if(check){
		//
		// switch (luachon) {
		// int rd= new Random().nextInt(1000);
		// case "insert":
		//
		// int g= Integer.parseInt(gia);
		// int ma= Integer.parseInt(madanhmuc);
		// int hide= Integer.parseInt(anhien);
		// int pp= Integer.parseInt(priority);
		// Date d= new Date(1996, 3, 25);
		// productDAO.insert(new Product(rd, tensanpham,ma, pp, g,(Date) d,
		// hide, mota));
		// response.sendRedirect("manager_product.jsp");
		// break;
		// case "update":
		//
		// g= Integer.parseInt(gia);
		// ma= Integer.parseInt(madanhmuc);
		// hide= Integer.parseInt(anhien);
		// pp= Integer.parseInt(priority);
		// d= new Date(1996, 3, 25);
		// productDAO.update(new Product(Integer.parseInt(productID),
		// tensanpham,ma, pp, g, d, hide, mota));
		// response.sendRedirect("manager_product.jsp");
		// break;
		//
		// }
		//
		//
		//
		//
		//
		// }
		//
		//

		if (check) {
			// int rd= new Random().nextInt(1000);
			java.sql.Date d = new java.sql.Date(new Date().getTime());
			switch (luachon) {
			case "insert":
				int i = (int) new Date().getTime();
				Product p = new Product(i, tensanpham, Integer.parseInt(madanhmuc), Integer.parseInt(priority),
						Integer.parseInt(gia), d, Integer.parseInt(anhien), mota, chatlieu, kichco,
						Integer.parseInt(soluong), mausac,Integer.parseInt(maker));

				// System.out.println(p.getLastupdate());
				// System.out.println(p.getProductName());
				// System.out.println(p.getDescription());
				productDAO.insert(p);
				
			
				imageDAO.insert(new Images(0,i, link, 1, 1));
				
				
				if(ktlink!=1){
				imageDAO.insert(new Images(0, i, link1, 0, 1));}
				if(ktlink!=2){
				imageDAO.insert(new Images(0, i, link2, 0, 1));}
				
				System.out.println("da chen");
				System.out.println(p.toString());

				response.sendRedirect("Admin/manager_product.jsp");
				break;
			case "update":
				
				
				String id1 = request.getParameter("id1");
				System.out.println(id1);
				
		      
				
				
					String id2 = request.getParameter("id2");
					System.out.println("id2 là "+id2);
					 String id3 = request.getParameter("id3");
						System.out.println("id3 là"+id3);
				
						if (id2.equals("0")&&link1.length() == 0) {
							ktlink=3;
						}if (id3.equals("0")&&link2.length() == 0) {
							ktlink=4;
						}
				System.out.println("dang up doi ti");
				productDAO.update(new Product(Integer.parseInt(productID), tensanpham, Integer.parseInt(madanhmuc),
						Integer.parseInt(priority), Integer.parseInt(gia), d, Integer.parseInt(anhien), mota, chatlieu,
						kichco, Integer.parseInt(soluong), mausac,Integer.parseInt(maker)));
//				response.sendRedirect("Admin/upImage.jsp?productID=" + i + "");
				imageDAO.update(new Images(Integer.parseInt(id1),Integer.parseInt(productID), link, 1, 1));
				
				if(ktlink!=3){
					System.out.println("tui dang up hinh 2");
					imageDAO.update(new Images( Integer.parseInt(id2),Integer.parseInt(productID), link1, 0, 1));}
					if(ktlink!=4){
						System.out.println("tui dang up hinh 3");
					imageDAO.update(new Images(Integer.parseInt(id3),Integer.parseInt(productID), link2, 0, 1));}
				
				System.out.println("da up");
				response.sendRedirect("Admin/manager_product.jsp");
				break;

			}

		}

		else {

			request.getRequestDispatcher("Admin/insert_product.jsp").forward(request, response);
		}

	}

}
