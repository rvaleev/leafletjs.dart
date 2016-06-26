@JS()
library leafletjs.map;

import "package:js/js.dart";
import 'ilayer.dart';
import 'map.dart' as L;

@JS("L.layerGroup")
class LayerGroup extends ILayer {
  ///
  ///Create a layer group, optionally given an initial set of layers.
  ///
  external factory LayerGroup([List<ILayer> layers]);

  ///
  ///Adds the group of layers to the map.
  ///
  external LayerGroup addTo(L.Map map);

  ///
  ///Adds a given layer to the group.
  ///
  external LayerGroup addLayer(ILayer layer);

  ///
  ///Removes a given layer from the group.
  ///
  external LayerGroup removeLayer(layerOrId);

  ///
  ///Returns true if the given layer is currently added to the group.
  ///
  external bool hasLayer(ILayer layer);

  ///
  ///Returns the layer with the given id.
  ///
  external ILayer getLayer(String id);

  ///
  ///Returns an array of all the layers added to the group.
  ///
  external List<ILayer> getLayers();

  ///
  ///Removes all the layers from the group.
  ///
  external LayerGroup clearLayers();

  ///
  ///Iterates over the layers of the group, optionally specifying context of the iterator function.
  ///    group.eachLayer(function (layer) {
  ///       layer.bindPopup('Hello');
  ///    });
  ///
  external LayerGroup eachLayer(Function fn, [Object context]);

  ///
  ///Returns a GeoJSON representation of the layer group (GeoJSON FeatureCollection).
  ///
  external Object toGeoJSON();
}