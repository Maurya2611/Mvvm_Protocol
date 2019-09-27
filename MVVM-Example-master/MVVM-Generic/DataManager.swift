import Foundation
struct DataManager {
  static func dataForResource(_ name: String, completion: @escaping (Data?) -> (Void())) {
    doInBackground {
      guard let filePath = Bundle.main.url(forResource: name, withExtension: "json") else {
        completion(nil)
        return
      }
      let data = try? Data(contentsOf: filePath, options: .uncached)
      doOnMain {
        completion(data)
      }
    }
  }
  static func jsonForResource(_ name: String, completion: @escaping (_ json: JSONDictionary?) -> (Void())) {
    dataForResource(name) { completion(parseData($0)) }
  }
  private static func parseData(_ data: Data?) -> JSONDictionary? {
    guard let data = data else { return nil }
    let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
    return jsonObject.flatMap { $0 as? JSONDictionary }
  }
}
