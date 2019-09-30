import UIKit
typealias BaseViewDataPresentable = TextPresentable &
    SwitchPresentable &
    ImagePresentable &
DetailTextPresentable
/* MARK: - SwitchWithTextTableViewCell: UITableViewCell */
class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTittle: UILabel!
    @IBOutlet weak var lblSubTittle: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
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
        switchToggle.isOn = delegate.switchOn
        switchToggle.onTintColor = delegate.switchColor
        if let imageName = delegate.imageName {
            imageV.image = UIImage(named: imageName)
        }
        switchToggle.isHidden = false
    }
    // MARK: Actions
    @IBAction func onSwitchToggle(_ sender: UISwitch) {
        delegate?.onSwitchToggle(onToggle: sender.isOn)
    }
}
// MARK: - SwitchWithTextTableViewCell: CellReuseIdentifierlabel -
extension CustomTableViewCell: CellReuseIdentifierabel {
}
