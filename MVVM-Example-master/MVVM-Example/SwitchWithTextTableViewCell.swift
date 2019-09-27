import UIKit
typealias SwitchTextImageViewPresentable = TextPresentable &
    SwitchPresentable &
    ImagePresentable &
    DetailTextPresentable
/* MARK: - SwitchWithTextTableViewCell: UITableViewCell */
class SwitchWithTextTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTittle: UILabel!
    @IBOutlet weak var lblSubTittle: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    @IBOutlet weak var imageV: UIImageView!
    /* Mark: Private Variables */
    private var delegate: SwitchTextImageViewPresentable?
    /* Mark: Public Variables */
    func configure(withDelegate delegate: SwitchTextImageViewPresentable) {
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
        switchToggle.isHidden = true
    }
    // MARK: Actions
    @IBAction func onSwitchToggle(_ sender: UISwitch) {
        delegate?.onSwitchToggle(onToggle: sender.isOn)
    }
}
// MARK: - SwitchWithTextTableViewCell: CellReuseIdentifierlabel -
extension SwitchWithTextTableViewCell: CellReuseIdentifierabel {
}
