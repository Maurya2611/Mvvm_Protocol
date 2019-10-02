import UIKit
class SettingsTableViewDataSource: NSObject {
    var viewModel: MainBaseViewModel = MainBaseViewModel()
    init(networkManager: NetworkManager) {
        viewModel.networkManager = networkManager
        /* You can use by Creating Variable for Network Layer
         var networkManager: NetworkManager = NetworkManager()
         self.viewModel.networkManager = self.networkManager() */
    }
}
extension SettingsTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.productSectionArray?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.reuseIdentifier) as? CustomTableViewCell
        viewModel.getNumberofCellWithData(index: indexPath)
        cell?.configure(withDelegate: viewModel)
        return cell ?? UITableViewCell()
    }
}
