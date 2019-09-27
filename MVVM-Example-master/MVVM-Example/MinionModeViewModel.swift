import UIKit
class MinionModeViewModel: TextPresentable, SwitchPresentable, ImagePresentable, DetailTextPresentable {
    var detailText: String = ""
    var text: String = ""
    var textColor: UIColor { return .black }
    var font: UIFont { return UIFont(name: "CourierNewPS-BoldMT", size: 16.0) ?? .systemFont(ofSize: 16.0) }
    var switchOn: Bool { return true }
    var switchColor: UIColor { return .yellow }
    func onSwitchToggle(onToggle: Bool) {
        if onToggle {
            print("The colorModes are here to stay!!!")
        } else {
            print("The colorModes went out to play!")
        }
    }
    var imageName: String? {
        return "dineHeader"
    }
}
//// MARK: MinionModeViewModel: TextPresentable
//extension MinionModeViewModel: TextPresentable {
//}
//// MARK: MinionModeViewModel: SwitchPresentable
//extension MinionModeViewModel: SwitchPresentable {
//}
//// MARK: MinionModeViewModel: ImagePresentable
//extension MinionModeViewModel: ImagePresentable {
//}
