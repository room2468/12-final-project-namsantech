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
import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents various errors that could occur from MapView operations.
enum MapError {
    /// The previous operation is not completed.
    operationInProgress,
    /// Map layer with the same name already exists.
    duplicateLayer,
    /// Data Sources are not initialized properly.
    invalidDataSource,
    /// The scene file does not define a valid map scene.
    invalidScene,
    /// The requested scene file contained invalid data.
    invalidContent,
    /// Map scene is in an invalid state (after MapView was destroyed).
    invalidState,
    /// The map layer does not exist.
    unknownLayer,
    /// An unknown error occurred while processing the scene.
    unknown
}

// MapError "private" section, not exported.

int sdkMapviewMaperrorToFfi(MapError value) {
  switch (value) {
  case MapError.operationInProgress:
    return 1;
  break;
  case MapError.duplicateLayer:
    return 2;
  break;
  case MapError.invalidDataSource:
    return 3;
  break;
  case MapError.invalidScene:
    return 4;
  break;
  case MapError.invalidContent:
    return 5;
  break;
  case MapError.invalidState:
    return 6;
  break;
  case MapError.unknownLayer:
    return 7;
  break;
  case MapError.unknown:
    return 8;
  break;
  default:
    throw StateError("Invalid enum value $value for MapError enum.");
  }
}

MapError sdkMapviewMaperrorFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapError.operationInProgress;
  break;
  case 2:
    return MapError.duplicateLayer;
  break;
  case 3:
    return MapError.invalidDataSource;
  break;
  case 4:
    return MapError.invalidScene;
  break;
  case 5:
    return MapError.invalidContent;
  break;
  case 6:
    return MapError.invalidState;
  break;
  case 7:
    return MapError.unknownLayer;
  break;
  case 8:
    return MapError.unknown;
  break;
  default:
    throw StateError("Invalid numeric value $handle for MapError enum.");
  }
}

void sdkMapviewMaperrorReleaseFfiHandle(int handle) {}

final _sdkMapviewMaperrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapError_create_handle_nullable'));
final _sdkMapviewMaperrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapError_release_handle_nullable'));
final _sdkMapviewMaperrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapError_get_value_nullable'));

Pointer<Void> sdkMapviewMaperrorToFfiNullable(MapError value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMaperrorToFfi(value);
  final result = _sdkMapviewMaperrorCreateHandleNullable(_handle);
  sdkMapviewMaperrorReleaseFfiHandle(_handle);
  return result;
}

MapError sdkMapviewMaperrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMaperrorGetValueNullable(handle);
  final result = sdkMapviewMaperrorFromFfi(_handle);
  sdkMapviewMaperrorReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMaperrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaperrorReleaseHandleNullable(handle);

// End of MapError "private" section.
