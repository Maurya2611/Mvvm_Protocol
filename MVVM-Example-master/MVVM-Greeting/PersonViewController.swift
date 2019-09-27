import UIKit
// MARK: PersonViewController: UIViewController
class PersonViewController: UIViewController {
  // MARK: Outlets
  @IBOutlet weak var nameTextLabel: UILabel!
  @IBOutlet weak var birthdateTextLabel: UILabel!
  // MARK: Instance Variables
  fileprivate let personViewModel = PersonViewModel(person: Person.steveJobs())
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
}
// MARK: PersonViewController (Configure)
extension PersonViewController {
  /// Configures the UI.
  fileprivate func configure() {
    nameTextLabel.text = personViewModel.nameText
    birthdateTextLabel.text = personViewModel.birthdateText
  }
}
