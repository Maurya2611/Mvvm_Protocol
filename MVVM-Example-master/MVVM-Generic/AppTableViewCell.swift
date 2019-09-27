import UIKit
class AppTableViewCell<T>: UITableViewCell where T: TextPresentable, T: DetailTextPresentable, T: ImagePresentable {
  // MARK: Variables
  private lazy var appImageView: UIImageView = {
    let imgView = UIImageView()
    imgView.translatesAutoresizingMaskIntoConstraints = false
    imgView.clipsToBounds = true
    imgView.contentMode = .scaleToFill
    return imgView
  }()
  private lazy var appTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .left
    return label
  }()
  private lazy var appDetailLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .right
    return label
  }()
  // MARK: Init
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    sharedInitialization()
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    appImageView.image = nil
  }
  // MARK: Public
  func configure(withDelegate delegate: T) {
    if let imageURL = delegate.imageURL {
      ImageDownloader.load(with: imageURL, completion: { [weak self] in
        self?.appImageView.image = $0
      })
    }
    appTitleLabel.text = delegate.text
    appTitleLabel.textColor = delegate.textColor
    appTitleLabel.font = delegate.font
    appDetailLabel.text = delegate.detailText
    appDetailLabel.textColor = delegate.detailTextColor
    appDetailLabel.font = delegate.detailFont
  }
  // MARK: Private
  private func sharedInitialization() {
    addSubview(appImageView)
    addSubview(appTitleLabel)
    addSubview(appDetailLabel)
    // Image view constraints.
    NSLayoutConstraint.activate([
      appImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      appImageView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
      appImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
      appImageView.widthAnchor.constraint(equalTo: appImageView.heightAnchor)]
    )
    // Title label constraints.
    NSLayoutConstraint.activate([
      appTitleLabel.leadingAnchor.constraint(equalTo: appImageView.trailingAnchor, constant: 8),
      appTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)]
    )
    NSLayoutConstraint.activate([
      appDetailLabel.leadingAnchor.constraint(greaterThanOrEqualTo: appTitleLabel.trailingAnchor, constant: 8),
      appDetailLabel.centerYAnchor.constraint(equalTo: appTitleLabel.centerYAnchor),
      appDetailLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 8)]
    )
    appTitleLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
    appDetailLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
    appImageView.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
    appImageView.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .vertical)
  }
}
