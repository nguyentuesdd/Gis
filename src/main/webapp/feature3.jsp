<%@page import="model.University"%>
<%@page import="DAO.UniversityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chức năng 3</title>
<!-- google map api -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7ZVhmqBT0By8htwjdjn22PIBzFJ1YThc&callback=myMap"></script>

<style>
#map {
	height: 500px;
}

#slider {
	width: 60%;
	margin: 15px;
	padding: 0px;
}

#rangevalue {
	width: 20%;
	margin: 10px;
	padding: 0px;
}

#result {
	max-height: 400px;
	margin-bottom: 10px;
	overflow: scroll;
	-webkit-overflow-scrolling: touch;
}

#input {
	width: 61%;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<center>
		<h1>Tìm kiếm các trường đại học theo điểm chuẩn</h1>
		<div class="col-9 row">
			<div class="col-sm-4 container">
				<div class="form-inline">
					<input type="text" class="form-control mr-sm-2"
						placeholder="Nhập điểm chuẩn" id="input">
					<button onclick="handler()" type="submit" id="btn"
						class="btn btn-default my-2 my-sm-0">Tìm kiếm</button>
				</div>
				<h4 class="title">Chọn bán kính muốn xem (km)</h4>
				<div class="row">
					<input class="col-sm-3 custom-range" type="range" max="50" min="0"
						id="slider" value="5" onchange="rangevalue.value=value" /> <input
						class="col-sm-3" id="rangevalue" value="5"
						onchange="slider.value=value" type="number" max="50" min="0" />
				</div>
				<ul id="result" class="hide list-group"></ul>
			</div>
			<div class="col-9" id="map"></div>
		</div>
	</center>
	<script>
		
        $(document).ready(function () {
        	if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(locationHandler);
            } else { 
                alert("Geolocation is not supported by this browser.");
            }
        	
           /*  $.ajax({
            	url: "http://www.geoplugin.net/json.gp",
            	dataType: "json",
            	type: "get",
            	success: function(position){
            		window.position = position;
            		var mapDiv = $("#map")[0];
            		var latlng = new google.maps.LatLng(position.geoplugin_latitude, position.geoplugin_longitude);
            		var options = {
                            center: window.latlng,
                            zoom: 15,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                   var map = new google.maps.Map(mapDiv, options);
            	}
            }); */
            
    		
        });
        
        function locationHandler(position) {
            var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            window.latlng = latlng;
            var mapDiv = $("#map")[0];
    		var options = {
                    center: window.latlng,
                    zoom: 15,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
           var map = new google.maps.Map(mapDiv, options);
           
           new google.maps.Marker({
        		position: latlng,
        		map: map,
        		title: "Vị trí của bạn",
        		icon: "img/mylocation.png"
    		});
        }
        
        function handler() {
            var bm = $("#input").val();
    		var radius = $("#rangevalue").val();
    		if(jQuery.isNumeric(bm)){
            if (bm > 30 || bm < 0) {
                alert("Điểm chuẩn phải nằm giữa 0 và 30");
            } else {
               $.ajax({
            	   url: "<%=request.getContextPath()%>/SearchBenchMark", 
            	   type: "post", 
            	   dataType: "json",
            	   success: responseHandler, 
            	   data: {"bm": bm}
               });
            }
            }else{
          		alert("Chỉ có thể nhập số.")
          	};
        };
        
        function responseHandler(data){
        	if(jQuery.isEmptyObject(data.jsonArray)){
        		alert("Không tìm thấy trường nào.");
        	} else{
        		var mapDiv = $("#map")[0];
                /* var latlng = new google.maps.LatLng(window.position.geoplugin_latitude, window.position.geoplugin_longitude); */
                var options = {
                    center: window.latlng,
                    zoom: 15,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(mapDiv, options);
                new google.maps.Marker({
            		position: window.latlng,
            		map: map,
            		title: "Vị trí của bạn",
            		icon: "img/mylocation.png"
        		});
                var radius = $("#rangevalue").val();
                var bounds = new google.maps.LatLngBounds();
                var hasValidUni = false;
                /* bounds.extend(new google.maps.LatLng(window.position.geoplugin_latitude, window.position.geoplugin_longitude)); */
                bounds.extend(window.latlng);
        		$("#result").removeClass("hide");
        		$("#result").html("");
            	$.each(data.jsonArray, function(index) {
            		/* if(distanceFrom2Points(window.position.geoplugin_latitude,window.position.geoplugin_longitude,data.jsonArray[index].lat,data.jsonArray[index].lng)<=(radius*1000)){ */
            		if(distanceFrom2Points(window.latlng.lat(),window.latlng.lng(),data.jsonArray[index].lat,data.jsonArray[index].lng)<=(radius*1000)){
            		hasValidUni = true;
            		$("#result").append('<li class=\"list-group-item\"><div class=\"panel-group\"><div class=\"panel panel-default\"><div class=\"panel-heading\"><h4 class=\"panel-title\"><a data-toggle=\"collapse\" href=\"#collapse'+index+'\">'+data.jsonArray[index].sname+'</a></h4></div><div id=\"collapse'+index+'\" class=\"panel-collapse collapse\"><div class=\"panel-body\"><p><b>Mã trường:</b> '+data.jsonArray[index].sid+'</p><p><b>Địa chỉ:</b> <a id=\"loc'+index+'\" href="#">'+data.jsonArray[index].saddress+'</a></p><p><b>Điểm sàn:</b> '+data.jsonArray[index].benchmark+'</p><p><b>Chỉ tiêu tuyển sinh:</b> '+data.jsonArray[index].quota+'</p><p><b>Website: <a href=\"http://'+data.jsonArray[index].website+'\">'+data.jsonArray[index].website+'</a></p></div></div></div></div></li>');
            		var maker = new google.maps.Marker({
                		position: new google.maps.LatLng(data.jsonArray[index].lat, data.jsonArray[index].lng),
                		map: map,
                		title: data.jsonArray[index].sname
            		});
            		var infowindow = new google.maps.InfoWindow({
						content: '<div>' +
                		'<h5>'+data.jsonArray[index].sname+'</h5>' +
                		'<p><b>Mã trường:</b> '+data.jsonArray[index].sid+'</p>' +
                		'<p><b>Địa chỉ:</b> '+data.jsonArray[index].saddress+'</p>' +
                		'<p><b>Điểm sàn:</b> '+data.jsonArray[index].benchmark+'</p>' +
                		'<p><b>Chỉ tiêu tuyển sinh:</b> '+data.jsonArray[index].quota+'</p>' +
                		'<p><b>Website: <a href="http://'+data.jsonArray[index].website+'\">'+data.jsonArray[index].website+'</a></p>' +
                		'</div>'
           			});
            		maker.addListener('click', function () {
                        infowindow.open(map, maker);
                    });
            		var loc = document.getElementById('loc'+index);
            		loc.onclick = function(){
            			infowindow.open(map, maker);
            		};
            		bounds.extend(new google.maps.LatLng(data.jsonArray[index].lat, data.jsonArray[index].lng));
            		}
            		
            	});
            	map.fitBounds(bounds);
            	var circle = new google.maps.Circle({
                    center: latlng,
                    radius: radius*1000,
                    strokeColor: "#007fff",
                    strokeOpacity: 0.1,
                    strokeWeight: 1,
                    fillColor: "#007fff",
                    fillOpacity: 0.1,
                    map: map
                  });
            	if(!hasValidUni){
            		alert("Không tìm thấy trường nào.");
            	}
        	};
        };
       
        function distanceFrom2Points(lat1,lng1,lat2,lng2){
        	var R = 6371e3;
        	var dLat = (lat2 - lat1) * (Math.PI / 180);
        	var dLng = (lng2 - lng1) * (Math.PI / 180);
        	var lat1ToRad = lat1 * (Math.PI / 180);
        	var lat2ToRad = lat2 * (Math.PI / 180);
        	var a = Math.sin(dLat / 2) * Math.sin(dLat /2 ) + Math.cos(lat1ToRad) * Math.cos(lat2ToRad) * Math.sin(dLng / 2) * Math.sin(dLng / 2);
        	var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        	var d = R * c;
        	return d;
        }
</script>
</body>
</html>