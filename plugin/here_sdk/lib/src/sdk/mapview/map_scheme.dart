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

/// Represents the preconfigured map schemes bundled with the SDK.
enum MapScheme {
    /// Normal map for day.
    normalDay,
    /// Normal map for night.
    normalNight,
    /// Day map for navigation and routing purposes.
    @Deprecated("Will be removed in v4.9.0. Use [MapScheme.normalDay] instead or 'preview.normal.day.json' that will become [MapScheme.normalDay] from v4.8.0")
    greyDay,
    /// Night map for navigation and routing purposes.
    @Deprecated("Will be removed in v4.9.0. Use [MapScheme.normalNight] instead or 'preview.normal.night.json' that will become [MapScheme.normalNight] from v4.8.0")
    greyNight,
    /// Satellite imagery.
    satellite,
    /// Day version of hybrid scheme combining satellite data with vector street network, map labels and POI information.
    hybridDay,
    /// Night version of hybrid scheme combining satellite data with vector street network, map labels and POI information.
    hybridNight
}

// MapScheme "private" section, not exported.

int sdkMapviewMapschemeToFfi(MapScheme value) {
  switch (value) {
  case MapScheme.normalDay:
    return 0;
  break;
  case MapScheme.normalNight:
    return 1;
  break;
  case MapScheme.greyDay:
    return 2;
  break;
  case MapScheme.greyNight:
    return 3;
  break;
  case MapScheme.satellite:
    return 4;
  break;
  case MapScheme.hybridDay:
    return 5;
  break;
  case MapScheme.hybridNight:
    return 6;
  break;
  default:
    throw StateError("Invalid enum value $value for MapScheme enum.");
  }
}

MapScheme sdkMapviewMapschemeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapScheme.normalDay;
  break;
  case 1:
    return MapScheme.normalNight;
  break;
  case 2:
    return MapScheme.greyDay;
  break;
  case 3:
    return MapScheme.greyNight;
  break;
  case 4:
    return MapScheme.satellite;
  break;
  case 5:
    return MapScheme.hybridDay;
  break;
  case 6:
    return MapScheme.hybridNight;
  break;
  default:
    throw StateError("Invalid numeric value $handle for MapScheme enum.");
  }
}

void sdkMapviewMapschemeReleaseFfiHandle(int handle) {}

final _sdkMapviewMapschemeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapScheme_create_handle_nullable'));
final _sdkMapviewMapschemeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScheme_release_handle_nullable'));
final _sdkMapviewMapschemeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScheme_get_value_nullable'));

Pointer<Void> sdkMapviewMapschemeToFfiNullable(MapScheme value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapschemeToFfi(value);
  final result = _sdkMapviewMapschemeCreateHandleNullable(_handle);
  sdkMapviewMapschemeReleaseFfiHandle(_handle);
  return result;
}

MapScheme sdkMapviewMapschemeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapschemeGetValueNullable(handle);
  final result = sdkMapviewMapschemeFromFfi(_handle);
  sdkMapviewMapschemeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapschemeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapschemeReleaseHandleNullable(handle);

// End of MapScheme "private" section.

