<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckfinder/ckfinder.js"></script>
<script type="text/javascript">
	function BrowseServer(startupPath,functionData){
		var finder = new CKFinder();
		finder.basePath = 'ckfinder/'; //Đường path nơi đặt ckfinder
		finder.startupPath = startupPath; //Đường path hiện sẵn cho user chọn file
		finder.selectActionFunction = SetFileField; // hàm sẽ được gọi khi 1 file được chọn
		finder.selectActionData = functionData; //id của text field cần hiện địa chỉ hình
		//finder.selectThumbnailActionFunction = ShowThumbnails; //hàm sẽ được gọi khi 1 file thumnail được chọn	
		finder.popup(); // Bật cửa sổ CKFinder
	}
	
	function SetFileField(fileUrl,data){
		document.getElementById( data["selectActionData"] ).value = fileUrl;
	}
	
	function ShowThumbnails(fileUrl,data){	
		var sFileName = this.getSelectedFile().name; // this = CKFinderAPI
		document.getElementById( 'thumbnails' ).innerHTML +=
		'<div class="thumb">' +
		'<img src="' + fileUrl + '" />' +
		'<div class="caption">' +
		'<a href="' + data["fileUrl"] + '" target="_blank">' + sFileName + '</a> (' + data["fileSize"] + 'KB)' +
		'</div>' +
		'</div>';
		document.getElementById( 'preview' ).style.display = "";
		return false; // nếu là true thì ckfinder sẽ tự đóng lại khi 1 file thumnail được chọn
	}
</script>


</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Colored Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="${root}/taothu/Admin/css/bootstrap.css">
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="${root}/taothu/Admin/css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="${root}/taothu/Admin/css/font.css" type="text/css"/>
<link href="${root}/taothu/Admin/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<script src="${root}/taothu/Admin/js/jquery2.0.3.min.js"></script>
<script src="${root}/taothu/Admin/js/modernizr.js"></script>
<script src="${root}/taothu/Admin/js/jquery.cookie.js"></script>
<script src="${root}/taothu/Admin/js/screenfull.js"></script>
		<script>
		$(function () {
			$('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

			if (!screenfull.enabled) {
				return false;
			}

			

			$('#toggle').click(function () {
				screenfull.toggle($('#container')[0]);
			});	
		});
		</script>
<!-- charts -->
<script src="${root}/taothu/Admin/js/raphael-min.js"></script>
<script src="${root}/taothu/Admin/js/morris.js"></script>
<link rel="stylesheet" href="${root}/taothu/Admin/css/morris.css">
<!-- //charts -->
<!--skycons-icons-->
<script src="${root}/taothu/Admin/js/skycons.js"></script>
<!--//skycons-icons-->
<!-- tables -->
<link rel="stylesheet" type="text/css" href="${root}/taothu/Admin/css/table-style.css" />
<link rel="stylesheet" type="text/css" href="${root}/taothu/Admin/css/basictable.css" />
<script type="text/javascript" src="js/jquery.basictable.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();

      $('#table-breakpoint').basictable({
        breakpoint: 768
      });

      $('#table-swap-axis').basictable({
        swapAxis: true
      });

      $('#table-force-off').basictable({
        forceResponsive: false
      });

      $('#table-no-resize').basictable({
        noResize: true
      });

      $('#table-two-axis').basictable();

      $('#table-max-height').basictable({
        tableWrapper: true
      });
    });
</script>
</head>
<body class="dashboard-page" >
<script src="${root}/taothu/Admin/js/bootstrap.js"></script>


	
	<!-- agile-grid-right -->
<script src="${root}/taothu/Admin/js/graph.js"></script>
<!-- //agile-grid-right -->


	<!-- Datatables -->
			<script src="${root}/taothu/Admin/js/datatables/js/jquery.dataTables.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/tools/js/dataTables.tableTools.js"></script>

			<!-- Datatables-->
			<script src="${root}/taothu/Admin/js/datatables/jquery.dataTables.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/dataTables.bootstrap.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/dataTables.buttons.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/buttons.bootstrap.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/jszip.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/pdfmake.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/vfs_fonts.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/buttons.html5.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/buttons.print.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/dataTables.fixedHeader.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/dataTables.keyTable.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/dataTables.responsive.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/responsive.bootstrap.min.js"></script>
			<script src="${root}/taothu/Admin/js/datatables/dataTables.scroller.min.js"></script>
		<!-- pace -->
			<script src="${root}/taothu/Admin/js/pace/pace.min.js"></script>
			<script>
				var handleDataTableButtons = function() {
					"use strict";
					0 !== $("#datatable-buttons").length
							&& $("#datatable-buttons").DataTable({
								dom : "Bfrtip",
								buttons : [ {
									extend : "copy",
									className : "btn-sm"
								}, {
									extend : "csv",
									className : "btn-sm"
								}, {
									extend : "excel",
									className : "btn-sm"
								}, {
									extend : "pdf",
									className : "btn-sm"
								}, {
									extend : "print",
									className : "btn-sm"
								} ],
								responsive : !0
							})
				}, TableManageButtons = function() {
					"use strict";
					return {
						init : function() {
							handleDataTableButtons()
						}
					}
				}();
			</script>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#datatable').dataTable();
					$('#datatable-keytable').DataTable({
						keys : true
					});
					$('#datatable-responsive').DataTable();
					$('#datatable-scroller').DataTable({
						ajax : "js/datatables/json/scroller-demo.json",
						deferRender : true,
						scrollY : 380,
						scrollCollapse : true,
						scroller : true
					});
					var table = $('#datatable-fixed-header').DataTable({
						fixedHeader : true
					});
				});
				TableManageButtons.init();
			</script>
		
				
<SCRIPT LANGUAGE="JavaScript">
    function confirmAction() {
      return confirm("Bạn chắc chắn muốn xóa ? lưu ý :dữ liệu sau khi xóa sẽ mất vĩnh viễn")
    }</SCRIPT>
				
				
				


</body>
</html>