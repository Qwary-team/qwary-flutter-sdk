import 'package:flutter/material.dart';
import 'dart:async';
import 'package:qwray_plugin/qwray_plugin.dart';

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

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container()
      ),
    );
  }
}
