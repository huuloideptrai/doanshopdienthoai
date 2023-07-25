<%@page import="dao.LienheDAO"%>
<%@page import="models.LienHe"%>
<%@page import="models.Images"%>
<%@page import="models.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="models.Category"%>
<%@page import="models.MyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ImageDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.IDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ProductDAO prdao= new ProductDAO();
    CategoryDAO dao = new CategoryDAO();
    ImageDAO idao = new ImageDAO(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content</title>

</head>
<body >
<%

ArrayList <MyModel> listcategory= dao.getListModel1();

ArrayList <MyModel> listtop =prdao.getListSpmuaNhieu();
Category c;
%>

<div class="top-products">
	<div class="container">
		<h3>SẢN PHẨM BÁN CHẠY</h3>
		<div class="sap_tabs">			
			<div id="horizontalTab">
			<%if(listcategory.size()>=4){ %>
			
			
				<ul class="resp-tabs-list">
				
					<%
					for(int i=0;i<4;i++){
					
					 c = (Category) listcategory.get(i);
					
					%>
					<li class="resp-tab-item"><span><%=c.getCategoryName() %></span></li><%} %>
									
						
				</ul>	
				<div class="clearfix"> </div>	
				
				
				
				
				<div class="resp-tabs-container">
					
				<%	for(int i=0;i<4;i++){
						c = (Category) listcategory.get(i);
						%>
				
					
				
					<div class="tab-1 resp-tab-content">
					
				<%	
					for(int j=0;j<listtop.size();j++) {
					Product p11=(Product)listtop.get(j);
					if(p11.getCategoryID()==c.getCategoryID()){
				
				Product p=(Product)listtop.get(j); %>
						<div class="col-md-3 top-product-grids tp1 animated wow slideInUp" data-wow-delay=".5s">
       	<a href="single.jsp?productID=<%=p.getProductID()%>&categoryID=<%=c.getCategoryID()%>">
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
					<input type="hidden" name=categoryID value="<%=c.getCategoryID()%>">
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
						<%}}%>
					
						<div class="clearfix"></div>
						
							
						</div>
					
			<% }%>
			
			
			
			
			
			
			
					</div>
			<%}else{ 
			
			if(listcategory.size()==0){%>
				
				
				<p>bạn cần ít nhất 1 danh mục để có thể hiện thi phần này</p>
				
				
			<%	}else{
			%>
		
	
			
				<ul class="resp-tabs-list">
				
					<%
					for(int i=0;i<listcategory.size();i++){
					
					 c = (Category) listcategory.get(i);
					
					%>
					<li class="resp-tab-item"><span><%=c.getCategoryName() %></span></li><%} %>
									
						
				</ul>	
				<div class="clearfix"> </div>	
				
				
				
				
				<div class="resp-tabs-container">
					
				<%	for(int i=0;i<listcategory.size();i++){
						c = (Category) listcategory.get(i);
						%>
				
					
				
					<div class="tab-1 resp-tab-content">
					
				<%	
					for(int j=0;j<listtop.size();j++) {
					Product p11=(Product)listtop.get(j);
					if(p11.getCategoryID()==c.getCategoryID()){
				
				Product p=(Product)listtop.get(j); %>
						<div class="col-md-3 top-product-grids tp1 animated wow slideInUp" data-wow-delay=".5s">
       	<a href="single.jsp?productID=<%=p.getProductID()%>&categoryID=<%=c.getCategoryID()%>">
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
					<input type="hidden" name=categoryID value="<%=c.getCategoryID()%>">
					<input type="hidden" name=productID value="<%=p.getProductID()%>">
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
						<%}}%>
					
						<div class="clearfix"></div>
						
							
						</div>
					
			<% }}%>
			
			
			
			
			
			
			
					</div>
		


			<%} %>
			
			</div>
		</div>	
	</div>
</div>
	<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
				type: 'default', //Types: default, vertical, accordion           
				width: 'auto', //auto or any width like 600px
				fit: true   // 100% fit in a container
			});
		});		
	</script>
<div class="fandt">
<%LienHe ldv= new LienheDAO().getlienhe(); %>
	<div class="container">
	
		<div class="col-md-6 testimonials">
			<div class="test-inner">
				<div class="wmuSlider example1 animated wow slideInUp" data-wow-delay=".5s">
					<div class="wmuSliderWrapper">
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<img src="img/c1.jpg" alt=" " class="img-responsive" />
								<p>Giải pháp hoàn hảo cho những trải nghiệm di động, shop điện thoại - sắc nét cuộc sống</p>
								<h4># Đặng Hữu Lợi</h4>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<img src="img/c2.jpg" alt=" " class="img-responsive" />
								<p>Thành công không đến từ may mắn, mà từ sự kiên nhẫn, nỗ lực và không ngừng cố gắng</p>
								<h4># Trần Đức Hoàng</h4>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;">
							<div class="banner-wrap">
								<img src="img/c3.jpg" alt=" " class="img-responsive" />
								<p>Cuộc sống là món quà đáng trân trọng, hãy sống trọn vẹn và yêu thương từng khoảnh khắc. </p>
								<h4># Hồ Đắc Thái Kiệt</h4>
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
		
			<div class="col-md-6 features">
			<h3>Dịch vụ của chúng tôi</h3>
		<% String[]dv=ldv.getDichvu().split(",");
								if(dv.length>0){
								for(int i=0;i<dv.length;i++){
								%>
			<div class="support">
				<div class="col-md-2 ficon hvr-rectangle-out">
					<i class="fa fa-user " aria-hidden="true"></i>
				</div>
				<div class="col-md-10 ftext">
					<h4><%=dv[i]%></h4>
				</div>
				<div class="clearfix"></div>
			</div>
					<%}} %>	
			</div>
		</div>
	
		
		<div class="clearfix"></div>
	</div>
				<script src="js/jquery.wmuSlider.js"></script> 
								<script>
									$('.example1').wmuSlider();         
								</script> 
</div>

<!-- newsletter -->
	


	
</body>
</html>