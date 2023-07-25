

<%@page import="models.User"%>
<%
	request.setCharacterEncoding("utf-8");

	response.setCharacterEncoding("utf-8");
	
	 User user= (User) session.getAttribute("user");
	 if(user==null){
		 response.sendRedirect("login.jsp");
	 }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="login">

	<div class="main-agileits">

							<h3 class="hdg wow fadeInUp animated" data-wow-delay=".5s">Thông tin cá nhân</h3>
							<ul class="list-group wow fadeInUp animated" data-wow-delay=".5s">
							  <li class="list-group-item">Họ và tên : <%=user.getUsername() %></li>
							  <li class="list-group-item">Email     : <%=user.getEmail() %> </li>
							   <li class="list-group-item">Giới tính :<%=user.getSex() %></li>
							  <li class="list-group-item">Số điện thoại : <%=user.getPhone()%></li>
							  <li class="list-group-item">Địa chỉ   :<%=user.getAddress() %></li>
							 
							</ul>

				
				<a href="Doittcanhan.jsp"><input  type="button" value="Chỉnh sửa thông tin "></a>
	
		</div>

</div>


<jsp:include page="footer.jsp"></jsp:include>

