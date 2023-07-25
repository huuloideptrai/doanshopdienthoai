<%@page import="java.util.Calendar"%>
<%@page import="models.Thongke"%>
<%@page import="models.MyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ChartDAO"%>
<%@page import="dao.IDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
 
<!-- Khai báo sử dụng JSTL Core Tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart</title>


</head>

  
<%  
IDAO charDAO= new ChartDAO();
ArrayList<MyModel> list= charDAO.getListModel();
 %>
 
<h2>Departments and Employees</h2>


         
         
         
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
                    ['Country', 'Area(square km)'],  <% for(int i=0;i<list.size();i++){
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
                dataTable.addColumn('number', 'Doanh Thu');
 
           
		
				
                
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
 
    </head>
 
    <body>
 
        <!--Div for our chart -->
        <div id="chart"></div>
        
         <div id="Chart2"></div>
 
</body>
</html>