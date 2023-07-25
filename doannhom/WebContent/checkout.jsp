<%@page import="models.MyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ImageDAO"%>
<%@page import="models.Images"%>
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
ImageDAO idao = new ImageDAO();
Cart cart =(Cart) session.getAttribute("cart");
if(cart==null){
	cart= new Cart();
	session.setAttribute("cart", cart);
}
 User user= (User) session.getAttribute("user");
 if(user==null){
	 response.sendRedirect("login.jsp");
 }
 
 ArrayList<Images> listanh= idao.getListImage();
 
%>


    	<div class="check-out">	 
		<div class="container">	 
		
		
	 <div class="spec ">
				<h3>Đơn Hàng Của Bạn</h3>
					<div class="ser-t">
						<b></b>
						<span><i></i></span>
						<b class="line"></b>
					</div>
			</div>
				<script>$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cross').fadeOut('slow', function(c){
							$('.cross').remove();
						});
						});	  
					});
			   </script>
			<script>$(document).ready(function(c) {
					$('.close2').on('click', function(c){
						$('.cross1').fadeOut('slow', function(c){
							$('.cross1').remove();
						});
						});	  
					});
			   </script>	
			   <script>$(document).ready(function(c) {
					$('.close3').on('click', function(c){
						$('.cross2').fadeOut('slow', function(c){
							$('.cross2').remove();
						});
						});	  
					});
			   </script>	
<table class="table ">
		  <tr>
			<th class="t-head ">STT</th>
			<th class="t-head">Tên sản phẩm</th>
			<th class="t-head">Hình ảnh</th>
			<th class="t-head">Số lượng</th>
			<th class="t-head">Chất liệu</th>
			<th class="t-head">kichthuoc</th>
			<th class="t-head">mausac</th>
		<th class="t-head">Giá tiền</th>
	     <th class="t-head">Tổng tiền</th>

			<th class="t-head">Thao tác</th>
		  </tr>
		  
		  <%
		  int count=0;
		  for (Map.Entry<Integer, Item> list	 : cart.getCartHashMap().entrySet()) { 

				 count++;
				int gia= list.getValue().getProduct().getPrice()-(list.getValue().getProduct().getPrice()*list.getValue().getProduct().getPriority()/100);
		  %>
		  
		 	  <tr class="cross">
			 <td class="t-data"><%=count%></td>
			
			 <td class="t-data"><%=list.getValue().getProduct().getProductName() %></td>
			 <%
			 
				 for(int i=0; i< listanh.size();i++){
				 Images image = (Images) listanh.get(i);
				 if(image.getProductID()==list.getValue().getProduct().getProductID()){
				 
				 String linkanh=image.getLink();
			
				 %>
			<td class="t-data" style="width: 200px;"><img alt="" src="<%=linkanh%>" style="width: 50%"> </td><%}} %>
			<td  class="t-data"><%=list.getValue().getQuantity() %></td>
			<td class="t-data"><%=list.getValue().getProduct().getMaterial()%></td>
			<td class="t-data"><%=list.getValue().getProduct().getSize()%></td>
			<td class="t-data"><%=list.getValue().getProduct().getColor()%></td>
			<td class="t-data"><%=gia%></td>
			
			<td class="t-data"><%=gia*list.getValue().getQuantity() %></td>
			<td class="t-data">				
			<form action="Servletgiohang">
				<input type="hidden" name=luachon value="update">
				
				<input type="hidden" name=productID value="<%=list.getKey()%>">
             <input type="number" name=soluong  width="5">
             <input type="submit" value="Câp nhật số lượng" >
          
								<a href="Servletgiohang?luachon=remove&productID=<%=list.getKey()%>">
								<span class="glyphicon glyphicon-remove-sign" style="width: 30px;"></span></a>
							   </form></td>
			
		  </tr>
		  
		  
		  <%} %>
		  
		  <tr>
		  <td colspan="8" >Thành tiền: </td>
		  <td> <%=cart.tongtien() %>VNĐ</td>
		  <td></td>
		  </tr>
		  
	</table>
	    	 
		 
		 		<span class="glyphicon glyphicon-chevron-left"></span>
		 <a href="${root}/taothu/index.jsp">Tiếp tục mua hàng</a>
		<a href="${root}/taothu/pay.jsp"> <input style="float: right;" class="btn btn-success btnthanhtoan" type="button" value="Thanh toán"></a>
		
		 
		 </div>
		
		 </div>
		
		 				
	<!--quantity-->
			<script>
			$('.value-plus').on('click', function(){
				var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
				divUpd.text(newVal);
			});

			$('.value-minus').on('click', function(){
				var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
				if(newVal>=1) divUpd.text(newVal);
			});
			</script>
			<!--quantity-->
			<jsp:include page="footer.jsp"></jsp:include>
			