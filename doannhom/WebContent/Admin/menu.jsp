<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<title>menu</title>

</head>
	<%
	User u=null;
	if(session.getAttribute("user")!=null){
				 u=(User)session.getAttribute("user");}
			%>
<body  class="dashboard-page" >



<nav class="main-menu">
		<ul>
			<li>
				<a href="${root}/taothu/Admin/index.jsp">
					<i class="fa fa-home nav_icon"></i>
					<span class="nav-text">
					Trang chủ
					</span>
				</a>
			</li>
		
			<%
			
			if(u!=null){%>
			
			
				<li>
				<a href="${root}/taothu/Admin/manager_order.jsp">
					<i class="fa fa-bar-chart nav_icon"></i>
					<span class="nav-text">
					 Quản lí đơn hàng
					</span>
				</a>
			</li>
			
			<li>
				<a href="${root}/taothu/Admin/manager_category.jsp">
					<i class="icon-font nav-icon"></i>
					<span class="nav-text">
					Quản lí danh mục
					</span>
				</a>
			</li>
			<li>
				<a href="${root}/taothu/Admin/manager_product.jsp">
					<i class="icon-table nav-icon"></i>
					<span class="nav-text">
					Quản lí sản phẩm
					</span>
				</a>
			</li>
			
				<li>
				<a href="${root}/taothu/Admin/chart.jsp">
					<i class="icon-font nav-icon"></i>
					<span class="nav-text">
					Thống kê
					</span>
				</a>
			</li>
			<li>
				<a href="${root}/taothu/Admin/manager_user.jsp">
					<i class="icon-font nav-icon"></i>
					<span class="nav-text">
					Quản lí khách hàng
					</span>
				</a>
			</li>
			
			<%
			if(u.getAdmin()==9){ %>
			
			<li>
				<a href="${root}/taothu/Admin/manager_images.jsp">
					<i class="fa fa-bar-chart nav_icon"></i>
					<span class="nav-text">
					 Quản lí Hình ảnh
					</span>
				</a>
			</li>
			
			
			<% }}%>
	</ul>
		<ul class="logout">
			<li>
			<a href="${root}/taothu/ServletUser?luachon=logout">
			<i class="icon-off nav-icon"></i>
			<span class="nav-text">
			Đăng Xuất
			</span>
			</a>
			</li>
		</ul>
	</nav>

</body>
</html>