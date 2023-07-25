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
<title>thêm sản phẩm</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
</head>
<jsp:include page="head.jsp"></jsp:include>
<body class="dashboard-page">
<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
		String e1=(String )request.getAttribute("e1");
		String e2=(String )request.getAttribute("e2");
		String e3=(String )request.getAttribute("e3");
		String e4=(String )request.getAttribute("e4");
		String e5=(String )request.getAttribute("e5");
		String e6=(String )request.getAttribute("e6");
		String erlink =(String )request.getAttribute("erlink");
if(e1==null){
	e1="";
	
}if(e2==null){
	e2="";
	
}
if(e3==null){
	e3="";
	
}if(e4==null){
	e4="";
	
}if(e5==null){
	e5="";
	
}if(e6==null){
	e6="";
	
}
if(erlink==null){
	erlink="";
	
}

String t1="",t2="",t3="",t4="",t5="",t6="", t7="",t8 = "", t9 = "", t10 = "", t11 = "";
if(request.getParameter("tensanpham")!=null){
	t1=request.getParameter("tendanhmuc");
}
if(request.getParameter("madanhmuc")!=null){
	t2=request.getParameter("madanhmuc");
}


if(request.getParameter("priority")!=null){
	t3=request.getParameter("priority");
}
if(request.getParameter("gia")!=null){
	t4=request.getParameter("gia");
}
if(request.getParameter("anhien")!=null){
	t5=request.getParameter("anhien");
}
if(request.getParameter("mota")!=null){
	t6=request.getParameter("mota");
}
if (request.getParameter("total") != null) {
	t7 = request.getParameter("total");
}
if (request.getParameter("size") != null) {
	t8 = request.getParameter("size");
}
if (request.getParameter("color") != null) {
	t9 = request.getParameter("color");
}
if (request.getParameter("chatlieu") != null) {
	t10 = request.getParameter("chatlieu");
}

IDAO dao = new CategoryDAO();
IDAO daomk = new MakerDAO();
ArrayList<MyModel> listcategory = dao.getListModel();
ArrayList<MyModel> listmaker = daomk.getListModel();
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
									<h4>Thêm sản phẩm </h4>
								</div>

								<div class="form-body" data-example-id="simple-form-inline">
									<form class="themdanhmuc" action="${root}/taothu/ServletQLsanpham" method="post"  >
									 <div class="form-group"> <label for="exampleInputName2">Tên sản phẩm</label> 
									 <input type="text" name="tensanpham" class="form-control" id="exampleInputName2" placeholder="tên sản phẩm" value="<%=t1%>"> <%=e1%></div> 
									 <div class="form-group"> <label for="exampleInputEmail2">Mã danh mục</label>
									 
					<select
												class="form-control" id="exampleInputName2" name="madanhmuc">
												<%
													for (int i = 0; i < listcategory.size(); i++) {
														Category c = (Category) listcategory.get(i);
												%>
												<option name="madanhmuc" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="<%=c.getCategoryID()%>"><%= " - " + c.getCategoryName()%></option>
												<%
													}
												%>
											</select></div>
								
										<div class="form-group">
											<label for="exampleInputEmail2">Giá</label>
											 <input
												type="text" name="gia" class="form-control"
												id="exampleInputEmail2" placeholder="100000 " value="<%=t4%>"><%=e4%>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail2">Ẩn hiện</label> 
												<select
												class="form-control" id="exampleInputName2" name="anhien">
											
											<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="1">Hiện </option>
												<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="0">Ẩn </option>
													
												
											</select>
											
											
											
											
										</div>
										
											<div class="form-group">
											<label for="exampleInputEmail2">Số lượng</label> <input
												type="text" name="total" class="form-control"
												id="exampleInputEmail2" placeholder=" " value="<%=t7%>">
										</div>
										
										<div class="form-group"> <label for="exampleInputEmail2">Nhà sản xuất</label>
									 
					<select
												class="form-control" id="exampleInputName2" name="maker">
											
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
											</select></div>
										
										<div class="form-group">
											<label for="exampleInputEmail2">Kích cỡ</label>

	<select
												class="form-control" id="exampleInputName2" name="size">
											
											
											
													<option name="size" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="Vừa">Vừa </option>
														<option name="size" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="Lớn">Lớn </option>
												<option name="size" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="Nhỏ">Nhỏ </option>
											</select>

										</div>
										<div class="form-group">
											<label for="exampleInputEmail2">Màu sắc</label> <input
												type="text" name="color" class="form-control"
												id="exampleInputEmail2" placeholder=" " value="<%=t9%>">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail2">Chất liệu</label> <input
												type="text" name="chatlieu" class="form-control"
												id="exampleInputEmail2" placeholder=" " value="<%=t10%>">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail2">Giảm giá theo %</label>
											 <input
												type="text" name="priority" class="form-control"
												id="exampleInputEmail2" placeholder="" value="<%=t3%>"><%=e3%>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail2">Mô tả</label>
											

                      <textarea class="form-textarea" id="mota" name="mota" value="<%=t6%>"><%=e6%></textarea>
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
										
										
									
										<br><br><br>
	<input type="text" name="link" id="urlHinh">
	<input type="button" name="btn-choose " id="btn-choose" value="Chọn File" onclick="BrowseServer('Images:/','urlHinh')">
	<%=erlink%>
	
<input type="text" name="link1" id="urlHinh1">
	<input type="button" name="btn-choose" id="btn-choose" value="Chọn File" onclick="BrowseServer('Images:/','urlHinh1')">
	<input type="text" name="link2" id="urlHinh2">
	<input type="button" name="btn-choose" id="btn-choose" value="Chọn File" onclick="BrowseServer('Images:/','urlHinh2')">

										
<br><br><br>
										<input type="hidden" name="luachon" value="insert">
										<button type="submit" class="btn btn-default w3ls-button">thêm sản phẩm</button>
									</form>
										<div class="form-group">
								    
							</div>		
									
									<br>										
<br>
									<p1> <a href="${root}/taothu/Admin/manager_product.jsp">
																			
										Trở lại</a></p1>
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