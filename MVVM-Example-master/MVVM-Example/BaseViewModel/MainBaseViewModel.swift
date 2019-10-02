//  MainBaseViewModel.swift
//  MVVM-Example
//
//  Created by Chandresh on 30/9/19.
//  Copyright © 2019 Chandresh Maurya. All rights reserved.

import UIKit
protocol reloadDataWithCollectionView {
    func reloadDataWithSucess()
}
enum ProductType: String {
    case creditCards
    case deposits
    case loans
    case insurance
}
class MainBaseViewModel: TextPresentable, ImagePresentable, DetailTextPresentable, ApplyProductProtocol {
    var productDepositItem: Deposits?
    var productCreditCardItem: CreditCards?
    var productSectionArray: [String]? = []
    var productItemArray: [AnyObject]? = []
    var productIcon: String? = ""
    var productName: String? = ""
    var detailText: String = ""
    var applyProductType: ProductType = .deposits
    var networkManager: NetworkManager!
    var baseDataModel: BaseDataModel?
    var text: String = ""
    var textColor: UIColor { return .black }
    var font: UIFont { return UIFont(name: "CourierNewPS-BoldMT", size: 16.0) ?? .systemFont(ofSize: 16.0) }
    var reloadTable: () -> Void = { }
    var imageName: String? = ""
}
extension MainBaseViewModel: reloadDataWithCollectionView {
    func reloadDataWithSucess() {
        startActivity()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.networkManager.getApplyProductsWithData { (dataModel, error) in
                if let serverError = error, !serverError.isEmpty {
                } else {
                    DispatchQueue.main.async {
                        self.baseDataModel = dataModel
                        CMProgressLoader.hide()
                        self.productSectionArray?.append(self.baseDataModel?.creditCards?.headerTitle ?? "")
                        self.productSectionArray?.append(self.baseDataModel?.deposits?.headerTitle ?? "")
                        self.productSectionArray?.append(self.baseDataModel?.loans?.headerTitle ?? "")
                        self.productSectionArray?.append(self.baseDataModel?.insurance?.headerTitle ?? "")
                        if let crediCards = self.baseDataModel?.creditCards {
                            self.productCreditCardItem = crediCards
                        }
                        if let deposits = self.baseDataModel?.deposits {
                            self.productDepositItem = deposits
                        }
                        self.productItemArray =
                            [self.productCreditCardItem as CreditCards? as AnyObject? ?? [] as AnyObject,
                             self.productDepositItem as Deposits? as AnyObject? ?? [] as AnyObject,
                             self.productDepositItem as Deposits? as AnyObject? ?? [] as AnyObject,
                             self.productDepositItem as Deposits? as AnyObject? ?? [] as AnyObject]
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
