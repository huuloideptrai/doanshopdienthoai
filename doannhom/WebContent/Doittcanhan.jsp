

<%@page import="models.User"%>
<%
	request.setCharacterEncoding("utf-8");

	response.setCharacterEncoding("utf-8");
	 User user= (User) session.getAttribute("user");

	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
      $(document).ready(function () {
           var x_timer;
           $("#pw1").keyup(function (e) {
                clearTimeout(x_timer);
                var user_name = $(this).val();
                x_timer = setTimeout(function () {
                    check_username_ajax(user_name);
                }, 1000);
                });
 
           function check_username_ajax(username) {
                $("#user-result").html('loading...');
                $.post('ServletUser', {'pw0': username}, function (data) {
                    $("#user-result").html(data);
                 });
           }
       });
</script>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="login">

	<div class="main-agileits">
		<div class="form-w3agile">
			<h3>Sửa thông tin cá nhân</h3>

			<form action="ServletUser" method="post">
				<div class="key">
					<i class="fa fa-user" aria-hidden="true"></i>
					 <input type="text" name="name"  placeholder="Họ và tên" value="<%=user.getUsername() %>"></a>
					<div class="clearfix"></div>
				</div>
			
				
				<div class="key">
					<i class="fa fa-phone" aria-hidden="true"></i> <input type="text"
						name="sdt" placeholder="Số điện thoại"
						value="<%=user.getPhone()%>">
					<div class="clearfix"></div>
				</div>
				
				<div class="key">
					<i class="fa fa-lock" aria-hidden="true"></i> <input
						type="password" name="pw" placeholder="Mật khẩu cũ"
						value="">
					<div class="clearfix"></div>
				</div>
				<div class="key">
					<i class="fa fa-lock" aria-hidden="true"></i> <input
						type="password" name="pw2" placeholder="Mật khẩu mới"
						value="">
					<div class="clearfix"></div>
				</div>
				<div class="key">
				<span id="user-result"></span>
					<i class="fa fa-lock" aria-hidden="true"></i> <input
						type="password" name="pw1" id="pw1"
						placeholder="Nhập lại mật khẩu mới" value="">
					<div class="clearfix"></div>
				</div>
				<input type="hidden" value="<%=user.getUserID()%>" name="userID">
					<input type="hidden" value="<%=user.getEmail()%>" name="email">
						<input type="hidden" value="<%=user.getAddress()%>" name="address">
							<input type="hidden" value="<%=user.getSex()%>" name="sex">
				<input type="hidden" value="doimk" name="luachon">
				<input id="submit" type="submit" value="Cập nhật">
			</form>
		</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

