

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
			<h3>Xác Nhận Khôi phục tài khoản</h3>
              <%=request.getAttribute("e") %>
			<form action="${root}/taothu/ServletUser" method="post">
			<p>Vui long kiểm tra mail và điền mã vào ô bên dưới</p>
				<div class="key">
					<i class="fa fa-user" aria-hidden="true"></i>
					 <input type="text" name="ma"  placeholder="Mã xác nhận"></a>
					<div class="clearfix"></div>
				</div>
				<input type="hidden" value="<%=request.getParameter("mail") %>" name="mail">
				<input type="hidden" value="active1" name="luachon">
				<input id="submit" type="submit" value="xacnhan">
			</form>
		</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

