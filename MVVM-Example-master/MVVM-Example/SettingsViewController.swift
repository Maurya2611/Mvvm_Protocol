import UIKit
class SettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    /* Mark:- life Cycle for TableView Delegate & data Source*/
    private let tableViewDataSource = SettingsTableViewDataSource(networkManager: NetworkManager())
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        tableView.dataSource = tableViewDataSource
        tableView.delegate = self
        tableViewDataSource.viewModel.reloadDataWithSucess()
        self.observeEvents()
    }
    private func observeEvents() {
        tableViewDataSource.viewModel.reloadTable = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
/* Mark:- UITableViewDelegate */
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
        CGFloat {
            return 80
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: SectionHeaderView? = Bundle.main.loadNibNamed(SectionHeaderView.reuseIdentifier,
                                                                      owner: self,
                                                                      options: nil)?.first as? SectionHeaderView
        if let headerTittle = tableViewDataSource.viewModel.productSectionArray?[section].capitalized {
            tableViewDataSource.viewModel.productName = headerTittle
            headerView?.lblHeaderTittle.text = tableViewDataSource.viewModel.productName
        }
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
