@JS()
library leafletjs.map;

import "package:js/js.dart";
import 'ilayer.dart';
import 'lat.lng.bounds.dart';
import 'lat.lng.dart';
import 'point.dart';

@JS("L.Map")
class Map {
  external Map(String id, [MapOptions options]);

  ///
  ///Removes the given layer from the map.
  ///
  external Map removeLayer(ILayer layer);

  ///
  ///Sets a map view that contains the given geographical bounds with the maximum zoom level possible.
  ///
  external Map fitBounds(LatLngBounds bounds, [FitBoundsOptions options]);

  ///
  ///Pans the map to the closest view that would lie inside the given bounds (if it's not already), controlling the animation using the options specific, if any.
  ///
  external Map panInsideBounds(LatLngBounds bounds, [PanOptions options]);
}

@JS()
@anonymous
class MapOptions {
  external LatLng get center;
  external num get zoom;
  external List<ILayer> get layers;
  external num get minZoom;
  external num get maxZoom;
  external LatLngBounds get maxBounds;

  external factory MapOptions({LatLng center,
  num zoom, List<ILayer> layers,
  num minZoom, num maxZoom, LatLngBounds maxBounds});
}

class ZoomOptions {
  external factory ZoomOptions({
  bool animate
  });
}

@JS()
@anonymous
class ZoomPanOptions {

  external factory ZoomPanOptions({
  bool reset,
  PanOptions pan,
  ZoomOptions zoom,
  bool animate
  });
}


@JS()
@anonymous
class FitBoundsOptions extends ZoomPanOptions {
  external factory FitBoundsOptions({
  bool reset,
  PanOptions pan,
  ZoomOptions zoom,
  bool animate,
  Point paddingTopLeft,
  Point paddingBottomRight,
  Point padding,
  num maxZoom});
}

class PanOptions {

  external factory PanOptions({
  bool animate,
  num duration,
  num easeLinearity,
  bool noMoveStart
  });
}