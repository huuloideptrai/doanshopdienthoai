<%@page import="models.Maker"%>
<%@page import="dao.MakerDAO"%>
<%@page import="models.Category"%>
<%@page import="models.MyModel"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Sửa nhà cung cấp</title>
<jsp:include page="head.jsp"></jsp:include>
		
</head>
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

int id= Integer.parseInt(request.getParameter("makerID"));
   MyModel  c= new MakerDAO().getModel(id);
Maker m= (Maker)c;

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
									<h4>cập nhật nhà sản xuất </h4>
								</div>

								<div class="form-body" data-example-id="simple-form-inline">
									<form class="suamaker" action="${root}/taothu/ServletQLmaker" method="post">
									 <div class="form-group"> <label for="exampleInputName2">Tên nhà cung cấp</label> 
									 <input type="text" name="ten" class="form-control" id="exampleInputName2"  value="<%=m.getName()%> "> <%=eten%></div> 
									 <div class="form-group"> <label for="exampleInputEmail2">Số điện thoại</label>
									  <input type="text" name="sdt" class="form-control" id="exampleInputName2" value="<%=m.getPhone()%>" > <%=esdt%></div> 
									  <div class="form-group"> <label for="exampleInputEmail2">email</label>
									   	  <input type="text" name="email" class="form-control" id="exampleInputEmail2"  value="<%=m.getEmail()%>"><%=eemail%> </div>
									   	  <div class="form-group"> <label for="exampleInputEmail2">Địa chỉ</label>
									   	  <input type="text" name="dc" class="form-control" id="exampleInputEmail2"  value="<%=m.getAddress()%>"><%=edc%> </div>
									   	
									   	
									   	  <input type="hidden" name="luachon" value="update">
									   	  <input type="hidden" name="makerID" value="<%=request.getParameter("makerID") %>">
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