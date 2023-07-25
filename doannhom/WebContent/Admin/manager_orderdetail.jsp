
<%@page import="dao.ProductDAO"%>
<%@page import="models.Orderdetail"%>
<%@page import="dao.OrderdetailDAO"%>
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
String orderID="";
if(request.getParameter("orderID")!=null){
	orderID=request.getParameter("orderID");
	
}
ArrayList<MyModel > list= new OrderdetailDAO().getListOrderdetailByorderID(Integer.parseInt(orderID));
ProductDAO p= new ProductDAO();
%>





				<!-- tables -->
				
				<div class="table-heading">
					<h2>Chi tiết Đơn Hàng</h2>
				</div>
				<div class="agile-tables">
					<div class="w3l-table-info">
					  <h3>Thông tin chi tiết đơn hàng</h3>
			
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
							<th>Tên sản phẩm </th>
							<th>Chất liệu</th>
							<th> Màu sắc</th>
							<th>Kích thước </th>
							<th>Số lượng</th>
							<th>Gía</th>
							
						  </tr>
						</thead>
						<tbody>
						<%for(int i=0;i<list.size();i++){
							Orderdetail o= (Orderdetail)list.get(i);
							%>
						
						  <tr>
							<td><%=o.getOrderID() %></td>
							<td><%=p.getName(o.getProductID()) %></td>
							<td><%=o.getChatlieu() %></td>
							<td><%=o.getMau() %></td>
							<td><%=o.getKichthuoc() %></td>
							<td><%=o.getQuantity() %></td>
							<td><%=o.getUnitprice() %></td>
							
							
							  </tr>
									<%} %>
									</tbody>
								</table>
								
								<a href="${root}/taothu/Admin/manager_order.jsp"> Trở về </a>
							
					</div>
					</div>
					</div>
				<!-- /page content -->
				</div>
					</div>

					
		<jsp:include page="footer.jsp"></jsp:include>
		</body>

</html>