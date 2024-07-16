import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:qwray_plugin/qwray_plugin.dart';
import 'package:qwray_plugin/qwray_plugin_platform_interface.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _qwrayPlugin = QwrayPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    await QwrayPlugin().configure("c5e3e8c3-5b12-481d-a4c9-1570bd532860");


    await QwrayPlugin().addEvent('T29_04_1');
    await QwrayPlugin().addEvent('HomePageVisitor');
    await QwrayPlugin().addEvent('T29_04_2');
    await QwrayPlugin().addEvent('NoCode');
    await QwrayPlugin().addEvent('T29_04_3');

   /* String platformVersion;
    try {
      platformVersion =
          await _qwrayPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container()

        /* Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  print('call configure function:');
                   await QwrayPlugin().configure("c5e3e8c3-5b12-481d-a4c9-1570bd532860");

                },
                child: Text('Configure'),
              ),
              SizedBox(height: 20,) ,
              ElevatedButton(
                onPressed: () async {
                  await QwrayPlugin().presentSurvey(true);
                },
                child: Text('Present Survey'),
              ),
              SizedBox(height: 20,) ,
              ElevatedButton(
                onPressed: () async {
                  await QwrayPlugin().addEvent('T29_04_1');
                },
                child: Text('Add Event'),
              ),
              SizedBox(height: 20,) ,
              ElevatedButton(
                onPressed: () async {
                  await QwrayPlugin().logout();
                },
                child: Text('Logout'),
              ),
              SizedBox(height: 20,) ,
              ElevatedButton(
                onPressed: () async {
                  await QwrayPlugin().dismissActiveSurvey();
                },
                child: Text('Dismiss Active Survey'),
              ),
            ],
          ),
        ),*/
      ),
    );
  }
}
