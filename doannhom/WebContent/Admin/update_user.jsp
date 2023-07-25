<%@page import="models.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="models.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="models.MyModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>them danh muc</title>

</head>
<jsp:include page="head.jsp"></jsp:include>
<body class="dashboard-page">
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String t1 = "", t2 = "", t3 = "", t4 = "", t5 = "", t6 = "";
		if (request.getParameter("name") != null) {
			t1 = request.getParameter("name");
		}
		if (request.getParameter("pw") != null) {
			t2 = request.getParameter("pw");
		}

		if (request.getParameter("email") != null) {
			t3 = request.getParameter("email");
		}
		if (request.getParameter("sdt") != null) {
			t4 = request.getParameter("sdt");
		}
		if (request.getParameter("sex") != null) {
			t5 = request.getParameter("sex");
		}
		if (request.getParameter("address") != null) {
			t6 = request.getParameter("address");
		}

		int id = Integer.parseInt(request.getParameter("userID"));
		MyModel u1 = new UserDAO().getModel(id);
		User u = (User) u1;
	%>
	<jsp:include page="menu.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>

	<section class="wrapper scrollable">
		<div class="main-grid">
			<div class="agile-grids">
				<!-- input-forms -->
				<div class="grids">

					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-two widget-shadow">
								<div class="form-title">
									<h4>Chỉnh sửa khách hàng</h4>
								</div>

								<div class="form-body" data-example-id="simple-form-inline">
									<form class="themuser" action="${root}/taothu/ServletUser"
										method="post">
										<div class="form-group">
											<label for="exampleInputName2">Họ và Tên</label> <input
												type="text" name="name" class="form-control"
												id="exampleInputName2" placeholder=""
												value="<%=u.getUsername()%>">
										</div>

										<div class="form-group">
											<label for="exampleInputEmail2">Email</label> <input
												type="text" name="email" class="form-control"
												id="exampleInputEmail2" placeholder=""
												value="<%=u.getEmail()%>">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail2">Sđt</label> <input
												type="text" name="sdt" class="form-control"
												id="exampleInputEmail2" placeholder=""
												value="<%=u.getPhone()%>">
										</div>
										
										    <div class="form-group"> <label for="exampleInputEmail2">Giới tính</label>
									   	 
												<select
												class="form-control" id="exampleInputName2" name="sex">
											
											<%if(u.getSex()==0){ %>
												<option name="sex" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="0">Nam </option>
													
												<option name="sex" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="1">Nữ </option>
													<%} %>
													
													
											<%if(u.getSex()==1){ %>
												<option name="sex" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="1">Nữ</option>
													
												<option name="sex" class="form-control"
													id="exampleInputEmail2" placeholder=""
													value="0">Nam </option>
													<%} %>
													
											</select>
											
											
											
											
										</div>
										
										
										
									
										<div class="form-group">
											<label for="exampleInputEmail2">Địa chỉ</label> <input
												type="text" name="address" class="form-control"
												id="exampleInputEmail2" placeholder=""
												value="<%=u.getAddress()%>">
										</div>

										<input type="hidden" name="luachon" value="update"> <input
											type="hidden" name="userID"
											value="<%=request.getParameter("userID")%>">
										<button type="submit" class="btn btn-default w3ls-button">cập
											nhật</button>
									</form>

								</div>
							</div>
						</div>
					</div>



				</div>
				<!-- //input-forms -->
			</div>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>


	</section>



</body>
</html>