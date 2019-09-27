import Foundation
protocol CellReuseIdentifierabel {
    static var reuseIdentifier: String { get }
}
extension CellReuseIdentifierabel {
    static var reuseIdentifier: String {
        return "\(self)"
    }
}
