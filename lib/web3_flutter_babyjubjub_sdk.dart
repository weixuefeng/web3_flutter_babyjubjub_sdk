
import 'package:web3_flutter_babyjubjub_sdk/frb_generated.dart';

import 'web3_flutter_babyjubjub_sdk_platform_interface.dart';

class Web3FlutterBabyjubjubSdk {
  Future<String?> getPlatformVersion() {
    return Web3FlutterBabyjubjubSdkPlatform.instance.getPlatformVersion();
  }

  static Future<void> init() async {
    await RustLib.init();
  }

}
