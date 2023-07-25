<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>header</title>

</head>
<%User u= null; %>
<body class="dashboard-page">
	<script>
	        var theme = $.cookie('protonTheme') || 'default';
	        $('body').removeClass (function (index, css) {
	            return (css.match (/\btheme-\S+/g) || []).join(' ');
	        });
	        if (theme !== 'default') $('body').addClass(theme);
        </script>
	<section class="wrapper scrollable">
		<nav class="user-menu">
			<a href="javascript:;" class="main-menu-access">
			<i class="icon-proton-logo"></i>
			<i class="icon-reorder"></i>
			</a>
		</nav>
		<section class="title-bar">
			<div class="logo">
				<h1><a href="${root}/taothu/Admin/index.jsp"><img src="${root}/taothu/Admin/images/logo.png" alt="" />ADMIN</a></h1>
			</div>
			<div class="full-screen">
				<section class="full-top">
					<button id="toggle"><i class="fa fa-arrows-alt" aria-hidden="true"></i></button>	
				</section>
			</div>
			<div class="w3l_search">
				<form action="#" method="post">
					<input type="text" name="search" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}" required="">
					<button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
				</form>
			</div>
			<div class="header-right">
				
										
					
			
		
				<%if(session.getAttribute("user")!=null){
				u=(User)session.getAttribute("user");
			%>
			
			<a href="${root}/taothu/TTuser.jsp">Xin Chào:  <%=u.getUsername() %> </a>|
			<a href="${root}/taothu/index.jsp"> HLK SHOP</a>
			 | <a href="${root}/taothu/ServletUser?luachon=logout">Đăng xuất</a>
			<%} else {%>
			<a href="${root}/taothu/login.jsp">Đăng nhập</a> | 
				<a href="${root}/taothu/register.jsp">Đăng kí  </a>
				
				
				<%} %>
		
			
				
					<div class="clearfix"> </div>
				</div>
			
			<div class="clearfix"> </div>
		</section>
	
	<script src="${root}/taothu/Admin/js/bootstrap.js"></script>
	
</body>

</html>