<%@page import="dao.LienheDAO"%>
<%@page import="models.LienHe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<%LienHe llh= new LienheDAO().getlienhe(); %>
    <div class="contact">
	<div class="container">
		<h3>Liên Hệ</h3>
		<div class="col-md-3 col-sm-3 contact-left">
			
</div>
		
		
		</div>
	</div>
</div>



<jsp:include page="footer.jsp"></jsp:include>
    