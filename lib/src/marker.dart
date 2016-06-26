@JS()
library leafletjs.marker;

import "package:js/js.dart";
import 'ilayer.dart';
import 'lat.lng.dart';
import 'icon.dart';
import 'map.dart' as L;

@JS("L.marker")
class Marker extends ILayer {
  /**
   * Instantiates a Marker object given a geographical point and optionally an options object.
   */
  external Marker(LatLng latlng, [MarkerOptions options]);

  /**
   * Adds the marker to the map.
   */
  external Marker addTo(L.Map map);

  /**
   * Returns the current geographical position of the marker.
   */
  external LatLng getLatLng();

  /**
   * Changes the marker position to the given point.
   */
  external Marker setLatLng(LatLng latlng);

  /**
   * Changes the marker icon.
   */
  external Marker setIcon(Icon icon);

  /**
   * 	Changes the zIndex offset of the marker.
   */
  external Marker setZIndexOffset(num offset);

  /**
   * Changes the opacity of the marker.
   */
  external Marker setOpacity(num opacity);

  /**
   * Updates the marker position, useful if coordinates of its latLng object were changed directly.
   */
  external Marker update();
}

@JS()
@anonymous
class MarkerOptions {
  external factory MarkerOptions({
  Icon icon,
  bool clickable,
  bool draggable,
  bool keyboard,
  String title,
  String alt,
  num zIndexOffset,
  num opacity,
  bool riseOnHover,
  num riseOffset
  });
}