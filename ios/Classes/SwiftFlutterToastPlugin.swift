import Flutter
import UIKit

public class SwiftFlutterToastPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_toast_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterToastPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method.elementsEqual("showToast")) {
        let arguments = call.arguments as? NSDictionary
        let message = arguments!["message"] as? String
        DispatchQueue.main.async {
           let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert);
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
       }
    }
    result("iOS " + UIDevice.current.systemVersion)
  }
}
