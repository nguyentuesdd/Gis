<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
<link type="text/css" href="css/style.css" rel="stylesheet" media="all" />
<!-- google map api -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7ZVhmqBT0By8htwjdjn22PIBzFJ1YThc&callback=myMap"></script>

<script type="text/javascript" src="js/map.js"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<center>
		<h1>Các trường đại học trên TP Hồ Chí Minh</h1>
		<div id="map"></div>
	</center>
</body>
</html>