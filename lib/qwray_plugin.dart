
import 'qwray_plugin_platform_interface.dart';

class QwrayPlugin {


  Future<void> configure(String enironment_id) {
    return QwrayPluginPlatform.instance.configure(enironment_id);
  }

  Future<void> presentSurvey(bool isBanner) {
    return QwrayPluginPlatform.instance.presentSurvey(isBanner);
  }

  Future<void> addEvent(String eventName) {
    return QwrayPluginPlatform.instance.addEvent(eventName);
  }

  Future<void> logout() {
    return QwrayPluginPlatform.instance.logout();
  }

  Future<void> dismissActiveSurvey() {
    return QwrayPluginPlatform.instance.dismissActiveSurvey();
  }
}
