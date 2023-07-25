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
@WebServlet("/ServletCheckmailRegister")
public class ServletCheckmailRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UserDAO userDAO= new UserDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCheckmailRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        
	        
			 try {
				if (userDAO.checkEmail(request.getParameter("username").trim())) {
				      response.getWriter().write("Email đã tồn tại");
				 } else {
				      response.getWriter().write("ok");
				 }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        
	        
	    doGet(request, response);
		
		 
	}

}
