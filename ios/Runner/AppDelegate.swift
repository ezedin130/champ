import Flutter
import UIKit
import GoogleMaps
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FlutterLocalNotificationsPlugin.setPluginRegistrantcallback{(registry) in
    GeneratedPluginRegistrant.register(with: register)}
    GMSServices.provideAPIKey("AIzaSyC2uueWwYoJJMaQHOMO02vv5llVDD-XWag")
    GeneratedPluginRegistrant.register(with: self)
    if #available(ios 10.0,*){
      UNUserNotificationCenter.current().delegate = slef as? UNUserNotificationCenterDelegate
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
