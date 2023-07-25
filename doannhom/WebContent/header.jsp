<%@page import="dao.ImageDAO"%>
<%@page import="models.Cart"%>
<%@page import="models.User"%>
<%@page import="models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.IDAO"%>
<%@page import="models.MyModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
</head>
<style>
.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus {
    color: #fff;
    background-color:#FF0000;}
button.search {
    border: none;
    position: absolute;
    top: 4px;
    right: 11px;
    width: 47px;
    height: 43px;
    outline: none;
    box-shadow: none;
    background:#FF0000;
    padding: 0;
    border-radius: inherit;
    -webkit-appearance: none;
    -webkit-transition: .5s all;
    -moz-transition: .5s all;
    transition: .5s all;
}
.navbar-default .navbar-nav > .open > a, .navbar-default .navbar-nav > .open > a:hover, .navbar-default .navbar-nav > .open > a:focus {
    color: #fff;
    background-color:#FF0000;
}

.navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus{
	  color:#fff;
	   background-color:#FF0000;
}
.product-img .p-mask, .row .product .vm-product-media-container .p-mask {
    opacity: 0;
    visibility: hidden;
    background:rgba(255,0,0, 0.52);
    bottom: 0%;
	left:0;
    position: absolute;
    width: 100%;
    -webkit-transform: translate3d( 0px, 100%, 0px );
    -moz-transform: translate3d( 0px, 100%, 0px );
    -ms-transform: translate3d( 0px, 100%, 0px );
    -o-transform: translate3d( 0px, 100%, 0px );
    transform: translate3d( 0px, 100%, 0px );
    -webkit-transition: all .5s ease 0s;
    -moz-transition: all .5s ease 0s;
    transition: all .5s ease 0s;
    text-align: left;
}
.top-product-grids h5,.women-grids h5{
    font-size: 18px;
    font-weight: 700;
	color:#FF0000;
}
</style>
<body>

<!-- Subiz -->
<script>
	(function(s, u, b, i, z){
		u[i]=u[i]||function(){
			u[i].t=+new Date();
			(u[i].q=u[i].q||[]).push(arguments);
		};
		z=s.createElement('script');
		var zz=s.getElementsByTagName('script')[0];
		z.async=1; z.src=b; z.id='subiz-script';
		zz.parentNode.insertBefore(z,zz);
	})(document, window, 'https://widgetv4.subiz.com/static/js/app.js', 'subiz');
	subiz('setAccount', 'acqqfztsosrmxhjxqtzo');
</script>
<!-- End Subiz -->
 	
	
<%
IDAO cate=new CategoryDAO();
ArrayList <MyModel> listcategory1= cate.getListModel();

User u= null;
Cart cart =(Cart) session.getAttribute("cart");
if(cart==null){
	cart= new Cart();
	session.setAttribute("cart", cart);
}


String hihi= new ImageDAO().getanhlogo();

%>



<div class="header-top-w3layouts">
	<div class="container">
		<div class="col-md-6 logo-w3">
			<a href="index.jsp"><img src="<%=hihi%>"><h1>HLK SHOP</h1></a>
		</div>
		<div class="col-md-6 phone-w3l">
			<ul>
		
			<%if(session.getAttribute("user")!=null){
				u=(User)session.getAttribute("user");
				
				
				
			%>
			
			<li >  <a href="TTuser.jsp">Xin chào:  <%=u.getUsername() %></a></li>
			<%if(u.getAdmin()!=0){%>
				
				<li>|<a href="${root}/taothu/Admin/index.jsp">Trang Admin</a> </li>
				<li>|<a href="ServletUser?luachon=logout">Đăng xuất</a>  </li>
		<%}	
			
			
			
			} else {%>
			<li><a href="login.jsp">Đăng nhập</a> | </li>
				<li><a href="register.jsp">Đăng kí  </a></li>
				
				
				<%} %>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div class="header-bottom-w3ls">
	<div class="container">
		<div class="col-md-8 navigation-agileits">
			<nav class="navbar navbar-default">
				<div class="navbar-header nav_2">
					<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> 
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav ">
						<li class=" active"><a href="index.jsp" class="hyper "><span>Trang chủ</span></a></li>	
						<li class="dropdown ">
							<a href="#" class="dropdown-toggle  hyper" data-toggle="dropdown" ><span>Danh mục sản phẩm<b class="caret"></b></span></a>
								<ul class="dropdown-menu multi">
									<div class="row">
										
										
										<%  for(int i=0;i<listcategory1.size();i++){
											Category c= (Category)listcategory1.get(i);
											
									
										
									%>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
			
												<li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&trang=1"><i class="fa fa-angle-right" aria-hidden="true"></i><%=c.getCategoryName() %></a></li>
											
											</ul>
										
										</div>
												<% }%>
										
											
											
											
											
											
											</div></ul></li>
											<li><a href="payment.jsp" class="hyper"><span>Cách thức thanh toán</span></a></li>
											<li><a href="about.jsp" class="hyper"><span>Tin tức</span></a></li>
						                    <li><a href="contact.jsp" class="hyper"><span>Liên hệ</span></a></li>
					</ul>
				</div>
		
			</nav>
		</div>
								<script>
				$(document).ready(function(){
					$(".dropdown").hover(            
						function() {
							$('.dropdown-menu', this).stop( true, true ).slideDown("fast");
							$(this).toggleClass('open');        
						},
						function() {
							$('.dropdown-menu', this).stop( true, true ).slideUp("fast");
							$(this).toggleClass('open');       
						}
					);
				});
				</script>
		<div class="col-md-3 search-agileinfo">
			<a href="search.jsp">
				
				<button type="button" class="btn btn-default search" aria-label="Left Align">
					<i class="fa fa-search" aria-hidden="true"> </i>
				</button>
				</a>
			
		</div>
		<div class="col-md-1 cart-wthree">
			<div class="cart"> 
				<form action="#" method="post" class="last"> 
					<input type="hidden" name="cmd" value="_cart" />
					<input type="hidden" name="display" value="1" />
					<a href="checkout.jsp"><button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"><%=cart.sosanphammua() %></i><button><%=cart.tongtien() %>VNĐ</a>
					
				
				</form>  
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>

</body>
</html>