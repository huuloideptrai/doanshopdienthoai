<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
      $(document).ready(function () {
           var x_timer;
           $("#email").keyup(function (e) {
                clearTimeout(x_timer);
                var user_name = $(this).val();
                x_timer = setTimeout(function () {
                    check_username_ajax(user_name);
                }, 1000);
                });
 
           function check_username_ajax(username) {
                $("#ahihi").html('loading...');
                $.post('Servletcheckmailresetpw', {'ten': username}, function (data) {
                    $("#ahihi").html(data);
                 });
           }
       });
</script>

<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<div class="login">
	
	<%
	String err="",t3="";
	if(request.getParameter("err")!=null){
		err=request.getParameter("err");
	}
	if(request.getParameter("email")!=null){
		t3=request.getParameter("email");
		}
	
	String re=(String) request.getAttribute("re");
	
	if(re==null){
		re="";
		
	}
	%>
	
	
		<div class="main-agileits">
				<div class="form-w3agile">
					<h3>Lấy lại mật khẩu</h3>
					<form action="ServletUser" method="post">
					
					<%=err %>
						<div class="key">
						
							<i class="fa fa-envelope" aria-hidden="true">  </i>
							<input  type="text" name="email" required="" placeholder="Email" id="email" value="<%=t3%>">
					
							<div class="clearfix">   </div>	
								
						</div> 
							<span id="ahihi"></span>
						<span ><%=re %></span>
						<input type="hidden" value="resetpass" name="luachon">
						<input type="submit" value=" lấy lại mật khẩu">
						
					</form>
				</div>
				<div class="forg">
					
					<a href="register.jsp" class="forg-right">Đăng kí</a>
				<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>