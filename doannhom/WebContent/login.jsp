<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<div class="login">
	
	<%
	String err="";
	if(request.getParameter("err")!=null){
		err=request.getParameter("err");
	}
	
	%>
	
	
		<div class="main-agileits">
				<div class="form-w3agile">
					<h3>Đăng nhập</h3>
					<form action="ServletUser" method="post">
					
					<%=err %>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true">  </i>
							<input  type="text" name="email" required="" placeholder="Email/Số điện thoại" id="email">
					
							<div class="clearfix">   </div>	
								
						</div> 
						<div class="key">
							<i class="fa fa-lock" aria-hidden="true"></i>
							<input  type="password" name="password" required="" placeholder="Mật khẩu">
							<div class="clearfix"></div>
						</div>
						
						
						<input type="hidden" value="login" name="luachon">
						<input type="submit" value="Đăng nhập">
						
					</form>
				</div>
				<div class="forg">
			<a href="resetpass.jsp" class="forg-left">Quên mật khẩu</a> 
					
			<a href="register.jsp" class="forg-right" >Đăng kí</a>
				<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>