// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//
import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:meta/meta.dart';

final _$initReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates_return_release_handle'));
final _$initReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates_return_get_result'));
final _$initReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates_return_get_error'));
final _$initReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates_return_has_error'));



/// Represents a GeoPolygon area as a series of geographic coordinates.
///
/// An instance of this class, initialized with appropriate vertices.
@immutable
class GeoPolygon {
  /// The list of geographic coordinates representing the vertices of the polygon.
  final List<GeoCoordinates> vertices;


  const GeoPolygon._(this.vertices);

  GeoPolygon._copy(GeoPolygon _other) : this._(_other.vertices);

  /// Constructs an instance of this class from the provided vertices.
  ///
  /// Throws InstantiationError if the number of vertices is less than three.
  ///
  /// [vertices] List of vertices representing the polygon in clockwise order.
  ///
  /// Throws [InstantiationException]. Instantiation error.
  ///
  GeoPolygon(List<GeoCoordinates> vertices) : this._copy(_$init(vertices));

  /// Constructs an instance of this class from GeoCircle.
  ///
  /// [geoCircle] A [GeoCircle] to be converted into [GeoPolygon].
  ///
  GeoPolygon.withGeoCircle(GeoCircle geoCircle) : this._copy(_withGeoCircle(geoCircle));

  /// Constructs an instance of this class from the provided vertices.
  ///
  /// Throws InstantiationError if the number of vertices is less than three.
  ///
  /// [vertices] List of vertices representing the polygon in clockwise order.
  ///
  /// Throws [InstantiationException]. Instantiation error.
  ///
  static GeoPolygon _$init(List<GeoCoordinates> vertices) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates'));
    final _verticesHandle = heresdkCoreBindingsListofSdkCoreGeocoordinatesToFfi(vertices);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _verticesHandle);
    heresdkCoreBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(_verticesHandle);
    if (_$initReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initReturnGetError(__callResultHandle);
        _$initReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initReturnGetResult(__callResultHandle);
    _$initReturnReleaseHandle(__callResultHandle);
    try {
      return sdkCoreGeopolygonFromFfi(__resultHandle);
    } finally {
      sdkCoreGeopolygonReleaseFfiHandle(__resultHandle);

    }

  }

  /// Constructs an instance of this class from GeoCircle.
  ///
  /// [geoCircle] A [GeoCircle] to be converted into [GeoPolygon].
  ///
  static GeoPolygon _withGeoCircle(GeoCircle geoCircle) {
    final _withGeoCircleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoPolygon_make__GeoCircle'));
    final _geoCircleHandle = sdkCoreGeocircleToFfi(geoCircle);
    final __resultHandle = _withGeoCircleFfi(__lib.LibraryContext.isolateId, _geoCircleHandle);
    sdkCoreGeocircleReleaseFfiHandle(_geoCircleHandle);
    try {
      return sdkCoreGeopolygonFromFfi(__resultHandle);
    } finally {
      sdkCoreGeopolygonReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoPolygon) return false;
    GeoPolygon _other = other;
    return DeepCollectionEquality().equals(vertices, _other.vertices);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(vertices);
    return result;
  }
}


// GeoPolygon "private" section, not exported.

final _sdkCoreGeopolygonCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_create_handle'));
final _sdkCoreGeopolygonReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_release_handle'));
final _sdkCoreGeopolygonGetFieldvertices = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_get_field_vertices'));


Pointer<Void> sdkCoreGeopolygonToFfi(GeoPolygon value) {
  final _verticesHandle = heresdkCoreBindingsListofSdkCoreGeocoordinatesToFfi(value.vertices);
  final _result = _sdkCoreGeopolygonCreateHandle(_verticesHandle);
  heresdkCoreBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(_verticesHandle);
  return _result;
}

GeoPolygon sdkCoreGeopolygonFromFfi(Pointer<Void> handle) {
  final _verticesHandle = _sdkCoreGeopolygonGetFieldvertices(handle);
  try {
    return GeoPolygon._(
      heresdkCoreBindingsListofSdkCoreGeocoordinatesFromFfi(_verticesHandle)
    );
  } finally {
    heresdkCoreBindingsListofSdkCoreGeocoordinatesReleaseFfiHandle(_verticesHandle);
  }
}

void sdkCoreGeopolygonReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeopolygonReleaseHandle(handle);

// Nullable GeoPolygon

final _sdkCoreGeopolygonCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_create_handle_nullable'));
final _sdkCoreGeopolygonReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_release_handle_nullable'));
final _sdkCoreGeopolygonGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_get_value_nullable'));

Pointer<Void> sdkCoreGeopolygonToFfiNullable(GeoPolygon value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeopolygonToFfi(value);
  final result = _sdkCoreGeopolygonCreateHandleNullable(_handle);
  sdkCoreGeopolygonReleaseFfiHandle(_handle);
  return result;
}

GeoPolygon sdkCoreGeopolygonFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeopolygonGetValueNullable(handle);
  final result = sdkCoreGeopolygonFromFfi(_handle);
  sdkCoreGeopolygonReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeopolygonReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeopolygonReleaseHandleNullable(handle);

// End of GeoPolygon "private" section.

