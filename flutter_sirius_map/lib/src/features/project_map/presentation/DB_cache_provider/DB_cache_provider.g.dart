// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DB_cache_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dBCacheNotifierHash() => r'ca688146499d30f0e54e9736910a1d7e0e90c2be';

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

abstract class _$DBCacheNotifier
    extends BuildlessAutoDisposeAsyncNotifier<DbCacheStore> {
  late final MapCache mapCache;

  FutureOr<DbCacheStore> build(
    MapCache mapCache,
  );
}

/// See also [DBCacheNotifier].
@ProviderFor(DBCacheNotifier)
const dBCacheNotifierProvider = DBCacheNotifierFamily();

/// See also [DBCacheNotifier].
class DBCacheNotifierFamily extends Family<AsyncValue<DbCacheStore>> {
  /// See also [DBCacheNotifier].
  const DBCacheNotifierFamily();

  /// See also [DBCacheNotifier].
  DBCacheNotifierProvider call(
    MapCache mapCache,
  ) {
    return DBCacheNotifierProvider(
      mapCache,
    );
  }

  @override
  DBCacheNotifierProvider getProviderOverride(
    covariant DBCacheNotifierProvider provider,
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
  String? get name => r'dBCacheNotifierProvider';
}

/// See also [DBCacheNotifier].
class DBCacheNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DBCacheNotifier, DbCacheStore> {
  /// See also [DBCacheNotifier].
  DBCacheNotifierProvider(
    MapCache mapCache,
  ) : this._internal(
          () => DBCacheNotifier()..mapCache = mapCache,
          from: dBCacheNotifierProvider,
          name: r'dBCacheNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dBCacheNotifierHash,
          dependencies: DBCacheNotifierFamily._dependencies,
          allTransitiveDependencies:
              DBCacheNotifierFamily._allTransitiveDependencies,
          mapCache: mapCache,
        );

  DBCacheNotifierProvider._internal(
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
  FutureOr<DbCacheStore> runNotifierBuild(
    covariant DBCacheNotifier notifier,
  ) {
    return notifier.build(
      mapCache,
    );
  }

  @override
  Override overrideWith(DBCacheNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DBCacheNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DBCacheNotifier, DbCacheStore>
      createElement() {
    return _DBCacheNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DBCacheNotifierProvider && other.mapCache == mapCache;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mapCache.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DBCacheNotifierRef on AutoDisposeAsyncNotifierProviderRef<DbCacheStore> {
  /// The parameter `mapCache` of this provider.
  MapCache get mapCache;
}

class _DBCacheNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DBCacheNotifier,
        DbCacheStore> with DBCacheNotifierRef {
  _DBCacheNotifierProviderElement(super.provider);

  @override
  MapCache get mapCache => (origin as DBCacheNotifierProvider).mapCache;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
