@JS()
library leafletjs.feature.group;

import "package:js/js.dart";
import 'ilayer.dart';
import 'lat.lng.bounds.dart';
import 'path.options.dart';

@JS("L.featureGroup")
class FeatureGroup {

  ///
  /// Create a layer group, optionally given an initial set of layers.
  ///
  external factory FeatureGroup([List<ILayer> layers]);

  ///
  ///Returns the LatLngBounds of the Feature Group (created from bounds and coordinates of its children).
  ///
  external LatLngBounds getBounds();

  ///
  ///Sets the given path options to each layer of the group that has a setStyle method
  ///
  external FeatureGroup setStyle(PathOptions style);

  ///
  ///Brings the layer group to the top of all other layers.
  ///
  external FeatureGroup bringToFront();

  ///
  ///Brings the layer group to the bottom of all other layers.
  ///
  external FeatureGroup bringToBack();
}