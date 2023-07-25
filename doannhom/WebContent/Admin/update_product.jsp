
<%@page import="dao.ImageDAO"%>
<%@page import="models.Images"%>
<%@page import="models.Maker"%>
<%@page import="dao.MakerDAO"%>
<%@page import="models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="models.MyModel"%>
<%@page import="dao.IDAO"%>
<%@page import="models.Product"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Chỉnh sửa sản phẩm</title>
<jsp:include page="head.jsp"></jsp:include>
</head>
<jsp:include page="menu.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>
<body class="dashboard-page">
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String e1 = (String) request.getAttribute("e1");
		String e2 = (String) request.getAttribute("e2");
		String e3 = (String) request.getAttribute("e3");
		String e4 = (String) request.getAttribute("e4");
		String e5 = (String) request.getAttribute("e5");
		String e6 = (String) request.getAttribute("e6");
		if (e1 == null) {
			e1 = "";

		}
		if (e2 == null) {
			e2 = "";

		}
		if (e3 == null) {
			e3 = "";

		}
		if (e4 == null) {
			e4 = "";

		}
		if (e5 == null) {
			e5 = "";

		}
		if (e6 == null) {
			e6 = "";

		}

		

		int id = Integer.parseInt(request.getParameter("productID"));
		MyModel p = new ProductDAO().getModel(id);
		Product p1 = (Product) p;
		IDAO dao = new CategoryDAO();
		IDAO daomk = new MakerDAO();
		ArrayList<MyModel> listcategory = dao.getListModel();
		ArrayList<MyModel> listmaker = daomk.getListModel();
		ImageDAO idao = new ImageDAO();
	%>
	

	<section class="wrapper scrollable">
		<div class="main-grid">
			<div class="agile-grids">
				<!-- input-forms -->
				<div class="grids">

					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-two widget-shadow">
								<div class="form-title">
									<h4>Cập nhật sản phẩm</h4>
								</div>

								<div class="form-body" data-example-id="simple-form-inline">
									<form class="themdanhmuc" action="${root}/taothu/ServletQLsanpham"
										method="post">
										<div class="form-group">
											<label for="exampleInputName2">Tên sản phẩm</label> <input
												type="text" name="tensanpham" class="form-control"
												id="exampleInputName2" placeholder="tên sản phẩm"
												value="<%=p1.getProductName()%>">
											<%=e1%></div>
										<div class="form-group">
											<label for="exampleInputEmail2">Danh mục</label> <select
												class="form-control" id="exampleInputName2" name="madanhmuc">
												<option class="form-control" value="<%=p1.getCategoryID()%>">chọn mục khác</option>
												<%
													for (int i = 0; i < listcategory.size(); i++) {
														Category c = (Category) listcategory.get(i);
												%>
												<option class="form-control" value="<%=c.getCategoryID()%>"><%=" - "+c.getCategoryName()%></option>
												<%
													}
												%>
											</select>
											</div>
											<div class="form-group">
												<label for="exampleInputEmail2">Giảm giá theo %</label> <input
													type="text" name="priority" class="form-control"
													id="exampleInputEmail2" placeholder="??"
													value="<%=p1.getPriority()%>"><%=e3%>
											</div>
											<div class="form-group">
												<label for="exampleInputEmail2">Giá</label> <input
													type="text" name="gia" class="form-control"
													id="exampleInputEmail2" placeholder="100000 "
													value="<%=p1.getPrice()%>"><%=e4%>
											</div>
											<div class="form-group">
											<label for="exampleInputEmail2">Ẩn hiện</label> 
												<select
												class="form-control" id="exampleInputName2" name="anhien">
											
										<%if(p1.getHide()==0){ %>
												<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="<%=p1.getHide()%>">Ẩn</option>
												<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="1"> Hiện </option>
													<%}else{ %>
												<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="<%=p1.getHide()%>">Hiện </option>
													<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="0"> Ẩn </option>
													
													<%
													}%>
													
											</select>
											
											
											
											
										</div>

											
												<div class="form-group">
											
											   <textarea class="form-textarea" id="mota" name="mota" ><%=p1.getDescription()%></textarea>
          <script type="text/javascript">
		CKEDITOR.replace("mota", {
			filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
			filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?type=Images',
			filebrowserFlashBrowseUrl : '../ckfinder/ckfinder.html?type=Flash',
			filebrowserUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
			filebrowserImageUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
			filebrowserFlashUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
		});
	</script>
		
											
										</div>
										
											<div class="form-group">
											<label for="exampleInputEmail2">Số lượng</label>
											<input
												type="text" name="total" class="form-control"
												id="exampleInputEmail2" placeholder=" " value="<%=p1.getTotal()%>"><%=e3%>
										</div>
										
										<div class="form-group">
											<label for="exampleInputEmail2">Kích cỡ</label>
											<input
												type="text" name="size" class="form-control"
												id="exampleInputEmail2" placeholder=" " value="<%=p1.getSize()%>">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail2">Màu sắc</label>
											<input
												type="text" name="color" class="form-control"
												id="exampleInputEmail2" placeholder=" " value="<%=p1.getColor()%>">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail2">Chất liệu</label>
											<input
												type="text" name="chatlieu" class="form-control"
												id="exampleInputEmail2" placeholder=" " value="<%=p1.getMaterial()%>">
										</div>
												<div class="form-group">
											<label for="exampleInputEmail2">Nhà Sản xuất</label> <select
												class="form-control" id="exampleInputName2" name="maker">
												
												<%Maker maker=(Maker)daomk.getModel(p1.getMakerID());
													%>
													<option class="form-control" value="<%=p1.getMakerID()%>"><%=maker.getName()%></option>
													
													
													<%
													for (int i = 0; i < listmaker.size(); i++) {
														Maker m = (Maker) listmaker.get(i);
												%>
                                                 <option name="maker" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="<%=m.getMakerID()%>"><%= m.getName()%></option>												
<%
													}
												%>
											</select>
										</div>
											<br><br><br>
											
					<%
					ArrayList<MyModel>listim= idao.getListImageByProductID(p1.getProductID());
					int k=0,hihi=0;
					if(listim.size()>2){
				for(int j =0; j< listim.size();j++){
				//int k=j+1;
					Images image = (Images)listim.get(j);
					if(image.getType()==1){
			
				%>
						
						
			<input type="hidden" name="id1" value="<%=image.getImagesID() %>" >
									
	<input type="text" name="link" id="urlHinh" value="<%=image.getLink()%>">
	<input type="button" name="btn-choose " id="btn-choose" value="Chọn File" onclick="BrowseServer('Images:/','urlHinh')">
	
	<%}else if(image.getType()==0){k++;
		
	
		%>
		<input type="hidden" name="<%="id"+(k+1)%>" value="<%=image.getImagesID() %>" >
	
	
<input type="text" name="<%="link"+k%>" id="<%="urlHinh"+k%>" value="<%=image.getLink()%>">
	<input type="button" name="btn-choose" id="btn-choose" value="Chọn File" onclick="BrowseServer('Images:/','<%="urlHinh"+k%>')">
	
<%}
					
				}	
					}else{
						
						for(int j =0; j< listim.size();j++){
							//int k=j+1;
								Images image = (Images)listim.get(j);
								if(image.getType()==1){
						
							%>
									
									
						<input type="hidden" name="id1" value="<%=image.getImagesID() %>" >
												
				<input type="text" name="link" id="urlHinh" value="<%=image.getLink()%>">
				<input type="button" name="btn-choose " id="btn-choose" value="Chọn ảnh đại diện" onclick="BrowseServer('Images:/','urlHinh')">
			
			
			
				<% 	}else{%>
						<input type="hidden" name="id2" value="0" >		
						<input type="hidden" name="id3" value="0" >	
						<input type="text" name="link1" id="urlHinh1">
	<input type="button" name="btn-choose" id="btn-choose" value="Chọn ảnh chi tiết" onclick="BrowseServer('Images:/','urlHinh1')">
	<input type="text" name="link2" id="urlHinh2" >
	<input type="button" name="btn-choose" id="btn-choose" value="Chọn ảnh chi tiết" onclick="BrowseServer('Images:/','urlHinh2')">
	
						
						<%}}}%>
						
						
						
						
						
						
						
						
				
	
										
<br><br><br>
										
										
										
										
										<input type="hidden" name="luachon" value="update"> <input
											type="hidden" name="productID" 		value="<%=request.getParameter("productID")%>">
										<button type="submit" class="btn btn-default w3ls-button">cập
											nhật</button>
									</form>
									<br>
									
									
									

								</div>
							</div>
						</div>
					</div>



				</div>
				<!-- //input-forms -->
			</div>
		

		<jsp:include page="footer.jsp"></jsp:include>


	</section>

</body>
</html>