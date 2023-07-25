<%@page import="dao.LienheDAO"%>
<%@page import="models.LienHe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<%LienHe lpaymen= new LienheDAO().getlienhe(); %>
<div class="payment">
	<div class="container">
		<h3>CÁCH THỨC THANH TOÁN</h3>
		<div class="payq1">
		<div class="panel-body" style="font:30px">
		<h4>1. Thanh toán COD</h4>
		<h4>1. Chuyển khoản ngân hàng</h4>
		<h4>1. Thanh toán bằng thẻ visa</h4>
		<p></p>
		</div>
   </div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
