import 'package:freezed_annotation/freezed_annotation.dart';


part 'api_point_searched.freezed.dart';

part 'api_point_searched.g.dart';

@freezed
abstract class ApiPointSearched with _$ApiPointSearched {
   const factory ApiPointSearched({
    required String name,
    required int id,
    }) = _ApiPointSearched;
  
    factory ApiPointSearched.fromJson(Map<String, dynamic> json) => _$ApiPointSearchedFromJson(json);
}