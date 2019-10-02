//
//  ApplyProductProtocol.swift
//  MVVM-Example
//
//  Created by Chandresh on 1/10/19.
//  Copyright © 2019 Ivan Magda. All rights reserved.
//

import Foundation
import UIKit
protocol ApplyProductProtocol {
    var productName: String? { get }
    var productIcon: String? { get }
    var productSectionArray: [String]? { get }
    var productDepositItem: Deposits? { get }
    var productCreditCardItem: CreditCards? { get }
}
extension ApplyProductProtocol {
    var productName: String {
        return ""
    }
    var productIcon: String {
        return ""
    }
}
