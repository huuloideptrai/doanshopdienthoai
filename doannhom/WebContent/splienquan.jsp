<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
    	<div class="check-out">	 
		<div class="container">	 
	 <div class="spec ">
				<h3>Recommended</h3>
					<div class="ser-t">
						<b></b>
						<span><i></i></span>
						<b class="line"></b>
					</div>
			</div>
				<script>$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cross').fadeOut('slow', function(c){
							$('.cross').remove();
						});
						});	  
					});
			   </script>
			<script>$(document).ready(function(c) {
					$('.close2').on('click', function(c){
						$('.cross1').fadeOut('slow', function(c){
							$('.cross1').remove();
						});
						});	  
					});
			   </script>	
			   <script>$(document).ready(function(c) {
					$('.close3').on('click', function(c){
						$('.cross2').fadeOut('slow', function(c){
							$('.cross2').remove();
						});
						});	  
					});
			   </script>	
 <table class="table ">
		  <tr>
			<th class="t-head head-it ">Products</th>
			<th class="t-head">Name</th>
			<th class="t-head">Price</th>
		

			<th class="t-head">Purchase</th>
		  </tr>
		  <tr class="cross">
			<td class="ring-in t-data">
				<a href="single.jsp" class="at-in">
					<img src="images/rec1.jpg" class="img-responsive" alt="">
				</a>

				<div class="clearfix"> </div>
				<div class="close1"> <i class="fa fa-times" aria-hidden="true"></i></div>
			 </td>
			 <td class="t-data">Eye shades</td>
			<td class="t-data">$50.00</td>


			<td class="t-data">							<form action="#" method="post">
								<input type="hidden" name="cmd" value="_cart" />
								<input type="hidden" name="add" value="1" /> 
								<input type="hidden" name="w3ls1_item" value="Eye shades" /> 
								<input type="hidden" name="amount" value="50.00" /> 
								<button type="submit" class="w3ls-cart pw3ls-cart"> <a class=" add-1">Add To Cart</a></button>
							</form></td>
			
		  </tr>
		  <tr class="cross1">
		  <td class="t-data ring-in"><a href="single.jsp" class="at-in"><img src="images/rec3.jpg" class="img-responsive" alt=""></a>
	
			<div class="clearfix"> </div>
							<div class="close2"> <i class="fa fa-times" aria-hidden="true"></i></div>
</td>
<td class="t-data">Eye shades</td>
			<td class="t-data">$80.00</td>



			<td class="t-data">							<form action="#" method="post">
								<input type="hidden" name="cmd" value="_cart" />
								<input type="hidden" name="add" value="1" /> 
								<input type="hidden" name="w3ls1_item" value="Eye shades" /> 
								<input type="hidden" name="amount" value="80.00" /> 
								<button type="submit" class="w3ls-cart pw3ls-cart"> <a class=" add-1">Add To Cart</a></button>
							</form></td>
			
		  </tr>
		  <tr class="cross2">
		  <td class="t-data ring-in"><a href="single.jsp" class="at-in"><img src="images/rec2.jpg" class="img-responsive" alt=""></a>

			<div class="clearfix"> </div>
				<div class="close3"> <i class="fa fa-times" aria-hidden="true"></i></div>
			</td>
			<td class="t-data">Hair oil</td>
			<td class="t-data">50.00</td>


			<td class="t-data">							<form action="#" method="post">
								<input type="hidden" name="cmd" value="_cart" />
								<input type="hidden" name="add" value="1" /> 
								<input type="hidden" name="w3ls1_item" value="Hair oil" /> 
								<input type="hidden" name="amount" value="50.00" /> 
								<button type="submit" class="w3ls-cart pw3ls-cart"><a class=" add-1">Add To Cart</a></button>
							</form></td>
			
		  </tr>
	</table>
		 </div>
		 </div>
		 				
	<!--quantity-->
			<script>
			$('.value-plus').on('click', function(){
				var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
				divUpd.text(newVal);
			});

			$('.value-minus').on('click', function(){
				var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
				if(newVal>=1) divUpd.text(newVal);
			});
			</script>
			<!--quantity-->
			<jsp:include page="footer.jsp"></jsp:include>
			