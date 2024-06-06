import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:web3_flutter_babyjubjub_sdk/api/api.dart';
import 'package:web3_flutter_babyjubjub_sdk/frb_generated.dart';
import 'package:web3_flutter_babyjubjub_sdk/web3_flutter_babyjubjub_sdk.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _web3FlutterBabyjubjubSdkPlugin = Web3FlutterBabyjubjubSdk();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> test() async {
    await Web3FlutterBabyjubjubSdk.init();
    var p1 = "5067058882184289685879291240436517726527787201084588250492822232261202434720";
    var p2 = "17039996928425847512124231608079985051815305514092976608073695914635437634363";
    var res = packPoint(pointX: p1, pointY: p2);
    print(res);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _web3FlutterBabyjubjubSdkPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });


  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(child: Text("TEXT"), onPressed: () => test(),),
        ),
      ),
    );
  }
}
