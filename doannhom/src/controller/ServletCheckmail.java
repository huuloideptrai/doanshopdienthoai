package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class ServletCheckmail
 */
@WebServlet("/ServletCheckmail")
public class ServletCheckmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UserDAO userDAO= new UserDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCheckmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
//	        
//		 try {
//			if (userDAO.checkEmail(request.getParameter("username"))) {
//			      response.getWriter().write("Email đã tồn tại");
//			 } else {
//			      response.getWriter().write("ok");
//			 }
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
			
		 try {
				if (userDAO.checkEmail(request.getParameter("ten"))) {
				      response.getWriter().write("ok");
				 } else {
				      response.getWriter().write("Email này không có trong hệ thống");
				 }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		 
	}

}
