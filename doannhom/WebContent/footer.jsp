<%@page import="dao.LienheDAO"%>
<%@page import="models.LienHe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>foooter</title>

</head>

<body >
<%
LienHe l= new LienheDAO().getlienhe();
%>
<div class="footer">
	<div class="container">
		<div class="col-md-3 footer-grids fgd1">
		
		<ul>
			<li>HLK SHOP</li>
			
			<li><a href="#">Đồ án HLK SHOP</a></li>
			<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
			<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
			<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
			<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
		</ul>
		</div>
		<div class="col-md-3 footer-grids fgd2">
			<h4>Thông tin shop</h4> 
			<ul>
				<li><a href="contact.html"> liên hệ</a></li>
				<li><a href="icons.html"> Cách thức mua hàng</a></li>
				<li><a href="typography.html">Chi tiết cửa hàng</a></li>
				<li><a href="faq.html">FAQ's</a></li>
			</ul>
		</div>
		<div class="col-md-3 footer-grids fgd2">
			<h4>Thông tin shop</h4> 
			<ul>
				<li><a href="contact.html"> liên hệ</a></li>
				<li><a href="icons.html"> Cách thức mua hàng</a></li>
				<li><a href="typography.html">Chi tiết cửa hàng</a></li>
				<li><a href="faq.html">FAQ's</a></li>
			</ul>
		</div>
		<div class="col-md-3 footer-grids fgd4">
			<h4>Tài khoản Đăng nhập</h4> 
			<ul>
				
				<li><a href="login.jsp">Login</a></li>
				<li><a href="register.jsp">Register</a></li>
				<li><a href="resetpass.jsp"> Quên mật khẩu</a></li>
				<li><a href="index.jsp">trang chủ</a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
		<p class="copy-right">© 2023  Design by <a href="http://lazada.com"> developer</a></p>
	</div>
</div>
	
</body>
</html>