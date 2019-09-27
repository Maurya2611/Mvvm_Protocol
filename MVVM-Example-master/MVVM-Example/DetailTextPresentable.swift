import UIKit
protocol DetailTextPresentable: TextPresentable {
    var detailText: String { get }
    var detailTextColor: UIColor { get }
    var detailFont: UIFont { get }
}

extension DetailTextPresentable {
    var detailTextColor: UIColor {
        return .lightGray
    }
    var detailFont: UIFont {
        return UIFont(name: "HelveticaNeue-UltraLight", size: 14.0) ?? .systemFont(ofSize: 10)
    }
}
