@JS()
library leafletjs;

import "package:js/js.dart";


@JS("L.Map")
class LeafletMap {
  external LeafletMap(String id, [MapOptions options]);
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

@JS("L.latLngBounds")
class LatLngBounds {
  external LatLngBounds(LatLng southWest, LatLng northEast);
}

@JS("L.latLng")
class LatLng {
  external LatLng(double latitude, double longitude);
  external double get lat;
  external double get lng;
}

@JS()
class ILayer {
  external void onAdd(LeafletMap map);
  external void onRemove(LeafletMap map);
}

@JS("L.tileLayer")
class TileLayer extends ILayer {
  external TileLayer(String urlTemplate, [TileLayerOptions options]);

  /**
   * Adds the popup to the map.
   */
  external TileLayer addTo(LeafletMap map);

  /**
   * Adds the popup to the map and closes the previous one. The same as map.openPopup(popup).
   */
  external TileLayer openOn(LeafletMap map);

  /**
   * Sets the geographical point where the popup will open.
   */
  external TileLayer setLatLng(LatLng latLng);

  /**
   * Returns the geographical point of popup.
   */
  external LatLng getLatLng();

  /**
   * Sets the HTML content of the popup.
   */
  external TileLayer setContent(String htmlContent);

  /**
   * Returns the content of the popup.
   */
  external String getContent();

  /**
   * Updates the popup content, layout and position. Useful for updating the popup after something inside changed, e.g. image loaded.
   */
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

@JS("L.marker")
class Marker extends ILayer {
  external Marker(LatLng latlng, [MarkerOptions options]);
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

@JS("L.icon")
class Icon {
  external Icon([IconOptions options]);
}

@JS()
@anonymous
class IconOptions {
  /**
   * Creates an icon instance with the given options.
   */
  external factory IconOptions(
     String iconUrl,
    {
      String iconRetinaUrl,
      LeafletPoint iconSize,
      LeafletPoint iconAnchor,
      String shadowUrl,
      String shadowRetinaUrl,
      LeafletPoint shadowSize,
      LeafletPoint shadowAnchor,
      LeafletPoint popupAnchor,
      String className
    });
}

@JS("L.point")
class LeafletPoint {
  /**
   * Creates a Point object with the given x and y coordinates. If optional round is set to true, rounds the x and y values.
   */
  external factory LeafletPoint(num x, num y, [bool round]);
}