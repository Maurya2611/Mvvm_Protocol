//  MainBaseViewModel.swift
//  MVVM-Example
//
//  Created by Chandresh on 30/9/19.
//  Copyright © 2019 Chandresh Maurya. All rights reserved.
//
import UIKit

protocol reloadDataWithCollectionView {
    func reloadDataWithSucess()
}
class MainBaseViewModel: TextPresentable, SwitchPresentable,
    ImagePresentable, DetailTextPresentable, reloadDataWithCollectionView {
    var detailText: String = ""
    var networkManager: NetworkManager!
    var baseDataModel: BaseDataModel?
    var text: String = ""
    var textColor: UIColor { return .black }
    var font: UIFont { return UIFont(name: "CourierNewPS-BoldMT", size: 16.0) ?? .systemFont(ofSize: 16.0) }
    var switchOn: Bool { return true }
    var switchColor: UIColor { return .yellow }
    func onSwitchToggle(onToggle: Bool) {
    }
    var reloadTable: () -> Void = { }
    var imageName: String? {
        return "dineHeader"
    }
    func reloadDataWithSucess() {
        startActivity()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.networkManager.getApplyProductsWithData { (dataModel, error) in
                if let serverError = error, !serverError.isEmpty {
                } else {
                    DispatchQueue.main.async {
                        self.baseDataModel = dataModel
                        CMProgressLoader.hide()
                        self.reloadTable()
                    }
                }
            }
        }
    }
    func startActivity() {
      CMProgressLoader.showLoading("Loading •••", disableUI: true)
    }
}
