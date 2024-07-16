import 'package:flutter_test/flutter_test.dart';
import 'package:qwray_plugin/qwray_plugin.dart';
import 'package:qwray_plugin/qwray_plugin_platform_interface.dart';
import 'package:qwray_plugin/qwray_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQwrayPluginPlatform
    with MockPlatformInterfaceMixin
    implements QwrayPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> addEvent(String eventName) {
    // TODO: implement addEvent
    throw UnimplementedError();
  }

  @override
  Future<void> configure(String enironment_id) {
    // TODO: implement configure
    throw UnimplementedError();
  }

  @override
  Future<void> dismissActiveSurvey() {
    // TODO: implement dismissActiveSurvey
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> presentSurvey(bool isBanner) {
    // TODO: implement presentSurvey
    throw UnimplementedError();
  }
}

void main() {
  final QwrayPluginPlatform initialPlatform = QwrayPluginPlatform.instance;

  test('$MethodChannelQwrayPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQwrayPlugin>());
  });

  test('getPlatformVersion', () async {
    QwrayPlugin qwrayPlugin = QwrayPlugin();
    MockQwrayPluginPlatform fakePlatform = MockQwrayPluginPlatform();
    QwrayPluginPlatform.instance = fakePlatform;

    expect(await qwrayPlugin.getPlatformVersion(), '42');
  });
}
