<%@page import="models.Thongke"%>
<%@page import="java.util.Calendar"%>
<%@page import="dao.IDAO"%>
<%@page import="dao.ChartDAO"%>
<%@page import="models.MyModel"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<title>thong ke</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Colored Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    
     
</head>


 
<jsp:include page="head.jsp"></jsp:include>
<body class="dashboard-page">
<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
		
		


				
				<%  
IDAO charDAO= new ChartDAO();
ArrayList<MyModel> list= charDAO.getListModel();
 %>
 
<div class="chart-heading">
					<h2>Thống Kê</h2>
				</div>


         
         
         
          <!-- load Google AJAX API -->
        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
         <script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Tên danh mục', 'Số sản phẩm'],  <% for(int i=0;i<list.size();i++){
                   Thongke t= (Thongke) list.get(i);
                   %> 
                   [ '<%=t.getTen()%>',<%=t.getSoluong()%>  ], <%}%>
                
                ]);
                // Set chart options
                var options = {
                    'title': 'Thống kê số lượng sản phẩm theo danh mục',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('Chart2'));
                chart.draw(data, options);
            }
        </script>
        
        <script type="text/javascript">
            //load the Google Visualization API and the chart
            google.load('visualization', '1', {'packages': ['columnchart']});
 
            //set callback
            google.setOnLoadCallback (createChart);
 
            //callback function
            function createChart() {
 
                //create data table object
                var dataTable = new google.visualization.DataTable();
           <% Calendar c = Calendar.getInstance();
                  			         int nam = c.get(Calendar.YEAR);%>
                //define columns
                dataTable.addColumn('string','Thống kê Doanh thu');
                dataTable.addColumn('number', 'VNĐ');
 
           
		
				
                
                //define rows of data
                dataTable.addRows([
                                   
                                   
                                   <% for(int i=1;i<=12;i++){
                  			         ChartDAO chartDAO= new ChartDAO();
                  			    	
                  			         %>
                  			         
                                   
                                   ['Tháng <%=i%>', <%=chartDAO.doanhThuTheoThang(i, nam)%>], 
                                   
                               	<%}%> 
                                   
                                   
                                   ]);
			
                
                //instantiate our chart object
                var chart = new google.visualization.ColumnChart (document.getElementById('chart'));
 
                //define options for visualization
                var options = {width: 700, height: 300, is3D: true, title: 'Thống kê Doanh thu theo từng tháng của năm <%=nam%>'};
 
                //draw our chart
                chart.draw(dataTable, options);
 
            }
        </script>
 


 
        <!--Div for our chart -->
        <div class="col-md-6 agile-grid-left">
        
        <div id="graph">
        <div id="graph-wrapper">
        <div class="bd1" id="chart"
             
         style="margin:auto 0 "></div></div>
         
         </div></div>
        <div class="col-md-6 agile-grid-right">
          <div id="graph">
          <div id="graph-wrapper">
         <div class="bd1" id="Chart2"
         
         style="margin:auto 0 "
         
         
         ></div></div>
         </div></div>
				
				
				
				
				
				
				
				
				
				
				
				
				
<jsp:include page="footer.jsp"></jsp:include>





   
  </body>





</html>