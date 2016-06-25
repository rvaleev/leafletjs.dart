@JS()
library leafletjs;

import "package:js/js.dart";


@JS("L.Map")
class Map {
  external Map(String id, [MapOptions options]);

  /**
   * Removes the given layer from the map.
   */
  external Map removeLayer(ILayer layer);

  /**
   * Sets a map view that contains the given geographical bounds with the maximum zoom level possible.
   */
  external Map fitBounds(LatLngBounds bounds, [FitBoundsOptions options]);

  /**
   * Pans the map to the closest view that would lie inside the given bounds (if it's not already), controlling the animation using the options specific, if any.
   */
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

class PanOptions {

  external factory PanOptions({
    bool animate,
    num duration,
    num easeLinearity,
    bool noMoveStart
  });
}


class ZoomOptions {
  external factory ZoomOptions({
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

@JS("L.latLng")
class LatLng {
  external LatLng(double latitude, double longitude);

  /**
   * Latitude in degrees.
   */
  external double get lat;

  /**
   * Longitude in degrees.
   */
  external double get lng;
  external set lat(double lat);
  external set lng(double lng);

  /**
   * Returns the distance (in meters) to the given LatLng calculated using the Haversine formula. See description on wikipedia.
   */
  external num distanceTo(LatLng otherLatlng);

  /**
   * Returns true if the given LatLng point is at the same position (within a small margin of error).
   */
  external bool equals(LatLng otherLatlng);

  /**
   * Returns a string representation of the point (for debugging purposes).
   */
  external String toString();

  /**
   * Returns a new LatLng object with the longitude wrapped around left and right boundaries (-180 to 180 by default).
   */
  external LatLng wrap(num left, num right);
}

@JS()
class ILayer {
  external void onAdd(Map map);
  external void onRemove(Map map);
}

@JS("L.tileLayer")
class TileLayer extends ILayer {
  external TileLayer(String urlTemplate, [TileLayerOptions options]);

  /**
   * Adds the popup to the map.
   */
  external TileLayer addTo(Map map);

  /**
   * Adds the popup to the map and closes the previous one. The same as map.openPopup(popup).
   */
  external TileLayer openOn(Map map);

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
  /**
   * Instantiates a Marker object given a geographical point and optionally an options object.
   */
  external Marker(LatLng latlng, [MarkerOptions options]);

  /**
   * Adds the marker to the map.
   */
  external Marker addTo(Map map);

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

@JS("L.point")
class Point {
  /**
   * Creates a Point object with the given x and y coordinates. If optional round is set to true, rounds the x and y values.
   */
  external factory Point(num x, num y, [bool round]);
}

@JS("L.featureGroup")
class FeatureGroup {

  /**
   * Create a layer group, optionally given an initial set of layers.
   */
  external factory FeatureGroup([List<ILayer> layers]);

  /**
   * Returns the LatLngBounds of the Feature Group (created from bounds and coordinates of its children).
   */
  external LatLngBounds getBounds();

  /**
   * Sets the given path options to each layer of the group that has a setStyle method
   */
  external FeatureGroup setStyle(PathOptions style);

  /**
   * Brings the layer group to the top of all other layers.
   */
  external FeatureGroup bringToFront();

  /**
   * Brings the layer group to the bottom of all other layers.
   */
  external FeatureGroup bringToBack();
}

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

@JS()
@anonymous
class Path  extends ILayer {

  /**
   * Adds the layer to the map.
   */
  external Path addTo(Map map);

}

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

@JS("L.layerGroup")
class LayerGroup extends ILayer {
  /**
   * Create a layer group, optionally given an initial set of layers.
   */
  external factory LayerGroup([List<ILayer> layers]);

  /**
   * Adds the group of layers to the map.
   */
  external LayerGroup addTo(Map map);

  /**
   * Adds a given layer to the group.
   */
  external LayerGroup addLayer(ILayer layer);

  /**
   * Removes a given layer from the group.
   */
  external LayerGroup removeLayer(layerOrId);

  /**
   * Returns true if the given layer is currently added to the group.
   */
  external bool hasLayer(ILayer layer);

  /**
   * Returns the layer with the given id.
   */
  external ILayer getLayer(String id);

  /**
   * Returns an array of all the layers added to the group.
   */
  external List<ILayer> getLayers();

  /**
   * Removes all the layers from the group.
   */
  external LayerGroup clearLayers();

  /**
   * Iterates over the layers of the group, optionally specifying context of the iterator function.
      group.eachLayer(function (layer) {
      layer.bindPopup('Hello');
      });
   */
  external LayerGroup eachLayer(Function fn, [Object context]);

  /**
   * Returns a GeoJSON representation of the layer group (GeoJSON FeatureCollection).
   */
  external Object toGeoJSON();
}