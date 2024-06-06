import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web3_flutter_babyjubjub_sdk/web3_flutter_babyjubjub_sdk_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelWeb3FlutterBabyjubjubSdk platform = MethodChannelWeb3FlutterBabyjubjubSdk();
  const MethodChannel channel = MethodChannel('web3_flutter_babyjubjub_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
