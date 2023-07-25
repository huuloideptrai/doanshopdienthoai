<%@page import="models.Product"%>
<%@page import="models.Images"%>
<%@page import="models.MyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ImageDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.LienheDAO"%>
<%@page import="models.LienHe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
 <%ProductDAO prdao= new ProductDAO();
     ImageDAO idao = new ImageDAO(); %>
<div class="about">
	<div class="container"> 
		<h3>Tìm kiếm nhanh</h3>
		<div class="about-info">
		
			<form action="Servletsearch" method="get">
							<div
								style="border: 2px solid gray; height: 40px; border-top-right-radius: 10px; border-top-left-radius: 10px; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;">
								<div>
									<input type="text" placeholder="   Tìm kiếm theo tên"
									 name="chuoi"
										style="height: 10%; width: 50%; float: left; margin-top: 5px; margin-left: 20%; border-top-right-radius: 10px; border-top-left-radius: 10px; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" />
								</div>
								<div>
									<input type="submit" style="margin-left: 10%;"
										class="btn btn-default search" aria-label="Left Align" value="tìm kiếm"  >
					
										
										 
										 
								</div>
							</div>
						</form>
		
		<br>
		<br>
		<br>
		<br>
		<%	
		
		String chuoi = (String) request.getAttribute("chuoi");
		if(chuoi==null){%>
			
			<p>Vui lòng nhập từ khóa có liên quan đến sản phẩm</p>
			
	<%	}else{
		
		
		ArrayList<MyModel> lit= prdao.timkiem(chuoi);
		
		if(lit.size()==0){%>
			
			<p>Không tìm thấy dữ liệu như yêu cầu</p>
			
			
			
			
			
	<%	}else{
					for(int j=0;j<lit.size();j++) {
					Product p=(Product)lit.get(j);
					
				
				 %>
		
						<div class="col-md-3 top-product-grids tp1 animated wow slideInUp" data-wow-delay=".5s">
       	<a href="single.jsp?productID=<%=p.getProductID()%>&categoryID=<%=p.getCategoryID()%>">
							<div class="product-img">
							
								<%
								ArrayList <MyModel> listimage=idao.getListImageByProductID(p.getProductID());
				for(int k =0; k< listimage.size();k++){
					
					Images image = (Images)listimage.get(k);
					if(image.getType()==1){
				
				%>
						<img src="<%=image.getLink()%>" alt="" />
						
					<%}} %>
				
							
								<div class="p-mask">
									<form action="Servletgiohang" method="post">
					<input type="hidden" name=categoryID value="<%=p.getCategoryID()%>">
					<input type="hidden" name=productID value="<%=p.getProductID()%>">
					<input type="hidden" name=hangcon value="<%=p.getTotal()%>">
					<input   type="hidden" name="trang" value="0">
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
					
			<%} }}%>
			
				
		</div>
	</div>
</div>
<!-- //about -->
<jsp:include page="footer.jsp"></jsp:include>
