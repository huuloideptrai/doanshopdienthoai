<%@page import="models.Images"%>
<%@page import="dao.ImageDAO"%>
<%@page import="models.Maker"%>
<%@page import="dao.MakerDAO"%>
<%@page import="models.Category"%>
<%@page import="models.MyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.IDAO"%>
<%@page import="models.Product"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Quản lí Ảnh chung</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
</head>
<jsp:include page="head.jsp"></jsp:include>
<body class="dashboard-page">
<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
ImageDAO idao= new ImageDAO();
ArrayList <Images> listhinh=idao.getListImage1();
%>
<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

	<section class="wrapper scrollable">
	<div class="main-grid">
			<div class="agile-grids">	
				<!-- input-forms -->
				<div class="grids">
				
					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-two widget-shadow">
								<div class="form-title">
									<h4>Quản lí ảnh</h4>
								</div>

								<div class="form-body" data-example-id="simple-form-inline">
			<form class="themanh" action="${root}/taothu/ServletQLimages" method="post"  >
							
									
										<br>
		
	<button type="button" class="btn btn-default w3ls-button" name="btn-choose" id="btn-choose" onclick="BrowseServer('Images:/','urlHinh')"> Chọn ảnh baner</button>
	
		<input type="hidden" name="luachon" value="updatebaner">
		<button type="submit" class="btn btn-default w3ls-button"> cập nhật</button>
		<input type="text" name="baner" id="urlHinh">
	<br><br>
	<%	
	for(int k =0; k< listhinh.size();k++){
					
					Images image = (Images)listhinh.get(k);
					if(image.getType()==2){
				
				%>

						
						<div class="product-img">
						<img style="width: 100%;height: 30%" src="<%=image.getLink() %>" alt="" />
						</div>
	<input type="hidden" name="imageID" value="<%=image.getImagesID() %>">
					<%}} %>
		
		

	
	
	<br><br><br>
	
	</form>
	
	
	
	<form class="themanh" action="${root}/taothu/ServletQLimages" method="post"  >
	
	
	<button type="button" class="btn btn-default w3ls-button" name="btn-choose" id="btn-choose"  onclick="BrowseServer('Images:/','urlHinh1')"> Chọn ảnh logo</button>
	<input type="hidden" name="luachon" value="updatelogo">
		<button type="submit" class="btn btn-default w3ls-button"> cập nhật</button>
	
					<input type="text" name="logo" id="urlHinh1" "><br><br>
	<%	
	
	for(int k =0; k< listhinh.size();k++){
					
					Images image = (Images)listhinh.get(k);
					if(image.getType()==3){
			%>
						<div class="product-img">
						<img style="width: 20%;height: 20%" src="<%=image.getLink() %>" alt="" />
						</div>
						<input type="hidden" name="imageID" value="<%=image.getImagesID() %>">
					<%}} %>

	
							
		
		</form>
	<br><br><br>
	
	
	<button type="button" class="btn btn-default w3ls-button" name="btn-choose" id="btn-choose" value="Chọn ảnh logo" onclick="BrowseServer('Images:/','urlHinh2')"> Quản lí toàn bộ ảnh</button>
	
											<input type="hidden" name="link16p" id="urlHinh2" "><br><br>
<br><br><br>
										
											
<p1> <a href="${root}/taothu/Admin/index.jsp">Trở lại</a></p1>
																			
										
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- //input-forms -->
			</div>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>


	</section>

	
</body>
</html>