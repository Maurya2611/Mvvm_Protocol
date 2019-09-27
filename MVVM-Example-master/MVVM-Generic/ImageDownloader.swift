import UIKit
class ImageDownloader {
  private init() {
  }
  static func load(with URL: URL, completion: @escaping (_ image: UIImage?) -> (Void())) {
    URLSession.shared.dataTask(with: URL) { (data, _, _) in
      let image = data.flatMap { UIImage(data: $0) }
      doOnMain { completion(image) }
    }.resume()
  }
}
