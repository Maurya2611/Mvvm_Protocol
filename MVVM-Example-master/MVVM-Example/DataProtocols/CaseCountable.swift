import Foundation
protocol CaseCountable {
    static func countCases() -> Int
    static var caseCount: Int { get }
}
extension CaseCountable where Self: RawRepresentable, Self.RawValue == Int {
    static func countCases() -> Int {
        var count = 0
        while let _ = Self(rawValue: count) { count += 1 }
        return count
    }
    static var caseCount: Int {
        return countCases()
    }
}
