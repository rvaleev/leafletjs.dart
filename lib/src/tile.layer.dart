@JS()
library leafletjs.tile.layer;

import "package:js/js.dart";
import 'ilayer.dart';
import 'lat.lng.dart';
import 'lat.lng.bounds.dart';
import 'map.dart' as L;

@JS("L.tileLayer")
class TileLayer extends ILayer {
  external TileLayer(String urlTemplate, [TileLayerOptions options]);

  ///
  ///Adds the popup to the map.
  ///
  external TileLayer addTo(L.Map map);

  ///
  ///Adds the popup to the map and closes the previous one. The same as map.openPopup(popup).
  ///
  external TileLayer openOn(L.Map map);

  ///
  ///Sets the geographical point where the popup will open.
  ///
  external TileLayer setLatLng(LatLng latLng);

  ///
  ///Returns the geographical point of popup.
  ///
  external LatLng getLatLng();

  ///
  ///Sets the HTML content of the popup.
  ///
  external TileLayer setContent(String htmlContent);

  ///
  ///Returns the content of the popup.
  ///
  external String getContent();

  ///
  ///Updates the popup content, layout and position. Useful for updating the popup after something inside changed, e.g. image loaded.
  ///
  external TileLayer update();
}


@JS()
@anonymous
class TileLayerOptions {

  external factory TileLayerOptions({
  String id,
  String accessToken,
  num minZoom,
  num maxZoom,
  num maxNativeZoom,
  num tileSize,
  List<String> subdomains,
  String errorTileUrl,
  String attribution,
  bool tms,
  bool continuousWorld,
  bool noWrap,
  num zoomOffset,
  bool zoomReverse,
  num opacity,
  num zIndex,
  bool unloadInvisibleTiles,
  bool updateWhenIdle,
  bool detectRetina,
  bool reuseTiles,
  LatLngBounds bounds
  });
}