<%@page import="model.University"%>
<%@page import="DAO.UniversityDAO"%>
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

</head>
<body>
	<%@include file="header.jsp"%>
	<script>
		$(".page1").addClass('active');
	</script>
	<center>
		<h1>Các trường đại học trên TP Hồ Chí Minh</h1>
		<div id="map"></div>
	</center>
	<script>
		window.onload = function() {
			var mapDiv = document.getElementById('map');
			var latlng = new google.maps.LatLng(10.771971, 106.697845);
			var options = {
				center : latlng,
				zoom : 8,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(mapDiv, options);
	<%for (University u : UniversityDAO.getAllUniversities()) {%>
		var marker<%=u.getId()%> = new google.maps.Marker({
				position : new google.maps.LatLng(<%=u.getLat()%>, <%=u.getLng()%>),
				title : '<%=u.getSname()%>'
			});
			marker<%=u.getId()%>.setMap(map);
			google.maps.event.addListener(marker<%=u.getId()%>, 'click', function() {
				var infowindow = new google.maps.InfoWindow({
					content : '<div id="info">' +
					'<h5><%=u.getSname()%></h5>' +
					'<p><b>Mã trường:</b> <%=u.getSid()%></p>' +
					'<p><b>Địa chỉ:</b> <%=u.getSaddress()%></p>' +
					'<p><b>Điểm sàn:</b> <%=u.getBenchmark()%></p>' +
					'<p><b>Chỉ tiêu tuyển sinh:</b> <%=u.getQuota()%></p>' +
					'<p><b>Website: <a href="http://www.<%=u.getWebsite()%>"><%=u.getWebsite()%></a></p>' +
					'</div>'
				});
				
				infowindow.open(map, marker<%=u.getId()%>);
			});
	<%}%>
		}
	</script>
</body>
</html>