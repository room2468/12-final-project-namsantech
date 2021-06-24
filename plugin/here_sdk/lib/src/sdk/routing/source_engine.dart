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

/// @nodoc
enum SourceEngine {
    routing,
    indoor,
    offlineRouting,
    returnToRoute,
    publicTransit
}

// SourceEngine "private" section, not exported.

int sdkRoutingSourceengineToFfi(SourceEngine value) {
  switch (value) {
  case SourceEngine.routing:
    return 0;
  break;
  case SourceEngine.indoor:
    return 1;
  break;
  case SourceEngine.offlineRouting:
    return 2;
  break;
  case SourceEngine.returnToRoute:
    return 3;
  break;
  case SourceEngine.publicTransit:
    return 4;
  break;
  default:
    throw StateError("Invalid enum value $value for SourceEngine enum.");
  }
}

SourceEngine sdkRoutingSourceengineFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SourceEngine.routing;
  break;
  case 1:
    return SourceEngine.indoor;
  break;
  case 2:
    return SourceEngine.offlineRouting;
  break;
  case 3:
    return SourceEngine.returnToRoute;
  break;
  case 4:
    return SourceEngine.publicTransit;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SourceEngine enum.");
  }
}

void sdkRoutingSourceengineReleaseFfiHandle(int handle) {}

final _sdkRoutingSourceengineCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_SourceEngine_create_handle_nullable'));
final _sdkRoutingSourceengineReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SourceEngine_release_handle_nullable'));
final _sdkRoutingSourceengineGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SourceEngine_get_value_nullable'));

Pointer<Void> sdkRoutingSourceengineToFfiNullable(SourceEngine value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingSourceengineToFfi(value);
  final result = _sdkRoutingSourceengineCreateHandleNullable(_handle);
  sdkRoutingSourceengineReleaseFfiHandle(_handle);
  return result;
}

SourceEngine sdkRoutingSourceengineFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingSourceengineGetValueNullable(handle);
  final result = sdkRoutingSourceengineFromFfi(_handle);
  sdkRoutingSourceengineReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingSourceengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSourceengineReleaseHandleNullable(handle);

// End of SourceEngine "private" section.

