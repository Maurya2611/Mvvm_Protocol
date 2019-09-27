import Foundation
class AppBuilder {
  // MARK: Static
  static let shared = AppBuilder()
  // MARK: Init
  private init() {
  }
  // MARK: Parsing
  class func apps(from json: JSONDictionary) -> [App]? {
    guard let feed = json["feed"] as? JSONDictionary,
    let apps = feed["entry"] as? [JSONDictionary] else { return nil }
    return apps.flatMap { app(from: $0) }
  }
  class func app(from json: JSONDictionary) -> App? {
    guard let nameContainer = json["im:name"] as? JSONDictionary,
      let name = nameContainer["label"] as? String else { return nil }
    guard let summaryContainer = json["summary"] as? JSONDictionary,
      let summary = summaryContainer["label"] as? String else { return nil }
    guard let categoryContainer = json["category"] as? JSONDictionary,
      let attributes = categoryContainer["attributes"] as? JSONDictionary,
      let category = attributes["label"] as? String else { return nil }
    guard let images = json["im:image"] as? [JSONDictionary],
      let image = images.first?["label"] as? String,
      let imageURL = URL(string: image) else { return nil }
    return App(name: name, summary: summary, category: category, imageURL: imageURL)
  }
}
