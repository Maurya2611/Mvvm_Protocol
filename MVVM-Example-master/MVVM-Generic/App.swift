import Foundation
struct App {
  var name: String
  var summary: String
  var category: String
  var imageURL: URL
}
extension App {
  static func all(_ completion: @escaping ([App]?) -> (Void())) {
    DataManager.jsonForResource("topapps") { json in
      completion(AppBuilder.apps(from: json ?? [:]))
    }
  }
}
