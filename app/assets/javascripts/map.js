var objectLanLng = {lat: 50.499800, lng: 30.516220};
var centerLanLng = {lat: 50.499800, lng: 30.511220};
var mapOptions = {
  center: centerLanLng,
  zoom: 16,
  mapTypeControl: false,
  navigationControl: true,
  scrollwheel: false
}

function initMap(){
  map = new google.maps.Map(document.getElementById('map'), mapOptions);

  var marker = new google.maps.Marker({
    position: objectLanLng,
    animation: google.maps.Animation.DROP,
    title: "SPA-Studio"
  });

  marker.setMap(map);
}
