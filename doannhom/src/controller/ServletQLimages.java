package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ImageDAO;
import models.Images;

/**
 * Servlet implementation class ServletQLimages
 */
@WebServlet("/ServletQLimages")
public class ServletQLimages extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletQLimages() {
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
		
		String luachon = request.getParameter("luachon");
		String imageID = request.getParameter("imageID");
		
		
		switch (luachon) {

		case "updatebaner":
			
			String baner = request.getParameter("baner");
			
		new ImageDAO().update1(new Images(Integer.parseInt(imageID), 0, baner, 2, 1));
			response.sendRedirect("Admin/manager_images.jsp");
			break;
       case "updatelogo":
			
			String logo = request.getParameter("logo");
			
			new ImageDAO().update1(new Images(Integer.parseInt(imageID), 0, logo, 3, 1));
			response.sendRedirect("Admin/manager_images.jsp");
			break;
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
