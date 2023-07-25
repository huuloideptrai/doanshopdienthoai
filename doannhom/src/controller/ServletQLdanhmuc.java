package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import models.Category;

/**
 * Servlet implementation class ServletQLdanhmuc
 */
@WebServlet("/ServletQLdanhmuc")
public class ServletQLdanhmuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       CategoryDAO categoryDAO = new CategoryDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletQLdanhmuc() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String luachon = request.getParameter("luachon");
		String categoryID=request.getParameter("categoryID");
		switch (luachon) {
		
		case "delete":
        categoryDAO.delete(Integer.parseInt(categoryID));
			response.sendRedirect("Admin/manager_category.jsp");
			break;
} 
    	
  }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		
		String luachon = request.getParameter("luachon");
		System.out.println(luachon);
		String categoryID=request.getParameter("categoryID");
		System.out.println(categoryID);
		String tendanhmuc= request.getParameter("tendanhmuc");
	 String anhien= request.getParameter("anhien");
		String mota= request.getParameter("mota");
		boolean check=true;
	//	String url="",error="",error1="",error2="";
		if(tendanhmuc.length()==0){
			request.setAttribute("error", "đồ ngốc không nhập tên danh mục à");
			check=false;
		}
		if(mota.length()==0){
		
			request.setAttribute("error2", "đồ ngốc không nhập mota à");
			check=false;
		}
		
		
		
		try {
			int s =Integer.parseInt(anhien);
			if(!(s==0||s==1)){
				
				request.setAttribute("error1","nhap 0 ỏ 1 nha đồ ngốc" );
				check=false;}
			
		} catch (Exception e) {
			request.setAttribute("error1", "không phải số");
			check = false;
		}
	
			if(check){
				int	 id = (int) new Date().getTime();
				switch (luachon) {
				case "insert":
				
					categoryDAO.insert(new Category(id, tendanhmuc, mota, Integer.parseInt(anhien)));
					response.sendRedirect("Admin/manager_category.jsp");
					break;
				case "update":
			
					categoryDAO.update(new Category(Integer.parseInt(categoryID),tendanhmuc, mota, Integer.parseInt(anhien)));
					response.sendRedirect("Admin/manager_category.jsp");
					break;
			
		} 
			
		}
			else{
				
				request.getRequestDispatcher("Admin/insert_category.jsp").forward(request, response);
			}
			
		
		
	}

}
