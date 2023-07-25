package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class Servletcheckmailresetpw
 */
@WebServlet("/Servletcheckmailresetpw")
public class Servletcheckmailresetpw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  UserDAO userDAO= new UserDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servletcheckmailresetpw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		 try {
				if (userDAO.checkEmail(request.getParameter("ten").trim())) {
				      response.getWriter().write("ok");
				      
				      
				 } else {
				      response.getWriter().write("Email này không có trong hệ thống");
				 }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
