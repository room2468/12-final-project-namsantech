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

/// Identifiers for different types of hazardous materials which
/// can be shipped by the truck.
enum HazardousGood {
    /// Explosive material.
    explosive,
    /// Gas.
    gas,
    /// Flammable material.
    flammable,
    /// Combustible material.
    combustible,
    /// Organic material.
    organic,
    /// Poisonous material.
    poison,
    /// Radioactive material.
    radioactive,
    /// Corrosive material.
    corrosive,
    /// Materials that are poisonous upon inhalation.
    poisonousInhalation,
    /// Materials that are harmful to water.
    harmfulToWater,
    /// Any other hazardous material.
    other
}

// HazardousGood "private" section, not exported.

int sdkRoutingHazardousgoodToFfi(HazardousGood value) {
  switch (value) {
  case HazardousGood.explosive:
    return 0;
  break;
  case HazardousGood.gas:
    return 1;
  break;
  case HazardousGood.flammable:
    return 2;
  break;
  case HazardousGood.combustible:
    return 3;
  break;
  case HazardousGood.organic:
    return 4;
  break;
  case HazardousGood.poison:
    return 5;
  break;
  case HazardousGood.radioactive:
    return 6;
  break;
  case HazardousGood.corrosive:
    return 7;
  break;
  case HazardousGood.poisonousInhalation:
    return 8;
  break;
  case HazardousGood.harmfulToWater:
    return 9;
  break;
  case HazardousGood.other:
    return 10;
  break;
  default:
    throw StateError("Invalid enum value $value for HazardousGood enum.");
  }
}

HazardousGood sdkRoutingHazardousgoodFromFfi(int handle) {
  switch (handle) {
  case 0:
    return HazardousGood.explosive;
  break;
  case 1:
    return HazardousGood.gas;
  break;
  case 2:
    return HazardousGood.flammable;
  break;
  case 3:
    return HazardousGood.combustible;
  break;
  case 4:
    return HazardousGood.organic;
  break;
  case 5:
    return HazardousGood.poison;
  break;
  case 6:
    return HazardousGood.radioactive;
  break;
  case 7:
    return HazardousGood.corrosive;
  break;
  case 8:
    return HazardousGood.poisonousInhalation;
  break;
  case 9:
    return HazardousGood.harmfulToWater;
  break;
  case 10:
    return HazardousGood.other;
  break;
  default:
    throw StateError("Invalid numeric value $handle for HazardousGood enum.");
  }
}

void sdkRoutingHazardousgoodReleaseFfiHandle(int handle) {}

final _sdkRoutingHazardousgoodCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_HazardousGood_create_handle_nullable'));
final _sdkRoutingHazardousgoodReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_HazardousGood_release_handle_nullable'));
final _sdkRoutingHazardousgoodGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_HazardousGood_get_value_nullable'));

Pointer<Void> sdkRoutingHazardousgoodToFfiNullable(HazardousGood value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingHazardousgoodToFfi(value);
  final result = _sdkRoutingHazardousgoodCreateHandleNullable(_handle);
  sdkRoutingHazardousgoodReleaseFfiHandle(_handle);
  return result;
}

HazardousGood sdkRoutingHazardousgoodFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingHazardousgoodGetValueNullable(handle);
  final result = sdkRoutingHazardousgoodFromFfi(_handle);
  sdkRoutingHazardousgoodReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingHazardousgoodReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingHazardousgoodReleaseHandleNullable(handle);

// End of HazardousGood "private" section.

