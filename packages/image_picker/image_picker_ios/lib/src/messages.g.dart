// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v3.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

enum SourceCamera {
  rear,
  front,
}

enum SourceType {
  camera,
  gallery,
}

class MaxSize {
  MaxSize({
    this.width,
    this.height,
  });

  double? width;
  double? height;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['width'] = width;
    pigeonMap['height'] = height;
    return pigeonMap;
  }

  static MaxSize decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return MaxSize(
      width: pigeonMap['width'] as double?,
      height: pigeonMap['height'] as double?,
    );
  }
}

class SourceSpecification {
  SourceSpecification({
    required this.type,
    this.camera,
  });

  SourceType type;
  SourceCamera? camera;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['type'] = type.index;
    pigeonMap['camera'] = camera?.index;
    return pigeonMap;
  }

  static SourceSpecification decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SourceSpecification(
      type: SourceType.values[pigeonMap['type']! as int],
      camera: pigeonMap['camera'] != null
          ? SourceCamera.values[pigeonMap['camera']! as int]
          : null,
    );
  }
}

class _ImagePickerApiCodec extends StandardMessageCodec {
  const _ImagePickerApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MaxSize) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is SourceSpecification) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return MaxSize.decode(readValue(buffer)!);

      case 129:
        return SourceSpecification.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class ImagePickerApi {
  /// Constructor for [ImagePickerApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  ImagePickerApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ImagePickerApiCodec();

  Future<String?> pickImage(SourceSpecification arg_source, MaxSize arg_maxSize,
      int? arg_imageQuality) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ImagePickerApi.pickImage', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_source, arg_maxSize, arg_imageQuality])
            as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as String?);
    }
  }

  Future<List<String?>?> pickMultiImage(
      MaxSize arg_maxSize, int? arg_imageQuality) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ImagePickerApi.pickMultiImage', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_maxSize, arg_imageQuality])
            as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as List<Object?>?)?.cast<String?>();
    }
  }

  Future<String?> pickVideo(
      SourceSpecification arg_source, int? arg_maxDurationSeconds) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ImagePickerApi.pickVideo', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_source, arg_maxDurationSeconds])
            as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as String?);
    }
  }
}
