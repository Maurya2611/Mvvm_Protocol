import UIKit
class SettingsTableViewDataSource: NSObject {
    var viewModel: MainBaseViewModel = MainBaseViewModel()
    init(networkManager: NetworkManager) {
        viewModel.networkManager = networkManager
    }
}
extension SettingsTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.baseDataModel?.creditCards?.itemList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.reuseIdentifier)
            as? CustomTableViewCell
        viewModel.text = viewModel.baseDataModel?.creditCards?.itemList?[indexPath.row].title ?? ""
//        viewModel.detailText = viewModel.baseDataModel?.creditCards?.itemList?[indexPath.row].title ?? ""
        viewModel.imageName = viewModel.baseDataModel?.creditCards?.itemList?[indexPath.row].img
        cell?.configure(withDelegate: viewModel)
        return cell ?? UITableViewCell()
    }
}
