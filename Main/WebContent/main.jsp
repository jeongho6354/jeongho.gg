<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    background-color: #0080FF;
}
.in {
	text-align : center;
}
.image {
	text-align : center;
}
</style>	
</head>
<body>
<div class = "image"> 
<img  src = "./image/pic.png" width="550" height="350">
</div>
<form action="action.jsp" method="post">
<div class = "in">
<input type = "text" name="id" style="width:600px;height:50px;font-size:30px;">
<input type = "submit" value="검색"/ style="width:70px;height:70px;">
</div>
</form>
</body>
</html>