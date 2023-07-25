

<%@page import="models.User"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setCharacterEncoding("utf-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="login">

	<div class="main-agileits">
		<div class="form-w3agile">
			<h3>Xác Nhận Thành Công</h3>

			<form action="${root}/taothu/login.jsp" >
					
		<h2> Mật khẩu đã được gửi vào email của bạn </h2>
				
	<h2> vui lòng đăng nhập và đổi mật khẩu để bảo mật hơn </h2>
	<br>
				<input id="submit" type="submit" value="Đăng nhập ">
			</form>
		</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

