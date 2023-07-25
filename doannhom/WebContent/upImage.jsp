<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>up ảnh </title>
</head>
<body>
  <center>
        <form method="post" action="../ServletUpload" enctype="multipart/form-data">
            Select file to upload:
            <input type="file" name="daidien" />
            <br/>
            <input type="file" name="c1" />
            <input type="file" name="c2" />
            <input type="file" name="c3" />
            <br/>
            <input type="submit" value="Upload" />
        </form>
    </center>
</body>
</html>