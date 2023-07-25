package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MakerDAO;
import models.Maker;

/**
 * Servlet implementation class ServletQLmaker
 */
@WebServlet("/ServletQLmaker")
public class ServletQLmaker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       MakerDAO makerDAO= new MakerDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletQLmaker() {
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
			String makerID=request.getParameter("makerID");
			switch (luachon) {
			
			case "delete":
	        makerDAO.delete(Integer.parseInt(makerID));
				response.sendRedirect("Admin/manager_maker.jsp");
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
		
		String luachon = request.getParameter("luachon");
		System.out.println(luachon);
		
		String ten= request.getParameter("ten");
	 String sdt= request.getParameter("sdt");
		String email= request.getParameter("email");
		String dc= request.getParameter("dc");
		boolean check=true;
	//	String url="",error="",error1="",error2="";
		if(ten.length()==0){
			request.setAttribute("eten", "đồ ngốc không nhập tên  à");
			check=false;
		}
		if(dc.length()==0){
			request.setAttribute("edc", "đồ ngốc không nhập dc à");
			check=false;
		}
		if(email.length()==0){
		
			request.setAttribute("eemail", "đồ ngốc không nhập mail à");
			check=false;
		}
		
		try {
			if(sdt.length()==10||sdt.length()==11){
			Integer.parseInt(sdt);
			}
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("esdt", "đồ ngốc  nhập sai sdt r");
			check=false;
		}
		
	
			if(check){
				int i = (int) new Date().getTime();
				switch (luachon) {
				case "insert":
				
					makerDAO.insert(new Maker(i, ten, Integer.parseInt(sdt), email, dc));
					response.sendRedirect("Admin/manager_maker.jsp");
					break;
				case "update":
					String makerID=request.getParameter("makerID");
					System.out.println(makerID);
					makerDAO.update(new Maker(Integer.parseInt(makerID), ten, Integer.parseInt(sdt), email, dc));
					response.sendRedirect("Admin/manager_maker.jsp");
					break;
			
		} 
			
		}
			else{
				
				request.getRequestDispatcher("Admin/insert_maker.jsp").forward(request, response);
			}
			
		
		
	}


	
}
