<%@page import="models.Maker"%>
<%@page import="dao.MakerDAO"%>

<%@page import="models.MyModel"%>
<%@page import="dao.IDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager maker</title>

</head>
<body class="dashboard-page" >
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
 IDAO makerDAO  = new MakerDAO();

ArrayList<MyModel> listmaker = makerDAO.getListModel();


%>



				<!-- tables -->
				
				<div class="table-heading">
					<h2>Quản Lí Nhà Cung Cấp</h2>
				</div>
				<div class="agile-tables">
					<div class="w3l-table-info">
					  <h3>Thông tin nhà cung cấp</h3>
					  <a href="${root}/taothu/Admin/insert_maker.jsp">Thêm nhà cung cấp</a>
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
							<th>Mã nhà cung cấp</th>
							<th>Tên nhà cung cấp</th>
							<th>Số điện thoại</th>
							<th>Email</th>
							<th>Địa chỉ</th>
							<th>Tùy chọn</th>
						  </tr>
									
									</thead>
									<tbody>
											<%  int dem=0;
						for(int i=0;i<listmaker.size();i++){
							dem++;
							Maker m= (Maker)listmaker.get(i);
						%>
						  <tr>
							<td><%=dem %></td>
							<td><%=m.getMakerID()%></td>
							<td><%=m.getName()%></td>
							<td><%=m.getPhone()%></td>
							<td><%=m.getEmail()%></td>
							<td><%=m.getAddress()%></td>
							<td>
							<a href="${root}/taothu/Admin/update_maker.jsp?luachon=update&makerID=<%=m.getMakerID()%>"><img alt="" src="images/edit.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
                            <a href="${root}/taothu/ServletQLmaker?luachon=delete&makerID=<%=m.getMakerID()%>"><img alt="" src="images/remove.png"  onclick="return confirmAction()"></a></td>

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
