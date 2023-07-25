<%@page import="models.MyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Images"%>
<%@page import="dao.ImageDAO"%>
<%@page import="models.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.IDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>


<%
IDAO productDao= new ProductDAO();
Product p = new Product();;
String productID= "";
String categoryID="";



if(request.getParameter("productID")!= null){
	productID=request.getParameter("productID");
	categoryID=request.getParameter("categoryID");
	 p = (Product)productDao.getModel(Integer.parseInt(productID));
	 ImageDAO idao = new ImageDAO();
	 ArrayList <MyModel> listhinhanh=idao.getListImageByProductID(p.getProductID());	

%>


<div class="products">	 
		<div class="container">  
			<div class="single-page">
				<div class="single-page-row" id="detail-21">
					<div class="col-md-6 single-top-left">	
						<div class="flexslider">
							<ul class="slides">
								<%
								
								ProductDAO p1= (ProductDAO)productDao;
								
							String nsx=	p1.gettennsx(p.getMakerID());
								for(int k =0; k< listhinhanh.size();k++){
					
					Images image = (Images)listhinhanh.get(k);
					if(image.getType()==1){
				
				%>
					
					
				
							
								<li data-thumb="<%=image.getLink()%>">
									<div class="thumb-image detail_images"> <img src="<%=image.getLink()%>" data-imagezoom="true" class="img-responsive" alt=""> </div>
								</li>
								
								
								<%}else if(image.getType()==0){ %>
								<li data-thumb="<%=image.getLink()%>">
									 <div class="thumb-image"> <img src="<%=image.getLink()%>" data-imagezoom="true" class="img-responsive" alt=""> </div>
								</li>
								
								<%}} %>
							</ul>
						</div>
					</div>
					<div class="col-md-6 single-top-right">
						<h3 class="item_name"><%=p.getProductName() %></h3>
						
						<div class="single-rating">
							
						</div>
						<div class="single-price">
							<ul>
							
					<% 		if(p.getPriority()!=0){%>
								<li><%=(p.getPrice()-(p.getPrice() *p.getPriority())/100)%> VNĐ</li>  
								<li><del><%=p.getPrice() %>VNĐ</del></li> 
								<li><span class="w3off">Giảm giá <%=p.getPriority()%>%</span></li> 
								<%}else{ %>
								<li><%=p.getPrice()%> VNĐ</li>  
								
								<%} %>
								
								
								<li>Ngày nhập hàng: <%=p.getLastupdate() %></li>
								<br>
								<br>
								<li>Nhà sản Xuất: <%=nsx%></li>
								<br>
								<br>
								<%
								
								if(p.getTotal()>0){
								%>								
									<li>Số lượng hàng còn <%=p.getTotal() %> sản phẩm </li>
									<%}else{ %>
									
									<li>Tạm hết hàng</li>
									<%} %>
							</ul>	
						</div> 
					<br><br>
						<form action="Servletgiohang" method="post">
							<ul>
							
								
						<li>CHẤT LIỆU<select name="material" style="width: 100%;height: 40px;" >
								<%
								String[]a=p.getMaterial().split(",");
								if(a.length>0){
								for(int i=0;i<a.length;i++){
								%>
																	
									<option name="material" value="<%=a[i] %>"><%=a[i] %></option> 
															
							<%	}%>
								<%}
								%>
						 </select></li>
						 <li>DUNG LƯỢNG<select name="size" style="width: 100%;height: 40px;" >
								<%
								String[]b=p.getSize().split(",");
								if(b.length>0){
								for(int i=0;i<b.length;i++){
								%>
																	
									<option name="size" value="<%=b[i] %>"><%=b[i] %></option> 
															
							<%	}%>
								<%}
								%>
						 </select></li>
						 	<li>MÀU SẮC<select name="color" style="width: 100%;height: 40px;" >
								<%
								String[]c=p.getColor().split(",");
								if(c.length>0){
								for(int i=0;i<c.length;i++){
								%>
																	
									<option name="color" value="<%=c[i] %>"><%=c[i] %></option> 
															
							<%	}%>
								<%}}
								%>
						 </select></li>
						</ul>	
						
						
						
						
					<input type="hidden" name=hangcon value="<%=p.getTotal() %>">
					<input type="hidden" name=soluong value="1">
					<input type="hidden" name=categoryID value="<%=categoryID%>">
					<input type="hidden" name=productID value="<%=productID%>">
					<input type="hidden" name=luachon value="insert1">
							<br>
							
							<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>Thêm vào giỏ</button>
						</form>
						
						
						
			
					</div>
				   <div class="clearfix"> </div>  
				</div>
			</div> 
				
				
				<div class="fb-comments" data-href="http://shoptaothu.jelastic.skali.net/taothu/single.jsp?productID=<%=productID%>&categoryID=<%=categoryID%>" data-width="auto" data-numposts="5"></div>
			<!-- collapse-tabs -->
			<div class="collpse tabs">
				<h3 class="w3ls-title">Thông tin chi tiết của sản phẩm</h3> 
				<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									<i class="fa fa-file-text-o fa-icon" aria-hidden="true"></i>Mô tả<span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
					<%=p.getDescription() %>
					
							</div>
						</div>
					</div>
					</div>
			</div>
			<!-- //collapse --> 
			
			
			
			
			
		</div>
	</div>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>