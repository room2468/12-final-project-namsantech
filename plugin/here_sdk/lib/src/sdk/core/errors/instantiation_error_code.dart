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

/// Instantiation error.
enum InstantiationErrorCode {
    /// Illegal arguments.
    illegalArguments,
    /// Instantiation attempt failed.
    failed,
    /// Instantiation attempt failed because the shared SDK engine is not instantiated.
    /// Please initialise the SDK.
    sharedSdkEngineNotInstantiated,
    /// Access to the specified cache folder is denied
    cacheFolderAccessDenied,
    /// Access to the specified persistent map storage folder is denied
    persistentMapStorageFolderAccessDenied,
    /// The cache folder for given access key id is locked by other instance of SDKNativeEngine
    failedToLockCacheFolder,
    /// The persistent map storage folder for given access key id is locked by other instance of SDKNativeEngine
    failedToLockPersistentMapStorageFolder,
    /// Analytics service can not be created
    failedToCreateAnalyticsService
}

// InstantiationErrorCode "private" section, not exported.

int sdkCoreErrorsInstantiationerrorcodeToFfi(InstantiationErrorCode value) {
  switch (value) {
  case InstantiationErrorCode.illegalArguments:
    return 1;
  break;
  case InstantiationErrorCode.failed:
    return 2;
  break;
  case InstantiationErrorCode.sharedSdkEngineNotInstantiated:
    return 3;
  break;
  case InstantiationErrorCode.cacheFolderAccessDenied:
    return 4;
  break;
  case InstantiationErrorCode.persistentMapStorageFolderAccessDenied:
    return 5;
  break;
  case InstantiationErrorCode.failedToLockCacheFolder:
    return 6;
  break;
  case InstantiationErrorCode.failedToLockPersistentMapStorageFolder:
    return 7;
  break;
  case InstantiationErrorCode.failedToCreateAnalyticsService:
    return 8;
  break;
  default:
    throw StateError("Invalid enum value $value for InstantiationErrorCode enum.");
  }
}

InstantiationErrorCode sdkCoreErrorsInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return InstantiationErrorCode.illegalArguments;
  break;
  case 2:
    return InstantiationErrorCode.failed;
  break;
  case 3:
    return InstantiationErrorCode.sharedSdkEngineNotInstantiated;
  break;
  case 4:
    return InstantiationErrorCode.cacheFolderAccessDenied;
  break;
  case 5:
    return InstantiationErrorCode.persistentMapStorageFolderAccessDenied;
  break;
  case 6:
    return InstantiationErrorCode.failedToLockCacheFolder;
  break;
  case 7:
    return InstantiationErrorCode.failedToLockPersistentMapStorageFolder;
  break;
  case 8:
    return InstantiationErrorCode.failedToCreateAnalyticsService;
  break;
  default:
    throw StateError("Invalid numeric value $handle for InstantiationErrorCode enum.");
  }
}

void sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkCoreErrorsInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_errors_InstantiationErrorCode_create_handle_nullable'));
final _sdkCoreErrorsInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_errors_InstantiationErrorCode_release_handle_nullable'));
final _sdkCoreErrorsInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_errors_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkCoreErrorsInstantiationerrorcodeToFfiNullable(InstantiationErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreErrorsInstantiationerrorcodeToFfi(value);
  final result = _sdkCoreErrorsInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

InstantiationErrorCode sdkCoreErrorsInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreErrorsInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkCoreErrorsInstantiationerrorcodeFromFfi(_handle);
  sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreErrorsInstantiationerrorcodeReleaseHandleNullable(handle);

// End of InstantiationErrorCode "private" section.

