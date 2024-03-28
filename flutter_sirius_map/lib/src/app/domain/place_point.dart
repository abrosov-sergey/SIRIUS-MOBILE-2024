import 'package:latlong2/latlong.dart';

class PlacePoint {
  final LatLng pos;
  final String? _name;
  final int id;
  const PlacePoint({
    name,
    required this.id,
    required this.pos,
  }) : _name = name;

  String get name => _name ?? 'ID: $id';
}
