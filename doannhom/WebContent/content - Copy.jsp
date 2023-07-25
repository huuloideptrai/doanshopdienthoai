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

<%
IDAO dao = new CategoryDAO();
ImageDAO idao = new ImageDAO();
ArrayList <MyModel> listcategory= dao.getListModel();
ProductDAO prdao= new ProductDAO();
%>

<div class="top-products">
	<div class="container">
		<h3>Sản phẩm bán nhiều nhất</h3>
		<div class="sap_tabs">			
			<div id="horizontalTab">
			
			
			
				<ul class="resp-tabs-list">
				
					<%for(int i=0;i<4;i++){
					
					Category c = (Category) listcategory.get(i);
					ArrayList <MyModel> listtop= prdao.getListSpmuaNhieutheoCategoryID(c.getCategoryID());
					%>
					<li class="resp-tab-item"><span><%=c.getCategoryName() %></span></li><%} %>
									
						
				</ul>	
				<div class="clearfix"> </div>	
				<div class="resp-tabs-container">
					
					<%
					
					for(int i=0;i<4;i++){
						
						Category c = (Category) listcategory.get(i);
						ArrayList <MyModel> listtop= prdao.getListSpmuaNhieutheoCategoryID(c.getCategoryID());
					
					%>
					
				
					<div class="tab-1 resp-tab-content">
					
				<%	
				for(int j=0;j<listtop.size();j++) {
				Product p=(Product)listtop.get(j); %>
						<div class="col-md-3 top-product-grids tp1 animated wow slideInUp" data-wow-delay=".5s">
       	<a href="single.jsp?productID=<%=p.getProductID()%>&categoryID=<%=c.getCategoryID()%>">
							<div class="product-img">
							
								<%
				for(int k =0; k< idao.getListImageByProductID(p.getProductID()).size();k++){
					
					Images image = (Images)idao.getListImageByProductID(p.getProductID()).get(k);
					if(image.getType()==1){
				
				%>
						<img src="<%=image.getLink()%>" alt="" />
						
					<%}} %>
				
							
								<div class="p-mask">
									<form action="Servletgiohang" method="post">
					<input type="hidden" name=categoryID value=<%=c.getCategoryID()%>>
					<input type="hidden" name=productID value=<%=p.getProductID()%>>
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
						<%} %>
					
						<div class="clearfix"></div>
						
							
						</div>
					
					<%} %>
			
			
			
			
			
			
					</div>
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
	<div class="container">
		<div class="col-md-6 features">
			<h3>Our Services</h3>
			<div class="support">
				<div class="col-md-2 ficon hvr-rectangle-out">
					<i class="fa fa-user " aria-hidden="true"></i>
				</div>
				<div class="col-md-10 ftext">
					<h4>24/7 online free support</h4>
					<p>Praesent rutrum vitae ligula sit amet vehicula. Donec eget libero nec dolor tincidunt vulputate.</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="shipping">
				<div class="col-md-2 ficon hvr-rectangle-out">
					<i class="fa fa-bus" aria-hidden="true"></i>
				</div>
				<div class="col-md-10 ftext">
					<h4>Free shipping</h4>
					<p>Praesent rutrum vitae ligula sit amet vehicula. Donec eget libero nec dolor tincidunt vulputate.</p>
				</div>	
				<div class="clearfix"></div>
			</div>
			<div class="money-back">
				<div class="col-md-2 ficon hvr-rectangle-out">
					<i class="fa fa-money" aria-hidden="true"></i>
				</div>
				<div class="col-md-10 ftext">
					<h4>100% money back</h4>
					<p>Praesent rutrum vitae ligula sit amet vehicula. Donec eget libero nec dolor tincidunt vulputate.</p>
				</div>	
				<div class="clearfix"></div>				
			</div>
		</div>
		<div class="col-md-6 testimonials">
			<div class="test-inner">
				<div class="wmuSlider example1 animated wow slideInUp" data-wow-delay=".5s">
					<div class="wmuSliderWrapper">
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<img src="images/c1.png" alt=" " class="img-responsive" />
								<p>Nam elementum magna id nibh pretium suscipit varius tortor. Phasellus in lorem sed massa consectetur fermentum. Praesent pellentesque sapien euismod.</p>
								<h4># Andrew</h4>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<img src="images/c2.png" alt=" " class="img-responsive" />
								<p>Morbi semper, risus dignissim sagittis iaculis, diam est ornare neque, accumsan risus tortor at est. Vivamus auctor quis lacus sed interdum celerisque.</p>
								<h4># Lucy</h4>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;">
							<div class="banner-wrap">
								<img src="images/c3.png" alt=" " class="img-responsive" />
								<p>Fusce non cursus quam, in hendrerit sem. Nam nunc dui, venenatis vitae porta sed, sagittis id nisl. Pellentesque celerisque  eget ullamcorper vehicula. </p>
								<h4># Martina</h4>
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
				<script src="js/jquery.wmuSlider.js"></script> 
								<script>
									$('.example1').wmuSlider();         
								</script> 
</div>
<!-- top-brands -->
	<div class="top-brands">
		<div class="container">
			<h3>Top Brands</h3>
			<div class="sliderfig">
				<ul id="flexiselDemo1">			
					<li>
						<img src="images/4.png" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/5.png" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/6.png" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/7.png" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/46.jpg" alt=" " class="img-responsive" />
					</li>
				</ul>
			</div>
					<script type="text/javascript">
							$(window).load(function() {
								$("#flexiselDemo1").flexisel({
									visibleItems: 4,
									animationSpeed: 1000,
									autoPlay: false,
									autoPlaySpeed: 3000,    		
									pauseOnHover: true,
									enableResponsiveBreakpoints: true,
									responsiveBreakpoints: { 
										portrait: { 
											changePoint:480,
											visibleItems: 1
										}, 
										landscape: { 
											changePoint:640,
											visibleItems:2
										},
										tablet: { 
											changePoint:768,
											visibleItems: 3
										}
									}
								});
								
							});
					</script>
					<script type="text/javascript" src="js/jquery.flexisel.js"></script>
		</div>
	</div>
<!-- //top-brands -->
<!-- newsletter -->
	


	
</body>
</html>