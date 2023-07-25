
<%@page import="dao.UserDAO"%>
<%@page import="models.User"%>
<%@page import="models.Order"%>
<%@page import="models.MyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager bill</title>

</head>
<body class="dashboard-page" >
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<%

ArrayList<MyModel > listorder= new OrderDAO().getListModel();

%>





				<!-- tables -->
				
				<div class="table-heading">
					<h2>Quản Lí Đơn Hàng</h2>
				</div>
				<div class="agile-tables">
					<div class="w3l-table-info">
					  <h3>Thông tin đơn hàng</h3>
			
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
													
														
							<th>Mã đơn hàng</th>
							<th>khách hàng</th>
							<th>Ngày mua</th>
							<th>Tổng tiền</th>
							<th>Địa chỉ</th>
							<th>Đã xác nhận</th>
							<th>Tùy chọn</th>
							<th>Xem chi tiết</th>
							
						  </tr>
						</thead>
						<tbody>
						<%for(int i=0;i<listorder.size();i++){
							Order o= (Order)listorder.get(i);
							User u= (User) new UserDAO().getModel(o.getUserID() );
							%>
						
						  <tr>
							<td><%=o.getOrderID() %></td>
							<td><%=u.getEmail() %> | <%=u.getPhone() %></td>
							<td><%=o.getDatecreate() %></td>
							<td><%=o.getTotal() %></td>
							<td><%=o.getPay() %></td>
							<% if(o.getHide()==1){ %>
							<td>Đã thanh toán</td>
							
							<td>
							<a href="${root}/taothu/ServletQLdonhang?luachon=delete&orderID=<%=o.getOrderID()%>&email=<%=u.getEmail()%>"><img alt="" src="images/remove.png" onclick="return confirmAction()"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
 <a href="${root}/taothu/ServletQLdonhang?luachon=danggiao&orderID=<%=o.getOrderID()%>&email=<%=u.getEmail()%>""><img alt="" src="images/dgh.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
                            <a href="${root}/taothu/ServletQLdonhang?luachon=active&orderID=<%=o.getOrderID()%>&email=<%=u.getEmail()%>""><img alt="" src="images/ok.ico"></a>
                            
                           
                            </td>
							<%}else if(o.getHide()==2){ %>
							
							<td>Đang giao hàng</td>
							
							<td>
							<a href="${root}/taothu/ServletQLdonhang?luachon=delete&orderID=<%=o.getOrderID()%>&email=<%=u.getEmail()%>"><img alt="" src="images/remove.png" onclick="return confirmAction()"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
 
                            <a href="${root}/taothu/ServletQLdonhang?luachon=active&orderID=<%=o.getOrderID()%>&email=<%=u.getEmail()%>""><img alt="" src="images/ok.ico"></a>
                            
                           
                            </td>
							<%}
							
                         else if(o.getHide()==3){ %>
							
							<td>Đã thanh toán online</td>
							
							<td>
							<a href="${root}/taothu/ServletQLdonhang?luachon=delete&orderID=<%=o.getOrderID()%>&email=<%=u.getEmail()%>"><img alt="" src="images/remove.png" onclick="return confirmAction()"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
 
                            <a href="${root}/taothu/ServletQLdonhang?luachon=danggiao&orderID=<%=o.getOrderID()%>&email=<%=u.getEmail()%>"><img alt="" src="images/dgh.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
       
                           
                            </td>
							<%}
							
							else{ %>
							
							
							<td> Chưa Xem</td>
							
							<td>
							<a href="${root}/taothu/ServletQLdonhang?luachon=delete&orderID=<%=o.getOrderID()%>&email=<%=u.getEmail()%>"><img alt="" src="images/remove.png" onclick="return confirmAction()"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
 <a href="${root}/taothu/ServletQLdonhang?luachon=danggiao&orderID=<%=o.getOrderID()%>&email=<%=u.getEmail()%>"><img alt="" src="images/dgh.png"></a>&nbsp;&nbsp;
                          
                           
                            </td>
							
							<%} %>
							
							
							
							
							
						 
						 <td><a href="${root}/taothu/Admin/manager_orderdetail.jsp?orderID=<%=o.getOrderID()%>" > Chi tiết</a></td>
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