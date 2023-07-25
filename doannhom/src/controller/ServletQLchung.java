package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LienheDAO;
import models.LienHe;

/**
 * Servlet implementation class ServletQLdanhmuc
 */
@WebServlet("/ServletQLchung")
public class ServletQLchung extends HttpServlet {
	private static final long serialVersionUID = 1L;
       LienheDAO lienheDAO = new LienheDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletQLchung() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		
		String luachon = request.getParameter("luachon");
		System.out.println(luachon);
		
		
		String ten= request.getParameter("ten");
		System.out.println(ten);
	    String dc= request.getParameter("dc");
	    System.out.println(dc);
	    String bando= request.getParameter("bando");
	    System.out.println(bando);
		String email= request.getParameter("email");
		String sdt= request.getParameter("sdt");
		System.out.println(sdt);
		String chitiet= request.getParameter("chitiet");
		System.out.println(chitiet);
		String cachthuc= request.getParameter("cachthuc");
		System.out.println(cachthuc);
		String dichvu= request.getParameter("dichvu");
		System.out.println(dichvu);
		
		
		boolean check=true;
	//	String url="",error="",error1="",error2="";
		if(ten.length()==0){
			request.setAttribute("eten", "đồ ngốc không nhập tên à");
			check=false;
		}
		if(dc.length()==0){
		
			request.setAttribute("edc", "đồ ngốc không nhập  à");
			check=false;
		}
		if(chitiet.length()==0){
			
			request.setAttribute("echitiet", "đồ ngốc không nhập  à");
			check=false;
		}
		if(email.length()==0){
			
			request.setAttribute("eemail", "đồ ngốc không nhập  à");
			check=false;
		}
		if(dichvu.length()==0){
			
			request.setAttribute("dichvu", "đồ ngốc không nhập  à");
			check=false;
		}
		
		
		
		try {
			int s =Integer.parseInt(sdt);
			if(sdt.length()!=10){
				if(sdt.length()!=11){
					char[]a=sdt.toCharArray();
					if(a[0]==0){
					request.setAttribute("esdt", "không phải số sdt");
					check = false;}
				}}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("esdt", "không phải số");
		}
			
		
	
			if(check){
				
				switch (luachon) {
				
				case "update":
			
					lienheDAO.update(new LienHe(ten, dc, Integer.parseInt(sdt), bando, chitiet, cachthuc, dichvu, email));
					
					response.sendRedirect("Admin/index.jsp");
					break;
			
		} 
			
		}
			else{
				
				request.getRequestDispatcher("Admin/manager_chung.jsp").forward(request, response);
			}
			
		
		
	

	

    	
  }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
