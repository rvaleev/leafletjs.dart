# leafletjs.dart
Leaflet integration to Dart

Note: draft version, not all functionality is supported.

Usage:

Manually import:

```html
  <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css"/>
  <script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
```

API wrappers follows reference: http://leafletjs.com/reference.html

Example:

```dart
  _initMap() {
    _map = new Leaflet.Map("map", new Leaflet.MapOptions(
        center: new Leaflet.LatLng(60.222296, 24.929713),
        zoom: 11));
    new Leaflet.TileLayer(
        'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
        new Leaflet.TileLayerOptions(
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
            maxZoom: 18,
            id: 'your.project.id',
            accessToken: 'your.access.token'
        )).addTo(_map);
  }
```

Also it includes extra util that supports conversion from [Encoded Polyline Algorithm Format](https://developers.google.com/maps/documentation/utilities/polylinealgorithm) to List<LatLng> and back

```dart
 List<LatLng> decoded = PolylineUtil.decode('_p~iF~ps|U_ulLnnqC_mqNvxq`@');

 // returns a string-encoded polyline
 String encoded = PolylineUtil.encode([new LatLng(38.5, -120.2), new LatLng(40.7, -120.95), new LatLng(43.252, -126.453)]);
```
