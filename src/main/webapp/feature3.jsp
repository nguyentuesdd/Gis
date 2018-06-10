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
	<script type="text/javascript" src="js/feature2.js"></script>
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
					<input class="col-sm-3 custom-range" type="range" max="20"
						id="slider" value="5" onchange="rangevalue.value=value" /> <input
						class="col-sm-3" id="rangevalue" value="5"
						onchange="slider.value=value" type="number" max="20" min="0" />
				</div>
				<ul id="result" class="hide list-group"></ul>
			</div>
			<div class="col-9" id="map"></div>
		</div>
	</center>
<script>
        $(document).ready(function () {
            var mapDiv = $("#map")[0];
            var latlng = new google.maps.LatLng(10.771971, 106.697845);
            var options = {
                center: latlng,
                zoom: 11,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(mapDiv, options);
        });
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
            	   data: {"bm": bm, "radius":radius}
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
                var latlng = new google.maps.LatLng(10.771971, 106.697845);
                var options = {
                    center: latlng,
                    zoom: 11,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(mapDiv, options);
        		$("#result").removeClass("hide");
        		$("#result").html("");
            	$.each(data.jsonArray, function(index) {
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
            	});
        	};
        };
       
</script>

</body>
</html>