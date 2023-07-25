<%@page import="models.User"%>
<%@page import="java.util.Map"%>
<%@page import="models.Item"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="models.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<%
Cart cart =(Cart) session.getAttribute("cart");
if(cart==null){
	cart= new Cart();
	session.setAttribute("cart", cart);
}
 User user= (User) session.getAttribute("user");
 if(user==null){
	 response.sendRedirect("login.jsp");
 }
%>

<div class="check-out">	 
		<div class="container">

	<div class="main-agileits col-md-8 "  style="width: 50%; float: left ;">
				<div class="form-w3agile" >
					<h3>Thông tin địa chỉ giao hàng</h3>
					<form action="ServletThanhtoan" method="post" class="form-dcgh" >
				
					<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="name" id="namegh" placeholder="Họ và tên" onchange="setinfo()">
							<div class="clearfix"></div>
						</div>

						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="phone"  id="phonegh" placeholder="Số điện thoại" onchange="setinfo()">
							<div class="clearfix"></div>
						</div>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="address" id="addressgh" placeholder="địa chỉ giao hàng" onchange="setinfo()">
							<div class="clearfix"></div>
						</div>
						<h3>Chọn cách thức thanh toán</h3>
						 
						<input type="hidden" value="checkout" name="luachon">
						<input type="submit" value="Thanh toán COD">
			       
					</form>
		   <form action="/taothu/vnpayajax" id="frmCreateOrder" method="post">        

					<input type="hidden" name="ordertype"  value="billpayment">
					<input type="hidden" name="amount" value="<%=cart.tongtien()+20000%>"> 
					<input type="hidden" name="language"  value="vn">  
						<input type="hidden" name="bankcode"  value="NCB"> 
						
						<input type="hidden" name="vnp_OrderInfo" id="vnp_OrderInfo"  value="test">  
						
					    <input type="submit" value="Thanh toán online">
					
					</form>
					
					</div>
				</div>
		
	
		
<div class="col-md-4 " style="width: 50%;float: left ;">
<h3>Thông tin đơn hàng( <%=cart.sosanphammua()%> SP)</h3>


	 <div class="but_list">
							<div class="col-md-6 page_1">
								
								  <table class="table table-bordered">
									<thead>
									
										<tr>
											<th width="50%"> Sản phẩm</th>
											<th width="50%">Số lượng</th>
											<th width="50%">Chất liệu</th>
											<th width="50%">kich thước</th>
											<th width="50%">Màu sắc</th>
											<th width="50%">Số tiền</th>
										</tr>
									</thead>
									<tbody>
									
  <% 
		  for (Map.Entry<Integer, Item> list	 : cart.getCartHashMap().entrySet()) { 
			  int gia= list.getValue().getProduct().getPrice()-(list.getValue().getProduct().getPrice()*list.getValue().getProduct().getPriority()/100);
				
		
			  %>
										<tr>
											<td><%=list.getValue().getProduct().getProductName() %></td>
											<td><span class="badge"><%=list.getValue().getQuantity() %></span></td>
											
												<td class="t-data"><%=list.getValue().getProduct().getMaterial()%></td>
												<td class="t-data"><%=list.getValue().getProduct().getSize()%></td>
												<td class="t-data"><%=list.getValue().getProduct().getColor()%></td>
											<td><span class="badge"><%=gia*list.getValue().getQuantity() %>VND</span></td>
										</tr>
										
										<%} %>
										
			
										
									</tbody>
									
									
								  </table>    
									<div class="list-group list-group-alternate"> 
									<a href="#" class="list-group-item"><span class="badge">Thành tiền</span> <i class="ti ti-email"></i> <%=cart.tongtien() %>VND </a> 
									<a href="#" class="list-group-item"><span class="badge"> Phí vận chuyển</span> <i class="ti ti-email"></i> 20000 VND </a> 
									<a href="#" class="list-group-item"><span class="badge"> Tổng Tiền</span> <i class="ti ti-email"></i><%=cart.tongtien()+20000  %>VND</a> 
									</div>
							</div>   <div class="clearfix"> </div>
	</div>
	</div>
	</div></div>
	 <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
           <script src="${root}/taothu/js/payment.js"></script>
	  <jsp:include page="footer.jsp"></jsp:include>
			