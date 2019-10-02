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
        if viewModel.productItemArray?[section] is CreditCards {
            return viewModel.productCreditCardItem?.itemList?.count ?? 0
        } else {
            return viewModel.productDepositItem?.itemList?.count ?? 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.reuseIdentifier) as? CustomTableViewCell
        if viewModel.productItemArray?[indexPath.section] is CreditCards {
            if let productName = viewModel.productCreditCardItem?.itemList?[indexPath.row].title {
                viewModel.text = productName
                viewModel.imageName = viewModel.productCreditCardItem?.itemList?[indexPath.row].img
            }
        } else {
            if let productName = viewModel.productDepositItem?.itemList?[indexPath.row].title {
                viewModel.text = productName
                viewModel.imageName = viewModel.productDepositItem?.itemList?[indexPath.row].img
            }
        }
        cell?.configure(withDelegate: viewModel)
        return cell ?? UITableViewCell()
    }
}
