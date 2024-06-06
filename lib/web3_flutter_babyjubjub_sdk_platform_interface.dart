import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'web3_flutter_babyjubjub_sdk_method_channel.dart';

abstract class Web3FlutterBabyjubjubSdkPlatform extends PlatformInterface {
  /// Constructs a Web3FlutterBabyjubjubSdkPlatform.
  Web3FlutterBabyjubjubSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static Web3FlutterBabyjubjubSdkPlatform _instance = MethodChannelWeb3FlutterBabyjubjubSdk();

  /// The default instance of [Web3FlutterBabyjubjubSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelWeb3FlutterBabyjubjubSdk].
  static Web3FlutterBabyjubjubSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Web3FlutterBabyjubjubSdkPlatform] when
  /// they register themselves.
  static set instance(Web3FlutterBabyjubjubSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
