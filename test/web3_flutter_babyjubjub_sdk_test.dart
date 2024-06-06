import 'package:flutter_test/flutter_test.dart';
import 'package:web3_flutter_babyjubjub_sdk/web3_flutter_babyjubjub_sdk.dart';
import 'package:web3_flutter_babyjubjub_sdk/web3_flutter_babyjubjub_sdk_platform_interface.dart';
import 'package:web3_flutter_babyjubjub_sdk/web3_flutter_babyjubjub_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWeb3FlutterBabyjubjubSdkPlatform
    with MockPlatformInterfaceMixin
    implements Web3FlutterBabyjubjubSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final Web3FlutterBabyjubjubSdkPlatform initialPlatform = Web3FlutterBabyjubjubSdkPlatform.instance;

  test('$MethodChannelWeb3FlutterBabyjubjubSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWeb3FlutterBabyjubjubSdk>());
  });

  test('getPlatformVersion', () async {
    Web3FlutterBabyjubjubSdk web3FlutterBabyjubjubSdkPlugin = Web3FlutterBabyjubjubSdk();
    MockWeb3FlutterBabyjubjubSdkPlatform fakePlatform = MockWeb3FlutterBabyjubjubSdkPlatform();
    Web3FlutterBabyjubjubSdkPlatform.instance = fakePlatform;

    expect(await web3FlutterBabyjubjubSdkPlugin.getPlatformVersion(), '42');
  });
}
