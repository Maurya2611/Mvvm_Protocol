import UIKit
protocol ImagePresentable {
    var imageName: String? { get }
    var imageURL: URL? { get }
}
extension ImagePresentable {
    var imageURL: URL? { return nil }
}
