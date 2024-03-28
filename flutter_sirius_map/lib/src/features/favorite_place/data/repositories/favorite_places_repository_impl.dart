import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/data/repositories/favorite_places_repository.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/domain/models/favorite_place.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _favPlacesKey = "fav_places";

class FavoritePlacesRepositoryImpl implements FavoritePlacesRepository {
  final SharedPreferences _localStorage;

  FavoritePlacesRepositoryImpl(this._localStorage);

  @override
  Future<void> addPlace(FavoritePlaceInstance place) async {
    Set<FavoritePlaceInstance> favPlaces = getAllPlaces().toSet();

    favPlaces.add(place);

    _localStorage.setString(_favPlacesKey, jsonEncode(favPlaces.toList()));
  }

  @override
  List<FavoritePlaceInstance> getAllPlaces() {
    final favPlacesString = _localStorage.getString(_favPlacesKey);
    if (kDebugMode) {
      print(favPlacesString);
    }
    List<FavoritePlaceInstance> result = [];
    if (favPlacesString == null) {
      return [];
    }

    for (var elem in jsonDecode(favPlacesString)) {
      result.add(FavoritePlaceInstance.fromJson(elem));
    }

    return result;
  }

  @override
  Future<void> deletePlace(int id) async {
    List<FavoritePlaceInstance> favPlaces = getAllPlaces().toList();
    int temp = -1;

    for (int i = 0; i < favPlaces.length; i++) {
      if (favPlaces[i].placeId == id) {
        temp = i;
        break;
      }
    }

    if (temp != -1) {
      favPlaces.removeAt(temp);
    }

    _localStorage.setString(_favPlacesKey, jsonEncode(favPlaces));
  }
}
