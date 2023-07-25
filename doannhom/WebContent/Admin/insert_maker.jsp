<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>thêm nhà cung cấp</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script src="<c:url value="/ckeditor/ckeditor.js" />"></script>
<jsp:include page="head.jsp"></jsp:include>
<body class="dashboard-page">
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String eten=(String) request.getAttribute("eten");
		String eemail=(String )request.getAttribute("eemail");
		String esdt=(String )request.getAttribute("esdt");
		String edc=(String )request.getAttribute("edc");
if(eten==null){
	eten="";
	
}
if(eemail==null){
	eemail="";
	
}
if(esdt==null){
	esdt="";
	
}
if(edc==null){
	edc="";
	
}
String ten="",sdt="",email="",dc="";
if(request.getParameter("ten")!=null){
	ten=request.getParameter("ten");
}
if(request.getParameter("sdt")!=null){
	sdt=request.getParameter("sdt");
}
if(request.getParameter("email")!=null){
	sdt=request.getParameter("email");
}
if(request.getParameter("dc")!=null){
	sdt=request.getParameter("dc");
}

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
									<h4>Thêm nhà cung cấp</h4>
								</div>

								<div class="form-body" data-example-id="simple-form-inline">
									<form class="themdanhmuc" action="${root}/taothu/ServletQLmaker" method="post">
									 <div class="form-group"> <label for="exampleInputName2">Tên nhà cung cấp</label> 
									 <input type="text" name="ten" class="form-control" id="exampleInputName2" placeholder="" value="<%=ten%>"><%=eten%></div> 
									
									 <div class="form-group"> <label for="exampleInputName2">Số điện thoại</label> 
									 <input type="text" name="sdt" class="form-control" id="exampleInputName2" placeholder="" value="<%=sdt%>"><%=sdt%> </div> 
									 


									 
									
									   <div class="form-group"> <label for="exampleInputEmail2">Email</label>
									   	  <input type="text" name="email" class="form-control" id="exampleInputEmail2" placeholder="" value="<%=email%>"> <%=eemail%></div>
									   	  <div class="form-group"> <label for="exampleInputEmail2">Địa chỉ</label>
									   	  <input type="text" name="dc" class="form-control" id="exampleInputEmail2" placeholder="" value="<%=dc%>"> <%=edc%></div>
									   	  
									   	  
									   	  
									   	  <input type="hidden" name="luachon" value="insert">
									   <button type="submit" class="btn btn-default w3ls-button">thêm</button> </form> 
									   <br>
									 <p1> <a href="${root}/taothu/Admin/manager_maker.jsp" > Trở lại</a></p1>
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