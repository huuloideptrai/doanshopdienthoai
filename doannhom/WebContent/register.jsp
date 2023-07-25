

<%
	request.setCharacterEncoding("utf-8");

	response.setCharacterEncoding("utf-8");
	
	

String t1="",t2="",t3="",t4="",t5="",t6="";
if(request.getParameter("name")!=null){
t1=request.getParameter("name");
}
if(request.getParameter("pw")!=null){
t2=request.getParameter("pw");
}


if(request.getParameter("email")!=null){
t3=request.getParameter("email");
}
if(request.getParameter("sdt")!=null){
t4=request.getParameter("sdt");
}
if(request.getParameter("sex")!=null){
t5=request.getParameter("sex");
}
if(request.getParameter("address")!=null){
t6=request.getParameter("address");
}
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="login">

	<div class="main-agileits">
		<div class="form-w3agile">
			<h3>Đăng kí</h3>

			<form action="ServletUser" method="post">
				<div class="key">
					<i class="fa fa-user" aria-hidden="true"></i>
					 <input type="text" name="name"  placeholder="Họ và tên" value="<%=t1%>"></a>
					<div class="clearfix"></div>
				</div>
			
				<div class="key"> 			
						<span id="user-result"></span>
					<i class="fa fa-envelope" aria-hidden="true"></i> <input
						type="text" name="email" placeholder="Email" id="email"
						value="<%=t3%>">
						<div class="clearfix"></div>
				</div>
				
				<div class="key">
					<i class="fa fa-phone" aria-hidden="true"></i> <input type="text"
						name="sdt" placeholder="Số điện thoại"
						value="<%=t4%>">
					<div class="clearfix"></div>
				</div>
				
				<div class="key">
					<i class="fa fa-lock" aria-hidden="true"></i> <input
						type="password" name="pw" placeholder="Mật khẩu"
						value="">
					<div class="clearfix"></div>
				</div>
				
				<div class="key">
					<i class="fa fa-lock" aria-hidden="true"></i> <input
						type="password" name="pw" 
						placeholder="Nhập lại mật khẩu" value="">
					<div class="clearfix"></div>
				</div>
				<input type="hidden" value="register" name="luachon">
				<input id="submit" type="submit" value="Đăng ký">
			</form>
		</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

