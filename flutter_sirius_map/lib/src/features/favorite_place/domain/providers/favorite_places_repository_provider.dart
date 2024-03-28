import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/locator.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/data/repositories/favorite_places_repository.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/data/repositories/favorite_places_repository_impl.dart';

final favoritePlacesRepositoryProvider = Provider<FavoritePlacesRepository>(
  (ref) => FavoritePlacesRepositoryImpl(MyLocator.sharedPreferences),
);
