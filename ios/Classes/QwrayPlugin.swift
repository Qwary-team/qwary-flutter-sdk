import Flutter
import UIKit
import Swift
import QwaryKit

public class QwrayPlugin: NSObject, FlutterPlugin {

  private var rootViewController: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "qwray_plugin", binaryMessenger: registrar.messenger())
    let instance = QwrayPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   guard let viewController = rootViewController else {
              result(FlutterError(code: "NO_ACTIVITY", message: "Activity context is not available", details: nil))
              return
          }
    switch call.method {
    case "getPlatformVersion":
       // var view = UIViewController()
        print("Ios_connted")
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }
         /*if let pluginBundle = Bundle(identifier: "com.qwary.qwray_plugin") {
                if let path = pluginBundle.path(forResource: "render", ofType: "html", inDirectory: "Assest") {
                   print("render path /()path ")
                } else {
                  result(FlutterError(code: "FILE_NOT_FOUND", message: "HTML file not found", details: nil))
                }
              } else {
               print("render path \(FlutterError(code: "FILE_NOT_FOUND", message: "HTML file not found", details: nil))")
              }*/

        Qwary.configure(context: viewController,qwSettings: "c5e3e8c3-5b12-481d-a4c9-1570bd532860")
   // result("iOS " + UIDevice.current.systemVersion)
  // result(true)
   case "configure":
              if let arguments = call.arguments as? [String: Any], let environmentId = arguments["enironment_id"] as? String {
                  Qwary.configure(context: viewController, qwSettings: environmentId)
                  result(true)
              } else {
                  result(FlutterError(code: "INVALID_ARGUMENT", message: "Environment ID is null", details: nil))
              }

    case "presentSurvey":
               let isBanner = (call.arguments as? [String: Any])?["isBanner"] as? Bool ?? false
               Qwary.presentSurvey(fragmentActivity: viewController, isBanner: isBanner)
               result(true)

     case "addEvent":
                if let eventName = (call.arguments as? [String: Any])?["eventName"] as? String {
                    Qwary.addEvent(eventName : eventName)
                    result(true)

                } else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Event name is null", details: nil))
                }
    case "logout":
                Qwary.logout()
                result(true)

    case "dismissActiveSurvey":
                Qwary.dismissActiveSurvey()
                result(true)

    default:
      result(FlutterMethodNotImplemented)
    }
  }

}
