import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'web3_flutter_babyjubjub_sdk_platform_interface.dart';

/// An implementation of [Web3FlutterBabyjubjubSdkPlatform] that uses method channels.
class MethodChannelWeb3FlutterBabyjubjubSdk extends Web3FlutterBabyjubjubSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('web3_flutter_babyjubjub_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
