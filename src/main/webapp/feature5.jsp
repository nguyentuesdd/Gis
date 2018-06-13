<%@page import="model.Information"%>
<%@page import="DAO.SectorDAO"%>
<%@page import="model.Sector"%>
<%@page import="DAO.UniversityDAO"%>
<%@page import="model.University"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chức năng 5</title>
<link type="text/css" href="css/style.css" rel="stylesheet" media="all" />
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7ZVhmqBT0By8htwjdjn22PIBzFJ1YThc&callback=myMap"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<script>
		$(".page5").addClass('active');
	</script>
	<center>
		<h1>Các trường đại học trên TP Hồ Chí Minh</h1>
		<p id="demo"></p>
		<ul>
			<li>Bán kính(m):<input type="text" id="num" name="num"></li> 
			<li>Tên ngành:<input type="text" id="nganh" name="nganh"> </li>
		</ul>
		<input type="button"
			value="Get" onclick='call()'>
		<div id="map"></div>
		<br>
		<br>
	</center>

	<script>
		var x = document.getElementById("demo");

		function call() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition2,
						showError);
			} else {
				x.innerHTML = "Geolocation không được hỗ trợ bởi trình duyệt này.";
			}
		}

		/* Lấy giá trị từ các input */
		function showPosition2(position) {
			var numb = document.getElementById("num").value;
			var nganh = document.getElementById("nganh").value;
			window.location.replace("feature5.jsp?lat="
					+ position.coords.latitude + "&lng="
					+ position.coords.longitude + "&num=" + numb
					+ "&nganh=" + nganh);
		}

		window.onload = function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition,
						showError);
			} else {
				x.innerHTML = "Geolocation không được hỗ trợ bởi trình duyệt này.";
			}
		}

		function showPosition(position) {
			var mapDiv = document.getElementById('map');
			/* Lấy ra tọa độ của bản thân */
			var latlng = new google.maps.LatLng(position.coords.latitude,
					position.coords.longitude);

			var options = {
				center : latlng,
				zoom : 8,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(mapDiv, options);
			var marker = new google.maps.Marker({
				position : latlng,
				icon: "img/mylocation.png",
				title : "Bạn ở đây!"
			});
			marker.setMap(map);
			
			
		<%
			String lat = request.getParameter("lat");
			String lng = request.getParameter("lng");
			String num = request.getParameter("num");
			String nganh = request.getParameter("nganh");
			if (lat != null && lng != null && num != null && nganh != null) {
			double lo = Double.parseDouble(lng);
			double la = Double.parseDouble(lat);
			double radius = Double.parseDouble(num);
			
		%>
		var myCity = new google.maps.Circle({
		    center: latlng,
		    radius: <%=radius%>,
		    strokeColor: "#007fff",
		    strokeOpacity: 0.1,
		    strokeWeight: 2,
		    fillColor: "#007fff",
		    fillOpacity: 0.1
		  });
		  myCity.setMap(map);
		<%int i=0;
		for (Information s: SectorDAO.getSectors(nganh.toUpperCase())){
		i++;%>
		/* So sánh khoảng cách từ tọa độ bản thân đến trường so với bán kính */
		<% if(UniversityDAO.distanceBetween2Points(la, lo, s.getLat(), s.getLng()) <= radius){ %>
		
        
		var marker<%=i%> = new google.maps.Marker({
			position : new google.maps.LatLng(<%=s.getLat()%>, <%=s.getLng()%>),
			title : '<%=s.getSname()%>'
		});
		marker<%=i%>.setMap(map);
		google.maps.event.addListener(marker<%=i%>, 'click', function() {
			var infowindow = new google.maps.InfoWindow({
				content : '<div id="info">' +
				'<h5><%=s.getSectorName()%></h5>' +
				'<p><b>Điểm tuyển:</b> <%=s.getSectorPoint()%></p>' +
				'<p><b>Chỉ tiêu tuyển sinh:</b> <%=s.getSectorQuota()%></p>' +
				'<p><b>Trường:</b> <%=s.getSname()%></p>' +
				'</div>'
			});
			
			infowindow.open(map, marker<%=i%>);
		});
		<%}%>
		
		
	<%}%>
		
	<%}%>
		}

		function showError(error) {
			switch (error.code) {
			case error.PERMISSION_DENIED:
				x.innerHTML = "Người sử dụng từ chối cho xác định vị trí."
				break;
			case error.POSITION_UNAVAILABLE:
				x.innerHTML = "Thông tin vị trí không có sẵn."
				break;
			case error.TIMEOUT:
				x.innerHTML = "Yêu cầu vị trí người dùng vượt quá thời gian quy định."
				break;
			case error.UNKNOWN_ERROR:
				x.innerHTML = "Một lỗi xảy ra không rõ nguyên nhân."
				break;
			}
		}
	</script>

</body>
</html>
