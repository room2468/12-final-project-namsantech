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

/// Specifies the [Section] mode of transport.
///
/// A [Section] may have a different
/// transport mode than the one specified for route calculation. For example, a car route may have a
/// section having ferry transport mode.
enum SectionTransportMode {
    /// Car mode of transport.
    car,
    /// Truck mode of transport.
    truck,
    /// Pedestrian mode of transport.
    pedestrian,
    /// Ferry mode of transport.
    ferry,
    /// Mode of transport representing a shuttle train for cars.
    carShuttleTrain,
    /// Scooter mode of transport.
    scooter,
    /// A section with this mode is part of a public transit route. The actual transport mode can be
    /// obtained from [Section.transitDetails].
    publicTransit,
    /// Taxi mode of transport.
    ///
    /// **Note:** This is a beta release of this transport mode, so there could be a few bugs and unexpected
    /// behaviors. Related APIs may change for new releases or even become unsupported, without a
    /// deprecation process.
    taxi
}

// SectionTransportMode "private" section, not exported.

int sdkRoutingSectiontransportmodeToFfi(SectionTransportMode value) {
  switch (value) {
  case SectionTransportMode.car:
    return 0;
  break;
  case SectionTransportMode.truck:
    return 1;
  break;
  case SectionTransportMode.pedestrian:
    return 2;
  break;
  case SectionTransportMode.ferry:
    return 3;
  break;
  case SectionTransportMode.carShuttleTrain:
    return 4;
  break;
  case SectionTransportMode.scooter:
    return 5;
  break;
  case SectionTransportMode.publicTransit:
    return 6;
  break;
  case SectionTransportMode.taxi:
    return 7;
  break;
  default:
    throw StateError("Invalid enum value $value for SectionTransportMode enum.");
  }
}

SectionTransportMode sdkRoutingSectiontransportmodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SectionTransportMode.car;
  break;
  case 1:
    return SectionTransportMode.truck;
  break;
  case 2:
    return SectionTransportMode.pedestrian;
  break;
  case 3:
    return SectionTransportMode.ferry;
  break;
  case 4:
    return SectionTransportMode.carShuttleTrain;
  break;
  case 5:
    return SectionTransportMode.scooter;
  break;
  case 6:
    return SectionTransportMode.publicTransit;
  break;
  case 7:
    return SectionTransportMode.taxi;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SectionTransportMode enum.");
  }
}

void sdkRoutingSectiontransportmodeReleaseFfiHandle(int handle) {}

final _sdkRoutingSectiontransportmodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_SectionTransportMode_create_handle_nullable'));
final _sdkRoutingSectiontransportmodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionTransportMode_release_handle_nullable'));
final _sdkRoutingSectiontransportmodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionTransportMode_get_value_nullable'));

Pointer<Void> sdkRoutingSectiontransportmodeToFfiNullable(SectionTransportMode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingSectiontransportmodeToFfi(value);
  final result = _sdkRoutingSectiontransportmodeCreateHandleNullable(_handle);
  sdkRoutingSectiontransportmodeReleaseFfiHandle(_handle);
  return result;
}

SectionTransportMode sdkRoutingSectiontransportmodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingSectiontransportmodeGetValueNullable(handle);
  final result = sdkRoutingSectiontransportmodeFromFfi(_handle);
  sdkRoutingSectiontransportmodeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingSectiontransportmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSectiontransportmodeReleaseHandleNullable(handle);

// End of SectionTransportMode "private" section.

