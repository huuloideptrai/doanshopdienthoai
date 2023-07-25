<%@page import="dao.LienheDAO"%>
<%@page import="models.LienHe"%>
<%@page import="models.Category"%>
<%@page import="models.MyModel"%>
<%@page import="dao.IDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager general </title>







</head>
<body class="dashboard-page" >
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
 LienHe lienhe= new LienheDAO().getlienhe();
 String eten=(String) request.getAttribute("eten");
 String eemail=(String )request.getAttribute("eemail");
 String esdt=(String )request.getAttribute("esdt");
 String edc=(String )request.getAttribute("edc");
 String echitiet=(String )request.getAttribute("edc");
 String edichvu=(String )request.getAttribute("edc");
 String ecachthuc=(String )request.getAttribute("edc");
 String ebando=(String )request.getAttribute("edc");
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
 if(edichvu==null){
	 edichvu="";

	 }
 if(echitiet==null){
	 echitiet="";

	 }
 if(ebando==null){
	 ebando="";

	 }
 if(ecachthuc==null){
	 ecachthuc="";

	 }
%>



				<!-- tables -->
				
				<div class="table-heading">
					<h2>Quản Lí Chung</h2>
				</div>
				<div class="agile-tables">
					<div class="w3l-table-info">
					  <h3>Thông tin cửa hàng </h3>
					
					  	<!-- page content -->
	
	
	
	
	
	
			<div class="form-body" data-example-id="simple-form-inline">
									<form class="qlchung" action="${root}/taothu/ServletQLchung" method="post">
									 <div class="form-group"> <label for="exampleInputName2">Tên Shop</label> <%=eten%>
									 <input type="text" name="ten" class="form-control" id="exampleInputName2" value="<%=lienhe.getTen()%>"></div> 
									   <div class="form-group"> <label for="exampleInputEmail2"> Số điện thoại</label><%=esdt%>
									   	  <input type="text" name="sdt" class="form-control" id="exampleInputEmail2" value="<%=lienhe.getSdt()%>"> </div>
									  
									     <div class="form-group"> <label for="exampleInputEmail2"> Email</label><%=eemail%>
									   	  <input type="text" name="email" class="form-control" id="exampleInputEmail2" value="<%=lienhe.getEmail()%>"> </div>
									 									  
									     <div class="form-group"> <label for="exampleInputEmail2"> Địa chỉ</label><%=edc%>
									   	  <input type="text" name="dc" class="form-control" id="exampleInputEmail2" value="<%=lienhe.getDc()%>"> </div>
									   	  
									      <div class="form-group"> <label for="exampleInputEmail2"> Link Bản đồ</label><%=ebando%>
									   	  <input type="text" name="bando" class="form-control" id="exampleInputEmail2"   value="<%=lienhe.getBando()%>"> </div>
									  <div class="form-group"> <label for="exampleInputEmail2"> Dịch vụ </label><%=edichvu%>
									   	  <input type="text" name="dichvu" class="form-control" id="exampleInputEmail2"   value="<%=lienhe.getDichvu()%>"> </div>
									 
									 
									   <div class="form-group"> <label for="exampleInputEmail2">Chi tiết Shop</label><%=echitiet%>
									  <textarea name="chitiet" class="form-control" id="exampleInputEmail2"  ><%=lienhe.getChitet()%></textarea></div>
									
          <script type="text/javascript">
		CKEDITOR.replace("chitiet", {
			filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
			filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?type=Images',
			filebrowserFlashBrowseUrl : '../ckfinder/ckfinder.html?type=Flash',
			filebrowserUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
			filebrowserImageUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
			filebrowserFlashUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
		});
	</script>
		
									 <div class="form-group"> <label for="exampleInputEmail2">Cách thức mua hàng</label><%=ecachthuc%>
									  <textarea name="cachthuc" class="form-control" id="exampleInputEmail2"  ><%=lienhe.getCachthuc()%></textarea></div>
									 <script type="text/javascript">
		CKEDITOR.replace("cachthuc", {
			filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
			filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?type=Images',
			filebrowserFlashBrowseUrl : '../ckfinder/ckfinder.html?type=Flash',
			filebrowserUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
			filebrowserImageUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
			filebrowserFlashUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
		});
	</script>
									
									
									
									 	  <input type="hidden" name="luachon" value="update">
									 
									   <button type="submit" class="btn btn-default w3ls-button">cập nhật</button> </form> 
									   
								</div>
					
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			<!-- /page content -->
				</div>
					</div>

					
				
			
		
					
					  
					  
					  	<jsp:include page="footer.jsp"></jsp:include>
		</body>
</html>
