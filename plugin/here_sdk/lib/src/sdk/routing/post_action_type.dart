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

/// Identifies the action type.
enum PostActionType {
    /// An action to prepare for electric vehicle charging. Represents the time
    /// spent setting up for charging (e.g., payment processing), independent of
    /// the time required to actually charge the vehicle.
    chargingSetup,
    /// An action to charge the electric vehicle.
    charging,
    /// An action to disembark from a ferry.
    deboard,
    /// An action to be performed at or during a specific portion of a section.
    wait
}

// PostActionType "private" section, not exported.

int sdkRoutingPostactiontypeToFfi(PostActionType value) {
  switch (value) {
  case PostActionType.chargingSetup:
    return 0;
  break;
  case PostActionType.charging:
    return 1;
  break;
  case PostActionType.deboard:
    return 2;
  break;
  case PostActionType.wait:
    return 3;
  break;
  default:
    throw StateError("Invalid enum value $value for PostActionType enum.");
  }
}

PostActionType sdkRoutingPostactiontypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PostActionType.chargingSetup;
  break;
  case 1:
    return PostActionType.charging;
  break;
  case 2:
    return PostActionType.deboard;
  break;
  case 3:
    return PostActionType.wait;
  break;
  default:
    throw StateError("Invalid numeric value $handle for PostActionType enum.");
  }
}

void sdkRoutingPostactiontypeReleaseFfiHandle(int handle) {}

final _sdkRoutingPostactiontypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_PostActionType_create_handle_nullable'));
final _sdkRoutingPostactiontypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostActionType_release_handle_nullable'));
final _sdkRoutingPostactiontypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostActionType_get_value_nullable'));

Pointer<Void> sdkRoutingPostactiontypeToFfiNullable(PostActionType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingPostactiontypeToFfi(value);
  final result = _sdkRoutingPostactiontypeCreateHandleNullable(_handle);
  sdkRoutingPostactiontypeReleaseFfiHandle(_handle);
  return result;
}

PostActionType sdkRoutingPostactiontypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingPostactiontypeGetValueNullable(handle);
  final result = sdkRoutingPostactiontypeFromFfi(_handle);
  sdkRoutingPostactiontypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingPostactiontypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingPostactiontypeReleaseHandleNullable(handle);

// End of PostActionType "private" section.

