import UIKit
import Braintree

import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyBdzaZhRBCX-WRnf-6Hr9ZFoZ_8R7U7JtA")
    GeneratedPluginRegistrant.register(with: self)
    BTAppContextSwitcher.setReturnURLScheme("com.mycompany.deliveryapp.braintree")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
