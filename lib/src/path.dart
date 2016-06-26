@JS()
library leafletjs.path;

import "package:js/js.dart";
import 'ilayer.dart';
import 'map.dart' as L;

@JS()
@anonymous
class Path  extends ILayer {

  /**
   * Adds the layer to the map.
   */
  external Path addTo(L.Map map);

}