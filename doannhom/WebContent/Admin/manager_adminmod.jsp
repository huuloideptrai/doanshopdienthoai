<%@page import="models.User"%>
<%@page import="dao.UserDAO"%>
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
<jsp:include page="head.jsp"></jsp:include>

</head>
<body class="dashboard-page" >

<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
 UserDAO userDAO  = new UserDAO();

ArrayList<MyModel> listu = userDAO.getListadmin();


%>



				<!-- tables -->
				
				<div class="table-heading">
					<h2>Quản Lí Adminmod</h2>
				</div>
				<div class="agile-tables">
					<div class="w3l-table-info">
					  <h3>Thông tin người quản lí</h3>
					  <a href="${root}/taothu/Admin/insert_admin.jsp">Thêm adminmod</a>
		
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
							<th>Tên khách hàng</th>
							<th>Email</th>
							<th>Địa chỉ</th>
							<th>giới tính</th>
							<th>Số điện thoại</th>
							<th>Tùy chọn</th>
						  </tr>
						</thead>
						<tbody>
						<%  int dem=0;
						for(int i=0;i<listu.size();i++){
							dem++;
							User user= (User)listu.get(i);
						%>
						  <tr>
							<td><%=dem %></td>
							<td><%=user.getUsername()%></td>
							<td><%=user.getEmail()%></td>
							<td><%=user.getAddress()%></td>
							
							<%if(user.getSex()==0){ %>
							<td>Nam</td>
							
							<%}else{
								%>
								<td>Nữ</td>
								
								
						<% 	}
							%>
							<td><%=user.getPhone()%></td>
						
							<td>
							<a href="${root}/taothu/Admin/update_admin.jsp?luachon=updateadmin&userID=<%=user.getUserID()%>"><img alt="" src="images/edit.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
                            <a href="${root}/taothu/ServletUser?luachon=deleteadmin&userID=<%=user.getUserID()%>"><img alt="" src="images/remove.png" onclick="return confirmAction()"></a></td>
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
