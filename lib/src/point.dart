@JS()
library leafletjs.point;

import "package:js/js.dart";

@JS("L.point")
class Point {
  /**
   * Creates a Point object with the given x and y coordinates. If optional round is set to true, rounds the x and y values.
   */
  external factory Point(num x, num y, [bool round]);
}