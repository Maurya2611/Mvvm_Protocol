//  CustomTableViewCell.swift
//  MVVM-Example
//
//  Created by Chandresh on 30/9/19.
//  Copyright © 2019 Chandresh Maurya. All rights reserved.
//
import UIKit
typealias BaseViewDataPresentable = TextPresentable &
    ImagePresentable & DetailTextPresentable
/* MARK: - SwitchWithTextTableViewCell: UITableViewCell */
class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTittle: UILabel!
    @IBOutlet weak var lblSubTittle: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    /* Mark: Private Variables */
    private var delegate: BaseViewDataPresentable?
    /* Mark: Public Variables */
    func configure(withDelegate delegate: BaseViewDataPresentable) {
        self.delegate = delegate
        backgroundColor = .clear
        lblTittle.text = delegate.text
        lblTittle.textColor = delegate.textColor
        lblTittle.font = delegate.font
        lblSubTittle.text = delegate.detailText
        lblSubTittle.font = delegate.detailFont
        if let imageName = delegate.imageName {
            imageV.loadImageUsingCache(withUrl: imageName)
        }
        lblSubTittle.isHidden = true
    }
    // MARK: Actions
   
}
// MARK: - SwitchWithTextTableViewCell: CellReuseIdentifierlabel -
extension CustomTableViewCell: CellReuseIdentifierabel {
}
