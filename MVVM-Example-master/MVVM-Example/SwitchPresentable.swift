import UIKit
protocol SwitchPresentable {
    var switchOn: Bool { get }
    var switchColor: UIColor { get }
    func onSwitchToggle(onToggle: Bool)
}
