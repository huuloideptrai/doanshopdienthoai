package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import models.User;
import tools.MD5;
import tools.Sendmail;

/**
 * Servlet implementation class ServletUser
 */
@WebServlet("/ServletUser")
public class ServletUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UserDAO userDAO= new UserDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String luachon = request.getParameter("luachon");
		String userID=request.getParameter("userID");
		switch (luachon) {
		
		case "delete":
			
		userDAO.delete(Integer.parseInt(userID));
		response.sendRedirect("Admin/manager_user.jsp");
		break;
		case "deleteadmin":
			
			userDAO.delete(Integer.parseInt(userID));
			response.sendRedirect("Admin/manager_adminmod.jsp");
			break;
		case "logout":
			session.removeAttribute("user");
			session.removeAttribute("cart");
			response.sendRedirect("index.jsp");
			break;
		
		
		}
		
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		 
	String luachon= request.getParameter("luachon");
	String ma=request.getParameter("ma");
	String userID=request.getParameter("userID");
	String name=request.getParameter("name");
	String pw=request.getParameter("pw");
	String pw1=request.getParameter("pw1");
	String pw0=request.getParameter("pw0");
	String pw2=request.getParameter("pw2");
	
	String email=request.getParameter("email");
	String sex=request.getParameter("sex");
	String address=request.getParameter("address");
	String sdt=request.getParameter("sdt");
	//String admin=request.getParameter("admin");
	//User u1=(User)request.getAttribute("user");
	String m= request.getParameter("mail");
	User u = new User();


	switch (luachon) {
	case "register":
		
		int id = (int) new Date().getTime();
		u= new User(id, name, email, MD5.encryption(pw), 
				"ko biet", 1, sdt, 0,0);
		
       userDAO.insert(u);
      
	
		
//		System.out.println(u.getEmail());
       Sendmail.sendMail(u.getEmail(), "Shop manga minh minh ", "xin chào "+name +"vui long nhấp vào link dưới và nhập mã để xác nhận "
				
				+"mã xác nhận của bạn là :"+u.getUserID()
				
				+"           http://"+request.getServerName()+"/taothu/activemail.jsp?mail="+u.getEmail()+""
				);
		
	System.out.println(request.getServerName());	
	System.out.println(request.getLocalAddr());
	System.out.println(request.getLocalPort());
	System.out.println(request.getLocale());
	//	session.setAttribute("user", u);
		String url="/taothu/activemail.jsp?mail="+u.getEmail();
		response.sendRedirect(url);
		break;
	case "login":
		
		try {
			System.out.println(request.getParameter("email"));
			System.out.println(request.getParameter("password"));
			u= userDAO.login(request.getParameter("email"), MD5.encryption(request.getParameter("password")));
			if(u!=null){
				System.out.println("dung tk roi");
				session.setAttribute("user", u);
				if(userDAO.checkuseradmin(u)){
					response.sendRedirect("index.jsp");
				}else{
				response.sendRedirect("index.jsp");}
			}
			else{
				System.out.println("sai tk roi");
				session.setAttribute("err", "username  or pass không đúng goy");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("sai tk roi");
			session.setAttribute("err", "username  or pass không đúng goy");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			e.printStackTrace();
		}
		break;
		
	case "insert":
		 id = (int) new Date().getTime();
		userDAO.insert(new User( id, name, email, MD5.encryption(pw), address, Integer.parseInt(sex), sdt, 0,0));
		System.out.println("da chen nha");
		response.sendRedirect("Admin/manager_user.jsp");
		break;
		
	case "update":
		System.out.println(userID);
		userDAO.update(new User(Integer.parseInt(userID), name, email, MD5.encryption(pw), address, Integer.parseInt(sex), sdt, 0,0));
		
		response.sendRedirect("Admin/manager_user.jsp");
		break;
	case "insertadmin":
		 id = (int) new Date().getTime();
		userDAO.insert(new User( id, name, email, MD5.encryption(pw), address, Integer.parseInt(sex), sdt,1, 1));
		System.out.println("da chen nha");
		response.sendRedirect("Admin/manager_adminmod.jsp");
		break;
		
	case "updateadmin":
		System.out.println(userID);
		userDAO.updateadmin(new User(Integer.parseInt(userID), name, email, "da ma hoa ko cho xem", address, Integer.parseInt(sex), sdt, 1,1));
		
		response.sendRedirect("Admin/manager_adminmod.jsp");
		break;
		
		
	case "active":
		System.out.println(ma);
		System.out.println(m);
		if(	userDAO.ck(Integer.parseInt(ma),m)){
			System.out.println("cos thang nay");
			if(userDAO.active(Integer.parseInt(ma))){
				response.sendRedirect("index.jsp");
			}else{
				System.out.println("ma xac nhan sai");
				request.getRequestDispatcher("activemail.jsp").forward(request, response);
			}
			
		}else{
			System.out.println("ko co thang nay");
			request.getRequestDispatcher("activemail.jsp").forward(request, response);
		}
		
break;
		
	case "doimk":
		System.out.println(pw);
		System.out.println(pw2);
		System.out.println(pw1);
		try {
			
			User ad= (User) userDAO.getModel(Integer.parseInt(userID));
			if(userDAO.login1(userID, MD5.encryption(pw))){
				System.out.println("ok cho đổi");
				userDAO.update(new User(Integer.parseInt(userID), name, email, MD5.encryption(pw1), address, Integer.parseInt(sex), sdt, 1,ad.getAdmin()));
				response.sendRedirect("TTuser.jsp");
			}else{
				request.getRequestDispatcher("Doittcanhan.jsp").forward(request, response);
				System.out.println("sai mk cũ r");
			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getRequestDispatcher("Doittcanhan.jsp").forward(request, response);
			System.out.println("sai mk cũ r");
		}
		
		break;
		
	case "resetpass":
		System.out.println(luachon);
		if(email!=null){
			System.out.println(email);
			
			try {
				if(userDAO.resetpass(email)!=null){
	
					Sendmail.sendMail(email, "Shop manga minh minh kính chào quý khách ", 
					"chúng tôi nhận đc yêu cầu đổi mật khẩu từ bạn bạn có thể nhấn link bên dưới để tiếp xác nhận "
					+"mã xác nhận của bạn là : "+ userDAO.resetpass(email)
							+"  http://"+request.getServerName()+"/taothu/activemail2.jsp?mail="+email+""
					+" nếu không phải là bạn yêu cầu hay bỏ qua tin nhắn này"
										
					);	
			
				request.setAttribute("re", "yêu cầu thành công vui lòng kiểm tra email của bạn ");
				
				request.getRequestDispatcher("resetpass.jsp").forward(request, response);
}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				request.setAttribute("e", "emaial ko tôn tại");
				request.getRequestDispatcher("resetpass.jsp").forward(request, response);
				e.printStackTrace();
			}}else{
				request.getRequestDispatcher("resetpass.jsp").forward(request, response);
				request.setAttribute("e", "nhập email vào đi chế");
			}
		
		break;
	case "active1":
		System.out.println(ma);
		System.out.println(m);
		
		
		try {
			User user= new UserDAO().login(m, ma);
			
			if(user!=null){
				int pas=(int) new Date().getTime();
				System.out.println("dung ma r");
				Sendmail.sendMail(m, "Shop manga minh minh kính chào quý khách ", 
						"mật khẩu đăng nhập của bạn là :  "+pas+""
						);	
				user.setPassword(MD5.encryption(pas+""));
				userDAO.update(user);
				
				
				
				response.sendRedirect("resetpasstc.jsp");
			}
			else{
				
				
				request.getRequestDispatcher("activemail2.jsp").forward(request, response);
				System.out.println("ma xa nhạn bị sai");
				request.setAttribute("e", " mã xác nhận không đúng");	
			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 	
break;
		
	}
	
	if(pw0!=null&&pw2!=null){
		if(request.getParameter("pw0").equals(pw2)){
			   response.getWriter().write("ok");
		 } else {
		      response.getWriter().write("Mật khẩu ko khớp");
		 }
	}

	
	
	}
	
	
	}


