window.onload = function() {
	var mapDiv = document.getElementById('map');
	var latlng = new google.maps.LatLng(10.771971, 106.697845);
	var options = {
		center : latlng,
		zoom : 8,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(mapDiv, options);
}