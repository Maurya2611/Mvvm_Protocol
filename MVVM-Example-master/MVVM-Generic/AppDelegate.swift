import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  var app: AppDirector?
  // MARK: UIApplicationDelegate
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
    -> Bool {
    if let window = window {
      app = AppDirector(window: window)
    }
    return true
  }
}
