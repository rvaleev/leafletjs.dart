@JS()
library leafletjs.lat.lng.bounds;

import "package:js/js.dart";
import 'lat.lng.dart';

@JS("L.latLngBounds")
class LatLngBounds {
  /**
   * if [first] is LatLng creates a latLngBounds object by defining south-west and north-east corners of the rectangle.
   * if [first] is List<LatLng> creates a LatLngBounds object defined by the geographical points it contains. Very useful for zooming the map to fit a particular set of locations with fitBounds.
   */
  external factory LatLngBounds(dynamic first, [LatLng northEast]);

  /**
   * Extends the bounds to contain the given point or bounds.
   */
  external LatLngBounds extend(LatLng latlng);

  /**
   * Extends the bounds to contain the given point or bounds.
   */
  @JS("extend")
  external LatLngBounds extendBounds(LatLngBounds latlng);

  /**
   * Returns the south-west point of the bounds.
   */
  external LatLng getSouthWest();

  /**
   * Returns the north-east point of the bounds.
   */
  external LatLng getNorthEast();

  /**
   * Returns the north-west point of the bounds.
   */
  external LatLng getNorthWest();

  /**
   * Returns the south-east point of the bounds.
   */
  external LatLng getSouthEast();

  /**
   * Returns the west longitude of the bounds.
   */
  external num getWest();

  /**
   * Returns the south latitude of the bounds.
   */
  external num getSouth();

  /**
   * Returns the east latitude of the bounds.
   */
  external num getEast();

  /**
   * Returns the north latitude of the bounds.
   */
  external num getNorth();

  /**
   * Returns the center point of the bounds.
   */
  external LatLng getCenter();

  /**
   * Returns true if the rectangle contains the given point.
   */
  external bool contains(LatLng latlng);

  /**
   * Returns true if the rectangle contains the given one.
   */
  @JS("contains")
  external bool containsBounds(LatLngBounds otherBounds);

  /**
   * Returns true if the rectangle intersects the given bounds.
   */
  external bool intersects(LatLngBounds otherBounds);

  /**
   * Returns true if the rectangle is equivalent (within a small margin of error) to the given bounds.
   */
  external bool equals(LatLngBounds otherBounds);

  /**
   * Returns a string with bounding box coordinates in a 'southwest_lng,southwest_lat,northeast_lng,northeast_lat' format. Useful for sending requests to web services that return geo data.
   */
  external String toBBoxString();

  /**
   * Returns bigger bounds created by extending the current bounds by a given percentage in each direction.
   */
  external LatLngBounds pad(num bufferRatio);

  /**
   * Returns true if the bounds are properly initialized.
   */
  external bool isValid();
}