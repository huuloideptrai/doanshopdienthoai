<%@page import="common.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="models.User"%>
<%@page import="models.Cart"%>
<%@page import="models.Order"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>VNPAY RESPONSE</title>
        <!-- Bootstrap core CSS -->
        <link href="${root}/taothu/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="${root}/taothu/assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="${root}/taothu/assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <% 
        User user= (User) session.getAttribute("user");
        if(user==null){
       	 response.sendRedirect("login.jsp");
        }
             Order order= (Order) session.getAttribute("order");
             Cart cart =(Cart) session.getAttribute("cartold");
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = (String) params.nextElement();
                String fieldValue = request.getParameter(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY RESPONSE</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã thanh toan:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>  
                <div class="form-group">
                    <label >Mã đơn hàng:</label>
                    <label><%=order.getOrderID()%></label>
                    <input type="hidden" id="orderID" value="<%=order.getOrderID()%>">
                      
             
                </div>  
                  
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label><%=request.getParameter("vnp_Amount")%></label>
                </div>  
                <div class="form-group">
                    <label >Nội dung thanh toán:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã phản hồi (vnp_ResponseCode):</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã GD Tại VNPAY:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã Ngân hàng:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Kết quả:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                                    out.print("GD Thanh cong");
                                    %> 
                                    <input type="hidden" id="trangthai" name="trangthai" value="2">
                                    
                                     <%                                   
                                } else {
                                	
                                	
                                    out.print("GD Khong thanh cong");
                                	session.setAttribute("cart", cart);
                                    %> 
                                    <input type="hidden" id="trangthai" name="trangthai" value="0">
                                      <input type="hidden" id="submitUrl" 
                     
                     value= "/taothu/ServletQLdonhang?luachon=delete&orderID=<%=order.getOrderID()%>&email=<%=user.getEmail()%>">
             
                                     <%
                                }

                            } else {
                                out.print("Chu ky khong hop le");
                            	session.setAttribute("cart", cart);
                                
                                %> 
                                <input type="hidden" id="trangthai" name="trangthai" value="0">
                                  <input type="hidden" id="submitUrl" 
                     
                     value= "/taothu/ServletQLdonhang?luachon=delete&orderID=<%=order.getOrderID()%>&email=<%=user.getEmail()%>">
             
                                 <%
                            }
                        %></label>
                </div> 
            </div>
            
            <a href="index.jsp" class="hyper "><span>Tiep tuc mua sam</span></a>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>  
        
    </body>
            <script src="${root}/taothu/js/paymentReturn.js"></script>
    
</html>
