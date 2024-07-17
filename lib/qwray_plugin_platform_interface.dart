import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qwray_plugin_method_channel.dart';

abstract class QwrayPluginPlatform extends PlatformInterface {
  /// Constructs a QwrayPluginPlatform.
  QwrayPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static QwrayPluginPlatform _instance = MethodChannelQwrayPlugin();

  /// The default instance of [QwrayPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelQwrayPlugin].
  static QwrayPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QwrayPluginPlatform] when
  /// they register themselves.
  static set instance(QwrayPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }


  Future<void> configure(String enironment_id) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }


  Future<void> presentSurvey(bool isBanner) {
    throw UnimplementedError('presentSurvey() has not been implemented.');
  }

  Future<void> addEvent(String eventName) {
    throw UnimplementedError('addEvent() has not been implemented.');
  }

  Future<void> logout() {
    throw UnimplementedError('logout() has not been implemented.');
  }

  Future<void> dismissActiveSurvey() {
    throw UnimplementedError('dismissActiveSurvey() has not been implemented.');
  }
}
