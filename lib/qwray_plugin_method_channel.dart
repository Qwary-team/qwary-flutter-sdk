import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qwray_plugin_platform_interface.dart';

/// An implementation of [QwrayPluginPlatform] that uses method channels.
class MethodChannelQwrayPlugin extends QwrayPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qwray_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> configure(String enironment_id) async {
    await methodChannel.invokeMethod('configure' ,{'enironment_id': enironment_id});
  }

  @override
  Future<void> presentSurvey(bool isBanner) async {
    await methodChannel.invokeMethod('presentSurvey', {'isBanner': isBanner});
  }

  @override
  Future<void> addEvent(String eventName) async {
    await methodChannel.invokeMethod('addEvent', {'eventName': eventName});
  }

  @override
  Future<void> logout() async {
    await methodChannel.invokeMethod('logout');
  }

  @override
  Future<void> dismissActiveSurvey() async {
    await methodChannel.invokeMethod('dismissActiveSurvey');
  }
}
