import 'package:latlong2/latlong.dart';

class PlacePoint {
  final LatLng pos;
  final String? name;
  final int id;
  const PlacePoint({
    required this.id,
    required this.pos,
    this.name
  });
}
