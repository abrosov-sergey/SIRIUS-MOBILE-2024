import 'package:freezed_annotation/freezed_annotation.dart';


part 'point_searched.freezed.dart';

part 'point_searched.g.dart';

@freezed
abstract class PointSearched with _$PointSearched {
   const factory PointSearched({
    required String name,
    required int id}) = _PointSearched;

   factory PointSearched.fromJson(Map<String, dynamic> json) => _$PointSearchedFromJson(json);
}