import UIKit
// MARK: AppTableCellViewModel
struct AppTableCellViewModel {
  var app: App
}

// MARK: AppTableCellViewModel: ImagePresentable
extension AppTableCellViewModel: ImagePresentable {
  var imageURL: URL? {
    return app.imageURL
  }
  var imageName: String? {
    return nil
  }
}

// MARK: AppTableCellViewModel: TextPresentable
extension AppTableCellViewModel: TextPresentable {
  var text: String {
    return app.name.capitalized
  }
  var textColor: UIColor {
    return .black
  }
  var font: UIFont {
    return .systemFont(ofSize: 17.0)
  }
}

// MARK: AppTableCellViewModel: DetailTextPresentable
extension AppTableCellViewModel: DetailTextPresentable {
  var detailText: String {
    return app.category.capitalized
  }
  var detailTextColor: UIColor {
    return .lightGray
  }
  var detailFont: UIFont {
    return .systemFont(ofSize: UIFont.smallSystemFontSize)
  }
}
