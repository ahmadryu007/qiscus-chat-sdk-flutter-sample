import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    
    
    if let controller = self.window.rootViewController as? FlutterViewController {
        let nativeChannel = FlutterMethodChannel.init(name: "qiscusmeet_plugin", binaryMessenger: controller.binaryMessenger).setMethodCallHandler { (call, result) in
            if call.method == "video_call" {
                
            }
        }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
