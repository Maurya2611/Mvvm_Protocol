//  ANLoader.swift
//  MVVM-Example
//
//  Created by Chandresh on 30/9/19.
//  Copyright © 2019 Chandresh Maurya. All rights reserved.

import UIKit
import QuartzCore
public struct CMProgressLoader {
    public static var showFadeOutAnimation = true
    public static var pulseAnimation = true
    public static var activityColor: UIColor = UIColor.red
    public static var activityBackgroundColor: UIColor = UIColor.clear
    public static var activityTextColor: UIColor = UIColor.black
    public static var activityFontName = UIFont(name: "CourierNewPS-BoldMT", size: 18.0)
    public static var activityWidth = 200 / 2
    public static var activityHeight = activityWidth
    public static var widthDivision: CGFloat = {
        guard UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad else {
            return 1.6
        }
        return 3.5
    }()
    public static var viewBackgroundDark: Bool = false
    public static var loadOverApplicationWindow: Bool = false
    public static var instance: LoadingResource?
    public static var backgroundView: UIView!
    fileprivate static var hidingInProgress = false
    // MARK: - Show Loading With Text....
    public static func showLoading(_ text: String, disableUI: Bool) {
        CMProgressLoader().startLoadingActivity(text, with: disableUI)
    }
    // MARK: - Show Loading....
    public static func showLoading() {
        CMProgressLoader().startLoadingActivity("", with: false)
    }
    // MARK: - Hide Loading....
    public static func hide() {
        DispatchQueue.main.async {
            instance?.hideActivity()
        }
    }
    public class LoadingResource: UIView {
        fileprivate var textLabel: UILabel!
        fileprivate var activityView: UIActivityIndicatorView!
        fileprivate var disableUIIntraction = false
        convenience init(text: String, disableUI: Bool) {
            self.init(frame: CGRect(x: 0, y: 0, width: activityWidth, height: activityHeight))
            center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleRightMargin]
            backgroundColor = activityBackgroundColor
            alpha = 1
            layer.cornerRadius = 5
            let yPosition = frame.height/2 - 20
            addActivityView(yPosition)
            addTextLabel(yPosition + activityView.frame.size.height, text: text)
            //Apply here Border & Shadow
            checkActivityBackgroundColor()
            guard disableUI else {
                return
            }
            UIApplication.shared.beginIgnoringInteractionEvents()
            disableUIIntraction = true
        }
        private func checkActivityBackgroundColor() {
            guard activityBackgroundColor != .clear else {
                return
            }
            self.dropShadow()
            self.addBorder()
            addPulseAnimation()
        }
        fileprivate func addPulseAnimation() {
            guard pulseAnimation else {
                return
            }
            DispatchQueue.main.async {
                let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
                pulseAnimation.duration = 1.0
                pulseAnimation.fromValue = 0.8
                pulseAnimation.toValue = 1
                pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                pulseAnimation.autoreverses = true
                pulseAnimation.repeatCount = .greatestFiniteMagnitude
                self.layer.add(pulseAnimation, forKey: "animateOpacity")
            }
        }
        // MARK: - Add Activity Indicator....
        fileprivate func addActivityView(_ yPosition: CGFloat) {
            activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityView.frame = CGRect(x: (frame.width/2) - 20, y: yPosition - 10, width: 35, height: 35)
            activityView.color = activityColor
            activityView.startAnimating()
        }
        // MARK: - Add Lable for Message....
        fileprivate func addTextLabel(_ yPosition: CGFloat, text: String) {
            textLabel = UILabel(frame: CGRect(x: 5, y: Int(yPosition - 10), width: activityWidth - 10, height: 40))
            textLabel.textColor = activityTextColor
            textLabel.font = activityFontName
            textLabel.adjustsFontSizeToFitWidth = true
            textLabel.minimumScaleFactor = 0.50
            textLabel.textAlignment = NSTextAlignment.center
            textLabel.text = text
        }
        fileprivate func showLoadingActivity() {
            addSubview(activityView)
            addSubview(textLabel)
            guard loadOverApplicationWindow else {
                topMostViewController!.view.addSubview(self)
                return
            }
            UIApplication.shared.windows.first?.addSubview(self)
        }
        fileprivate var fadeOutValue: CGFloat = 5.0
        fileprivate func hideActivity() {
            checkBackgoundWasClear()
            guard showFadeOutAnimation else {
                clearView()
                return
            }
            fadeOutAnimation()
        }
        fileprivate func fadeOutAnimation() {
            DispatchQueue.main.async {
                UIView.transition(with: self, duration: 0.20, options: .curveEaseInOut, animations: {
                    self.transform = CGAffineTransform(scaleX: self.fadeOutValue, y: self.fadeOutValue)
                    self.alpha = 0.1
                }, completion: { (_) in
                    self.clearView()
                })
            }
        }
        fileprivate func checkBackgoundWasClear() {
            guard activityBackgroundColor != .clear else {
                fadeOutValue = 2
                return
            }
            textLabel.alpha = 0
            activityView.alpha = 0
        }
        fileprivate func clearView() {
            activityView.stopAnimating()
            self.removeFromSuperview()
            instance = nil
            hidingInProgress = false
            if backgroundView != nil {
                UIView.animate(withDuration: 0.1, animations: {
                    backgroundView.backgroundColor = backgroundView.backgroundColor?.withAlphaComponent(0)
                }, completion: { _ in
                    backgroundView.removeFromSuperview()
                })
            }
            guard disableUIIntraction else {
                return
            }
            disableUIIntraction = false
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}

fileprivate extension UIView {
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func addBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 222/255.0, green: 225/255.0, blue: 227/255.0, alpha: 1.0).cgColor
    }
}

