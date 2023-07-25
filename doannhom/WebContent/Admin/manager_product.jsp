<%@page import="models.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="models.Product"%>
<%@page import="models.MyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.IDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager product</title>

</head>
<body class="dashboard-page">
	<jsp:include page="head.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>


	<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
 IDAO productDAO= new ProductDAO();
ArrayList<MyModel> listproduct = productDAO.getListModel();


%>







	<!-- tables -->

	<div class="table-heading">
		<h2>Quản Lí Sản Phẩm</h2>
	</div>
	<div class="agile-tables">
		<div class="w3l-table-info">
			<h3>Thông tin sản phẩm</h3>


			<a href="${root}/taothu/Admin/insert_product.jsp">Thêm Sản Phẩm</a>

		
 	<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
					
								
								<!--<table id="example" class="display" width="100%">
                        </table> -->
								<table id="datatable"
									class="table table-striped table-bordered responsive-utilities jambo_table">
									<thead>
										<tr class="headings">
													
						<th>STT</th>
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Mã danh mục</th>
									<th>Giảm giá</th>
									<th>Giá</th>
									<th>Cập nhật lần cuối</th>
									<th>Ẩn hiện</th>
									
									<th>Tùy chọn</th>
								</tr>
							</thead>
							<tbody>
								<%
						int dem=0;
						for(int i=0; i<listproduct.size();i++){
							dem++;
							
							Product p= (Product)listproduct.get(i);
						//	<td><%=p.getDescription() 
								
								IDAO c1 = new CategoryDAO();
								Category c=(Category) c1.getModel(p.getCategoryID());
						%>

								<tr>
									<td><%=dem %></td>
									<td><%=p.getProductID() %></td>
									<td><%=p.getProductName() %></td>
									
									
									
									<td><%=c.getCategoryName()%></td>
									<td><%=p.getPriority() %>%</td>
									<td><%=p.getPrice() %></td>
									<td><%=p.getLastupdate() %></td>
									
									<%if(p.getHide()==0){ %>
									<td> Ẩn</td>
									<%}else{ %>
									<td> Hiện</td>
									<%} %>
									<td><a
										href="${root}/taothu/ServletQLsanpham?luachon=delete&productID=<%=p.getProductID()%>"><img
											alt="" src="${root}/taothu/Admin/images/remove.png" onclick="return confirmAction()"></a>&nbsp;&nbsp; |
										&nbsp;&nbsp; <a
										href="${root}/taothu/Admin/update_product.jsp?luachon=update&productID=<%=p.getProductID()%>"><img
											alt="" src="${root}/taothu/Admin/images/edit.png"></a></td>
								</tr>
									<%} %>
									</tbody>
								</table>
							
					</div>
					</div>
					</div>
				<!-- /page content -->
				</div>
					</div>

					


	<jsp:include page="footer.jsp"></jsp:include>
</body>



</html>