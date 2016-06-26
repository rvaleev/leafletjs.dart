@JS()
library leafletjs.ilayer;

import "package:js/js.dart";

@JS()
class ILayer {
  external void onAdd(Map map);
  external void onRemove(Map map);
}