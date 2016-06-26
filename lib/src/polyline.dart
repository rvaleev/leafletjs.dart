@JS()
library leafletjs.polyline;

import "package:js/js.dart";
import 'lat.lng.dart';
import 'path.dart';
import 'path.options.dart';

@JS("L.polyline")
class Polyline extends Path {

  external factory Polyline(List<LatLng> latlngs, [PolylineOptions options]);

}

@JS()
@anonymous
class PolylineOptions extends PathOptions {

  external factory PolylineOptions({
  num smoothFactor,
  bool noClip,
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