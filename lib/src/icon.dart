@JS()
library leafletjs.icon;

import "package:js/js.dart";
import 'point.dart';

@JS("L.icon")
class Icon {
  external Icon([IconOptions options]);
}

@JS()
@anonymous
class IconOptions {
  ///
  ///Creates an icon instance with the given options.
  ///
  external factory IconOptions({
  String iconUrl,
  String iconRetinaUrl,
  Point iconSize,
  Point iconAnchor,
  String shadowUrl,
  String shadowRetinaUrl,
  Point shadowSize,
  Point shadowAnchor,
  Point popupAnchor,
  String className
  });
}