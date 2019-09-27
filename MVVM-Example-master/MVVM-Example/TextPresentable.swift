import UIKit
protocol TextPresentable {
    var text: String { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

extension TextPresentable {
    var textColor: UIColor {
        return .black
    }
    var font: UIFont {
        return .systemFont(ofSize: 16)
    }
}
