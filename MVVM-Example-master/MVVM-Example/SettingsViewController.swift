import UIKit
class SettingsViewController: UIViewController {
    // MARK: Variables
    @IBOutlet weak var tableView: UITableView!
    // MARK: Life Cycle
    private let tableViewDataSource = SettingsTableViewDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        tableView.dataSource = tableViewDataSource
        tableView.delegate = self
        tableView.backgroundColor = UIColor.init(red: 243.0/255.0, green: 228.0/255.0, blue: 200.0/255.0, alpha: 1.0)
    }
}

// MARK: - ViewController: UITableViewDelegate -
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
        CGFloat {
        return 70
    }
}