fileprivate extension CMProgressLoader {
    func startLoadingActivity(_ text: String, with disableUI: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            guard CMProgressLoader.instance == nil else {
                print("\n ==============================* ANLoader *=====================================")
                print("Error: Loadering already active now, please stop that before creating a new one.")
                return
            }
            guard topMostViewController != nil else {
                print("\n ==============================* ANLoader *=====================================")
                print("You may be calling in viewDidLoad or try inside main thread")
                return
            }
            // Separate creation from showing
            CMProgressLoader.instance = LoadingResource(text: text, disableUI: disableUI)
            DispatchQueue.main.async {
                if CMProgressLoader.viewBackgroundDark {
                    if CMProgressLoader.backgroundView == nil {
                        CMProgressLoader.backgroundView = UIView(frame: UIApplication.shared.keyWindow!.frame)
                    }
                    CMProgressLoader.backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0)
                    topMostViewController?.view.addSubview(CMProgressLoader.backgroundView)
                    UIView.animate(withDuration: 0.2, animations: {
                        let color  =  CMProgressLoader.backgroundView.backgroundColor?.withAlphaComponent(0.5)
                        CMProgressLoader.backgroundView.backgroundColor = color
                    })
                }
                CMProgressLoader.instance?.showLoadingActivity()
            }
        }
    }
}

fileprivate extension UIScreen {
    static var screenWidth: CGFloat = {
        if UIInterfaceOrientation.portrait.isPortrait {
            return UIScreen.main.bounds.size.width
        } else {
            return UIScreen.main.bounds.size.height
        }
    }()
    static var screenHeight: CGFloat = {
        if UIInterfaceOrientation.portrait.isPortrait {
            return UIScreen.main.bounds.size.height
        } else {
            return UIScreen.main.bounds.size.width
        }
    }()
}
public var topMostViewController: UIViewController? {
    var presentedVC = UIApplication.shared.keyWindow?.rootViewController
    while let controller = presentedVC?.presentedViewController {
        presentedVC = controller
    }
    return presentedVC
}
