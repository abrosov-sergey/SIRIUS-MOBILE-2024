// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapNotifierHash() => r'8d0e18d506566f5d1e3336efebff961368fd4732';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MapNotifier
    extends BuildlessAutoDisposeAsyncNotifier<MapState> {
  late final MapCache mapCache;

  FutureOr<MapState> build(
    MapCache mapCache,
  );
}

/// See also [MapNotifier].
@ProviderFor(MapNotifier)
const mapNotifierProvider = MapNotifierFamily();

/// See also [MapNotifier].
class MapNotifierFamily extends Family<AsyncValue<MapState>> {
  /// See also [MapNotifier].
  const MapNotifierFamily();

  /// See also [MapNotifier].
  MapNotifierProvider call(
    MapCache mapCache,
  ) {
    return MapNotifierProvider(
      mapCache,
    );
  }

  @override
  MapNotifierProvider getProviderOverride(
    covariant MapNotifierProvider provider,
  ) {
    return call(
      provider.mapCache,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mapNotifierProvider';
}

/// See also [MapNotifier].
class MapNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MapNotifier, MapState> {
  /// See also [MapNotifier].
  MapNotifierProvider(
    MapCache mapCache,
  ) : this._internal(
          () => MapNotifier()..mapCache = mapCache,
          from: mapNotifierProvider,
          name: r'mapNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapNotifierHash,
          dependencies: MapNotifierFamily._dependencies,
          allTransitiveDependencies:
              MapNotifierFamily._allTransitiveDependencies,
          mapCache: mapCache,
        );

  MapNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mapCache,
  }) : super.internal();

  final MapCache mapCache;

  @override
  FutureOr<MapState> runNotifierBuild(
    covariant MapNotifier notifier,
  ) {
    return notifier.build(
      mapCache,
    );
  }

  @override
  Override overrideWith(MapNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MapNotifierProvider._internal(
        () => create()..mapCache = mapCache,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mapCache: mapCache,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MapNotifier, MapState>
      createElement() {
    return _MapNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapNotifierProvider && other.mapCache == mapCache;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mapCache.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapNotifierRef on AutoDisposeAsyncNotifierProviderRef<MapState> {
  /// The parameter `mapCache` of this provider.
  MapCache get mapCache;
}

class _MapNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MapNotifier, MapState>
    with MapNotifierRef {
  _MapNotifierProviderElement(super.provider);

  @override
  MapCache get mapCache => (origin as MapNotifierProvider).mapCache;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
