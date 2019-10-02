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
                        self.productItemArray =
                            [self.baseDataModel?.creditCards as AnyObject? ?? [] as AnyObject,
                             self.baseDataModel?.deposits as AnyObject? ?? [] as AnyObject,
                             self.baseDataModel?.loans as AnyObject? ?? [] as AnyObject,
                             self.baseDataModel?.insurance as AnyObject? ?? [] as AnyObject]
                        self.reloadTable()
                    }
                }
            }
        }
    }
    func startActivity() {
        CMProgressLoader.showLoading("Loading •••", disableUI: true)
    }
    func numberOfRows(section: Int) -> Int {
        if self.productItemArray?[section] is CreditCards {
            return self.baseDataModel?.creditCards?.itemList?.count ?? 0
        } else {
            if let deposits = self.productItemArray?[section] as? Deposits,
                (deposits.headerTitle?.contains("Deposit Application"))! {
                return self.baseDataModel?.deposits?.itemList?.count ?? 0
            } else if let creditCard = self.productItemArray?[section] as? Deposits,
                (creditCard.headerTitle?.contains("Loan Application"))! {
                return self.baseDataModel?.loans?.itemList?.count ?? 0
            }
            return self.baseDataModel?.insurance?.itemList?.count ?? 0
        }
    }
    func getNumberofCellWithData(index: IndexPath) {
        if self.productItemArray?[index.section] is CreditCards {
            if let productName = self.baseDataModel?.creditCards?.itemList?[index.row].title {
                self.text = productName
                self.imageName = self.baseDataModel?.creditCards?.itemList?[index.row].img
            }
        } else {
            if index.section == 1 {
                if let productName = self.baseDataModel?.deposits?.itemList?[index.row].title {
                    self.text = productName
                    self.imageName = self.baseDataModel?.deposits?.itemList?[index.row].img
                }
            } else if index.section == 2 {
                if let productName = self.baseDataModel?.loans?.itemList?[index.row].title {
                    self.text = productName
                    self.imageName = self.baseDataModel?.loans?.itemList?[index.row].img
                }
            } else {
                if let productName = self.baseDataModel?.insurance?.itemList?[index.row].title {
                    self.text = productName
                    self.imageName = self.baseDataModel?.insurance?.itemList?[index.row].img
                }
            }
        }
    }
}
