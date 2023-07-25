<%@page import="models.Category"%>
<%@page import="models.MyModel"%>
<%@page import="models.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.IDAO"%>
<%@page import="models.Images"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ImageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>banner</title>

</head>
<body >
<%ImageDAO idao= new ImageDAO();
ProductDAO pdao= new ProductDAO();
ArrayList<Product> listsale= pdao.getListSpGiamGianhieunhat();
String a=idao.getanhbaner();
%>

<div class="banner-agile" style="background:url(<%=a%>) no-repeat 200px 0px; ">
	
</div>



</body>

</html>