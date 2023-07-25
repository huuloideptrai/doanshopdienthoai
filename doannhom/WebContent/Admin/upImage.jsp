<%@page import="models.Images"%>
<%@page import="dao.ImageDAO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.IDAO"%>
<%@page import="models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String id= request.getParameter("productID");

Product p=(Product) new ProductDAO().getModel(Integer.parseInt(id)); 
session.setAttribute("id",Integer.parseInt(id));

%>
<body>


<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>

  	<div class="form-title"  >
									<h4>Thêm ảnh cho sản phẩm </h4>
								</div>

  <ul class="list-group wow fadeInUp animated" data-wow-delay=".5s" style="width:700px;">
							  <li class="list-group-item"> Tên sản phẩm : <%=p.getProductName() %></li>
							  <li class="list-group-item"> Giá : <%=p.getPrice()%></li>
							  <li class="list-group-item"> Màu sắc : <%=p.getColor()%></li>
							  <li class="list-group-item"> Số lượng còn trong kho : <%=p.getTotal() %></li>
							  <li class="list-group-item"> Chất liệu : <%=p.getMaterial()%></li>
							</ul>
						<br>	
  <h3>Thêm ảnh để sản phẩm được hiển thị lên đẹp hơn</h3>
  <br>
        <form method="post" action="${root}/taothu/ServletUpload" enctype="multipart/form-data">
 <h4 style="color: red; font-weight: bold;"> Chọn ảnh đại diện:</h4>
            <input type="file" name="anh" />
            <br/>
     <h4 style="color: red; font-weight: bold;">  Chọn ảnh chi tiết: </h4>
            <input type="file" name="anh" />
            <input type="file" name="anh" />
        
            <br/>
           
            <input type="submit" value="Upload" />
      
        </form>
        

<br>
    <a href="${root}/taothu/ServletQLsanpham?luachon=delete&productID=<%=p.getProductID()%>"> Hủy bỏ sản phẩm</a>
  <br>
    <a href="${root}/taothu/Admin/update_product.jsp?luachon=update&productID=<%=p.getProductID()%>"> Chỉnh sửa thông tin </a>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>