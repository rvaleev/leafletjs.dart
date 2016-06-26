@JS()
library leafletjs.path.options;

import "package:js/js.dart";

@JS()
@anonymous
class PathOptions {

  external factory PathOptions({
  bool stroke,
  String color,
  num weight,
  num opacity,
  bool fill,
  String fillColor,
  num fillOpacity,
  String fillRule,
  String dashArray,
  String lineCap,
  String lineJoin,
  bool clickable,
  String pointerEvents,
  String className
  });
}