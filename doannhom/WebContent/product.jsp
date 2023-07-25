<%@page import="models.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="models.Images"%>
<%@page import="dao.ImageDAO"%>
<%@page import="models.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.MyModel"%>
<%@page import="models.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.IDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sản phẩm</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Club Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

</head>
<body>


<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>


<%
ImageDAO idao = new ImageDAO();
ProductDAO productdao= new ProductDAO();
CategoryDAO categoryDAO=new CategoryDAO();
String categoryID="";
if(request.getParameter("categoryID")!=null){
	categoryID=request.getParameter("categoryID");
	
	
	
}

Cart cart= (Cart) session.getAttribute("cart");
if(cart==null){
	cart= new Cart();
	session.setAttribute("cart", cart);
}

   int trang=0  ,gtbatdau=0,soluong=0,tongsp=0 ;
   if(request.getParameter("trang")!=null){
	   trang= Integer.parseInt(request.getParameter("trang"));
   }
   tongsp=productdao.tinhtongsanpham(Integer.parseInt(categoryID));
   if(tongsp<=6){
	 gtbatdau=0;
	 soluong=tongsp;
	   
   }else{
	   gtbatdau=(trang-1)*6;
	   soluong=6;
   }
   ArrayList<MyModel> list= productdao.getListProductBypage(Integer.parseInt(categoryID), gtbatdau, soluong);

   
   ArrayList <MyModel> listcategory= categoryDAO.getListModel();
   ArrayList <Images> listhinh=idao.getListImage();

%>
<div class="content">
	<div class="container">
		<div class="col-md-4 w3ls_dresses_grid_left">
			<div class="w3ls_dresses_grid_left_grid">
				<h3>Danh mục</h3>
					<div class="w3ls_dresses_grid_left_grid_sub">
						<div class="ecommerce_dres-type">
							<ul>
							<%  for(int i=0;i<listcategory.size();i++){
											Category c= (Category)listcategory.get(i);
																			
										
									%>
								<li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&trang=1"><i class="fa fa-angle-right" aria-hidden="true"></i><%=c.getCategoryName() %></a></li>
											
								<% }%>
							</ul>
						</div>
					</div>
			</div>
			</div>
		<div class="col-md-8 col-sm-8 women-dresses">
			<div class="women-set1">
			
			<%

			for(int i=0 ;i<list.size();i++){ 
			Product p= (Product)list.get(i);%>
				<div class="col-md-4 women-grids wp1 animated wow slideInUp" data-wow-delay=".5s">
					<a href="single.jsp?productID=<%=p.getProductID()%>&categoryID=<%=categoryID%>">
					
					
					<div class="product-img">
			<%	for(int j=0 ;j<listhinh.size();j++){
			if(listhinh.get(j).getProductID()==p.getProductID()){
				%>
						<img src="<%=listhinh.get(j).getLink()%>" alt="" />
						
					<%}} %>
			
				
						<div class="p-mask">
					
					<form action="Servletgiohang" method="post">
					<input type="hidden" name=categoryID value="<%=categoryID%>">
					<input type="hidden" name=hangcon value="<%=p.getTotal()%>">
					<input type="hidden" name=productID value="<%=p.getProductID()%>">
					<input  type="hidden" name="trang" value="<%=trang%>">
					<input type="hidden" name=luachon value="insert">
							
					<button type="submit" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Thêm vào giỏ</button>
								</form>
						</div>
					</div></a>
					
					<h4><%=p.getProductName() %></h4>
					<%if(p.getPriority()!=0){%>
						<del><%=p.getPrice() %>VNĐ</del>
					<h5><%=(p.getPrice()-(p.getPrice() *p.getPriority()/100))%> VNĐ</h5>
					<%}else{  %>
					<br>
					<h5><%=p.getPrice()%></h5>
					<%} %>
					
						</div>
						<%} %>
				
					<div class="clearfix"></div>
	</div>



<br>
<br>
	<span  >
	

	 <div class="col-md-6 page_1">
					  <nav>
						  <ul class="pagination">
						  <%if(tongsp<=6){ %>
						   <li><a href="product.jsp?categoryID=<%=categoryID%>&trang=1" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
						  <li><a href="product.jsp?categoryID=<%=categoryID%>&trang=1"><%=1%></a></li>
						  <li><a href="product.jsp?categoryID=<%=categoryID%>&trang=1" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						  
						  <%}else{ %>
						  
							<li><a href="product.jsp?categoryID=<%=categoryID%>&trang=<%=trang-1%>" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
							<%
							for(int i=1;i<=(tongsp/6)+1;i++){
						
	%>
							<li><a href="product.jsp?categoryID=<%=categoryID%>&trang=<%=i%>"><%=i%></a></li>
							<%} %>
							<li><a href="product.jsp?categoryID=<%=categoryID%>&trang=<%=trang+1%>" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						  
						  
						 <%} %>
						  </ul>
						</nav>
						</div>
						
	
	

	
	</span>
				</div>
	</div>
</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
    