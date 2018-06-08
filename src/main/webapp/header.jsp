<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">GIS</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="page1"><a href="<%=request.getContextPath()%>/index.jsp">Trang chủ</a></li>
			<li class="page2"><a href="<%=request.getContextPath()%>/feature2.jsp">Chức năng 2</a></li>
			<li class="page3"><a href="<%=request.getContextPath()%>/feature3.jsp">Chức năng 3</a></li>
			<li class="page4"><a href="#">Chức năng 4</a></li>
			<li class="page5"><a href="#">Chức năng 5</a></li>
		</ul>
	</div>
	</nav>
</body>
</html>