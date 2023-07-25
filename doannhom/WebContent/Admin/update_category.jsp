<%@page import="models.Category"%>
<%@page import="models.MyModel"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>sua danh muc</title>
<jsp:include page="head.jsp"></jsp:include>
		
</head>
<body class="dashboard-page">
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String error=(String) request.getAttribute("error");
		String error1=(String )request.getAttribute("error1");
		String error2=(String )request.getAttribute("error2");
if(error==null){
	error="";
	
}
if(error1==null){
	error1="";
	
}
if(error2==null){
	error2="";
	
}
String ten="",mt="";
if(request.getParameter("tendanhmuc")!=null){
	ten=request.getParameter("tendanhmuc");
}
if(request.getParameter("mota")!=null){
	mt=request.getParameter("mota");
}

int id= Integer.parseInt(request.getParameter("categoryID"));
   MyModel  c= new CategoryDAO().getModel(id);
Category c1= (Category)c;
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
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
									<h4>cập nhật danh mục </h4>
								</div>

								<div class="form-body" data-example-id="simple-form-inline">
									<form class="suadanhmuc" action="${root}/taothu/ServletQLdanhmuc" method="post">
									 <div class="form-group"> <label for="exampleInputName2">Tên danh mục</label> 
								 
							<input type="text" name="tendanhmuc" class="form-control" id="exampleInputName2" placeholder="tên danh mục" value="<%=c1.getCategoryName()%>" > <%=error%></div> 
									
											<div class="form-group">
											
											   <textarea class="form-textarea" id="mota" name="mota" ><%=c1.getDiscription()%></textarea>
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
											<label for="exampleInputEmail2">Ẩn hiện</label> 
												<select
												class="form-control" id="exampleInputName2" name="anhien">
											
										<%if(c1.getHide()==0){ %>
												<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="<%=c1.getHide()%>">Ẩn</option>
												<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="1"> Hiện </option>
													<%}else{ %>
												<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="<%=c1.getHide()%>">Hiện </option>
													<option name="anhien" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="0"> Ẩn </option>
													
													<%
													}%>
													
											</select>
											
											
											
											
										</div>

											
									   	 
									   	 
									   	 
									   	  <input type="hidden" name="luachon" value="update">
									   	  <input type="hidden" name="categoryID" value="<%=request.getParameter("categoryID") %>">
									   <button type="submit" class="btn btn-default w3ls-button">cập nhật</button> </form> 
									   
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