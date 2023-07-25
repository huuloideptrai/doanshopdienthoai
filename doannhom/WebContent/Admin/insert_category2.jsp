<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>thêm danh mục</title>
	

</head>
<jsp:include page="head.jsp"></jsp:include>
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
									<h4>Thêm danh mục </h4>
								</div>

								<div class="form-body" data-example-id="simple-form-inline">
									<form class="themdanhmuc" action="/taothu/ServletQLdanhmuc" method="post">
									 <div class="form-group"> <label for="exampleInputName2">Tên danh mục</label> 
									 <input type="text" name="tendanhmuc" class="form-control" id="exampleInputName2" placeholder="tên danh mục" value=<%=ten%>> <%=error%></div> 
									 <div class="form-group"> <label for="exampleInputEmail2">Mô tả</label>
									  <textarea name="mota" class="form-control ckeditor" id="exampleInputEmail2" placeholder="mô tả" value=<%=mt%>></textarea><%=error2%></div>
									   <div class="form-group"> <label for="exampleInputEmail2">Trạng thái ẩn hiện</label>
									   	  <input type="text" name="anhien" class="form-control" id="exampleInputEmail2" placeholder="0 or 1 "><%=error1%> </div>
									   	  <input type="hidden" name="luachon" value="insert">
									   <button type="submit" class="btn btn-default w3ls-button">thêm</button> </form> 
									   <br>
									 <p1> <a href="${root}/taothu/Admin/manager_category.jsp" > Trở lại</a></p1>
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