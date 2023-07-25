package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChartDAO;
import dao.IDAO;

/**
 * Servlet implementation class ServletChart
 */
@WebServlet("/ServletChart")
public class ServletChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       IDAO charDAO= new ChartDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletChart() {
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
				request.setAttribute("listItem", charDAO.getListModel() );
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//ChartDAO c=(ChartDAO)charDAO;
		//request.setAttribute("list", c.in(c.getListModel()) );
//	
//		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/chart.jsp");
//	      
//	      // Chuyển tiếp yêu cầu, để hiển thị trên trang JSP.
//	      dispatcher.forward(request, response);
 response.sendRedirect("taothu/Admin/chart.jsp");
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
