//  MainBaseViewModel.swift
//  MVVM-Example
//
//  Created by Chandresh on 30/9/19.
//  Copyright © 2019 Chandresh Maurya. All rights reserved.
//
import UIKit
class MainBaseViewModel: TextPresentable, SwitchPresentable, ImagePresentable, DetailTextPresentable {
    var detailText: String = ""
    var networkManager: NetworkManager!
    var text: String = ""
    var textColor: UIColor { return .black }
    var font: UIFont { return UIFont(name: "CourierNewPS-BoldMT", size: 16.0) ?? .systemFont(ofSize: 16.0) }
    var switchOn: Bool { return true }
    var switchColor: UIColor { return .yellow }
    func onSwitchToggle(onToggle: Bool) {
        if onToggle {
            networkManager.getApplyProductsWithData { (dataModel, error) in
                if let serverError = error, !serverError.isEmpty {
                    DispatchQueue.main.async {
                        //self.lblmessage?.text = String(format: "%@", serverError.description.capitalized)
                        print(dataModel?.deposits ?? "")
                    }
                } else {
                    print(dataModel?.deposits ?? "")
                }
            }
        } else {
        }
    }
    var imageName: String? {
        return "dineHeader"
    }
}
