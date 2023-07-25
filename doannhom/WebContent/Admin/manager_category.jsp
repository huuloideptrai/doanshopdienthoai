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
<title>Manager category</title>







</head>
<body class="dashboard-page" >
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
 IDAO categoryDAO  = new CategoryDAO();

ArrayList<MyModel> listCategogy = categoryDAO.getListModel();


%>



				<!-- tables -->
				
				<div class="table-heading">
					<h2>Quản Lí Danh Mục</h2>
				</div>
				<div class="agile-tables">
					<div class="w3l-table-info">
					  <h3>Thông tin danh mục</h3>
					  <a href="${root}/taothu/Admin/insert_category.jsp">Thêm Danh Mục</a>
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
							<th>Mã danh mục</th>
							<th>Tên danh mục</th>
							<th>Mô tả</th>
							<th>ẨN/Hiện </th>
							<th>Tùy chọn</th>
						  </tr>
									
									</thead>
									<tbody>
											<%  int dem=0;
						for(int i=0;i<listCategogy.size();i++){
							dem++;
							Category category= (Category)listCategogy.get(i);
						%>
						  <tr>
							<td><%=dem %></td>
							<td><%=category.getCategoryID()%></td>
							<td><%=category.getCategoryName()%></td>
							<td><%=category.getDiscription()%></td>
							<%if(category.getHide()==0){ %>
									<td> Ẩn</td>
									<%}else{ %>
									<td> Hiện</td>
									<%} %>
							<td>
							<a href="${root}/taothu/Admin/update_category.jsp?luachon=update&categoryID=<%=category.getCategoryID()%>"><img alt="" src="images/edit.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
                            <a href="${root}/taothu/ServletQLdanhmuc?luachon=delete&categoryID=<%=category.getCategoryID()%>"><img alt="" src="images/remove.png"  onclick="return confirmAction()"></a></td>

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
