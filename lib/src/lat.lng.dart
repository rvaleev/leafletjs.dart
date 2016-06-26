@JS()
library leafletjs.lat.lng;

import "package:js/js.dart";

@JS("L.latLng")
class LatLng {
  external LatLng(double latitude, double longitude);

  ///
  ///Latitude in degrees.
  ///
  external double get lat;

  ///
  ///Longitude in degrees.
  ///
  external double get lng;
  external set lat(double lat);
  external set lng(double lng);

  ///
  ///Returns the distance (in meters) to the given LatLng calculated using the Haversine formula. See description on wikipedia.
  ///
  external num distanceTo(LatLng otherLatlng);

  ///
  ///Returns true if the given LatLng point is at the same position (within a small margin of error).
  ///
  external bool equals(LatLng otherLatlng);

  ///
  ///Returns a string representation of the point (for debugging purposes).
  ///
  external String toString();

  ///
  ///Returns a new LatLng object with the longitude wrapped around left and right boundaries (-180 to 180 by default).
  ///
  external LatLng wrap(num left, num right);
}