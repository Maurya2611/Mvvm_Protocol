import UIKit
class AppDirector {
  // MARK: Instance Variables
  private let window: UIWindow
  private let storyboard = UIStoryboard(name: "Main", bundle: nil)
  private let navigationController: UINavigationController
  // MARK: Init
  init(window: UIWindow) {
    self.window = window
    self.navigationController = window.rootViewController as? UINavigationController
    configure()
  }
  // MARK: Private
  private func configure() {
    let appsVC = ItemsViewController(items: [App](),
      configure: { (cell: AppTableViewCell<AppTableCellViewModel>, app) in
        cell.configure(withDelegate: AppTableCellViewModel(app: app))
    })
    appsVC.didSelect = showApp
    appsVC.title = "Top Apps"
    navigationController.viewControllers = [appsVC]
    weak var weakApps = appsVC
    App.all { apps in
      weakApps?.items = apps ?? [App]()
    }
  }
  private func showApp(_ app: App) {
    let detailVC = storyboard.instantiateViewController(withIdentifier: "Detail") as? AppDetailViewController
    detailVC.app = app
    navigationController.pushViewController(detailVC, animated: true)
  }
}
