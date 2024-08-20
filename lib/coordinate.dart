import 'package:google_maps_flutter/google_maps_flutter.dart' as mp;

///A class that describe a Coordinate on Earth
class Coordinates {
  late double latitude;
  late double longitude;
  ///Main Constructor for this class
  Coordinates({
    required this.latitude,
    required this.longitude,
  });
 /* Coordinates.fromLatLng(LatLng point) {
    latitude = point.latitude;
    longitude = point.longitude;
  }

  LatLng toLatLng(Coordinates point)
  {
    return LatLng(point.latitude, point.longitude);
  }*/

  ///Copy Constructor from LatLng Object
  Coordinates.fromLatLngMap(mp.LatLng point) {
    latitude = point.latitude;
    longitude = point.longitude;

    longitude += 360.0;
    longitude %= 360.0;
  }

  ///Function to convert Coordinate to LatLng
  mp.LatLng toLatLngMap(Coordinates point)
  {
    return mp.LatLng(point.latitude, point.longitude);
  }

  ///Override toString for better debugging output
  @override
  String toString() {
    return 'Coordinates(latitude: $latitude, longitude: $longitude)';
  }

  /// Optionally, you can still override == and hashCode for value comparison
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Coordinates otherCoordinates = other as Coordinates;
    return latitude == otherCoordinates.latitude && longitude == otherCoordinates.longitude;
  }

  ///HashCode for Coordinate Function
  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
