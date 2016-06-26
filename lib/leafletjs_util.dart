library leafletjs.util;

import 'dart:math';
import 'src/lat.lng.dart';

abstract class PolylineUtil {

  ///
  /// Encodes points to a string with given options
  ///
  static String encode(List<LatLng> points, [CodeOptions options]) {
    if (points.isEmpty) {
      return '';
    }
    if (options == null) {
      options  = new CodeOptions();
    }

    var output = _encode(points[0].lat, 0.0, options.factor) + _encode(points[0].lng, 0.0, options.factor);
    for (int i = 1; i < points.length; i++) {
      LatLng a = points[i];
      LatLng b = points[i - 1];
      output += _encode(a.lat, b.lat, options.factor);
      output += _encode(a.lng, b.lng, options.factor);
    }
    return output;
  }

  static _encode(double currentPrecise, double previousPrecise, num factor) {
    int current = (currentPrecise * factor).round();
    int previous = (previousPrecise * factor).round();
    var coordinate = current - previous;
    coordinate <<= 1;
    if (current - previous < 0) {
      coordinate = ~coordinate;
    }
    var output = '';
    while (coordinate >= 0x20) {
      output += new String.fromCharCode((0x20 | (coordinate & 0x1f)) + 63);
      coordinate >>= 5;
    }
    output += new String.fromCharCode(coordinate + 63);
    return output;
  }

  ///
  /// Decodes to a [List<LatLng>] coordinates array.
  /// This is adapted from the implementation in Project-OSRM.
  ///
  static List<LatLng> decode(String str, [CodeOptions options]) {
    if (options == null) {
       options  = new CodeOptions();
    }
    List<LatLng> coordinates = [];
    double lat = 0.0, lng = 0.0;
    double latitude_change, longitude_change;
    int index = 0,
        shift = 0,
        result = 0,
        byte = null;


    // Coordinates have variable length when encoded, so just keep
    // track of whether we've hit the end of the string. In each
    // loop iteration, a single coordinate is decoded.
    while (index < str.length) {

      // Reset shift, result, and byte
      byte = null;
      shift = 0;
      result = 0;

      do {
        byte = str.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      latitude_change = ((result & 1).isOdd ? ~(result >> 1) : (result >> 1)).truncateToDouble();

      shift = result = 0;

      do {
        byte = str.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      longitude_change = ((result & 1).isOdd ? ~(result >> 1) : (result >> 1)).truncateToDouble();

      lat += latitude_change;
      lng += longitude_change;

      coordinates.add(new LatLng(lat / options.factor, lng / options.factor));
    }

    return coordinates;
  }
}

class CodeOptions {

    num precision;
    num factor;

    CodeOptions([this.precision = 5, this.factor]) {
      if (this.factor == null) {
        this.factor = pow(10, precision);
      }
    }

}