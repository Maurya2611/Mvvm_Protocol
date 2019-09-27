import UIKit
class SettingsTableViewDataSource: NSObject {
    var viewModel: MinionModeViewModel = MinionModeViewModel()
}
extension SettingsTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SwitchWithTextTableViewCell.reuseIdentifier)
            as? SwitchWithTextTableViewCell
        viewModel.text = "Header Tittle: - \(indexPath.row + 1)"
        viewModel.detailText = "Sub Tittle: - \(indexPath.row + 1)"
        cell?.configure(withDelegate: viewModel)
        return cell ?? UITableViewCell()
    }
}
