//
//  SMToast.swift
//  SMToast
//
//  Created by Spencer Mandrusiak on 2017-02-27.
//  Copyright © 2017 Spencer Mandrusiak. All rights reserved.
//

import UIKit


public class SMToast: UIView {

    //MARK: - Configuration Variables
    fileprivate let cornerRadius: CGFloat = 15
    fileprivate var title: String = ""
    fileprivate var message: String = ""
    fileprivate var toastColor: UIColor = .black
    fileprivate var fontColor: UIColor = .white
    fileprivate var duration: TimeInterval = 2
    fileprivate var fadeDuration: TimeInterval = 1

    //MARK: - View Components
    fileprivate var view: UIView!
    fileprivate var titleLabel: UILabel!
    fileprivate var messageLabel: UILabel!

    //MARK: - Initialization
    required public init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    public init(title: String = "", message: String = "", toastColor: UIColor = .black,
                fontColor: UIColor = .white, duration: TimeInterval = 3.0, fadeDuration: TimeInterval = 1.0) {
        self.title = title
        self.message = message
        self.toastColor = toastColor
        self.fontColor = fontColor
        self.duration = duration
        self.fadeDuration = fadeDuration
        let frame = CGRect(x: 0, y: UIScreen.main.bounds.height*0.8, width: 0, height: 0)
        super.init(frame: frame)
        initialSetup()
    }
    convenience init(message: String) {
        self.init(title: .defaultString, message: message, toastColor: .defaultToastColor,
                  fontColor: .defaultFontColor, duration: .defaultDuration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(message: String, duration: TimeInterval) {
        self.init(title: .defaultString, message: message, toastColor: .defaultToastColor,
                  fontColor: .defaultFontColor, duration: duration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(message: String, toastColor: UIColor) {
        self.init(title: .defaultString, message: message, toastColor: toastColor,
                  fontColor: .defaultFontColor, duration: .defaultDuration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(message: String, toastColor: UIColor, fontColor: UIColor) {
        self.init(title: .defaultString, message: message, toastColor: toastColor,
                  fontColor: fontColor, duration: .defaultDuration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(message: String, toastColor: UIColor, duration: TimeInterval) {
        self.init(title: .defaultString, message: message, toastColor: toastColor,
                  fontColor: .defaultFontColor, duration: duration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(message: String, toastColor: UIColor, fontColor: UIColor, duration: TimeInterval) {
        self.init(title: .defaultString, message: message, toastColor: toastColor,
                  fontColor: fontColor, duration: duration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String) {
        self.init(title: title, message: .defaultString, toastColor: .defaultToastColor,
                  fontColor: .defaultFontColor, duration: .defaultDuration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, duration: TimeInterval) {
        self.init(title: title, message: .defaultString, toastColor: .defaultToastColor,
                  fontColor: .defaultFontColor, duration: duration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, toastColor: UIColor) {
        self.init(title: title, message: .defaultString, toastColor: toastColor,
                  fontColor: .defaultFontColor, duration: .defaultDuration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, toastColor: UIColor, fontColor: UIColor) {
        self.init(title: title, message: .defaultString, toastColor: toastColor,
                  fontColor: fontColor, duration: .defaultDuration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, toastColor: UIColor, duration: TimeInterval) {
        self.init(title: title, message: .defaultString, toastColor: toastColor,
                  fontColor: .defaultFontColor, duration: duration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, toastColor: UIColor, fontColor: UIColor, duration: TimeInterval) {
        self.init(title: title, message: .defaultString, toastColor: toastColor,
                  fontColor: fontColor, duration: duration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, message: String) {
        self.init(title: title, message: message, toastColor: .defaultToastColor,
                  fontColor: .defaultFontColor, duration: .defaultDuration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, message: String, toastColor: UIColor) {
        self.init(title: title, message: message, toastColor: toastColor,
                  fontColor: .defaultFontColor, duration: .defaultDuration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, message: String, duration: TimeInterval) {
        self.init(title: title, message: message, toastColor: .defaultToastColor,
                  fontColor: .defaultFontColor, duration: duration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, message: String, toastColor: UIColor, duration: TimeInterval) {
        self.init(title: title, message: message, toastColor: toastColor,
                  fontColor: .defaultFontColor, duration: duration, fadeDuration: .defaultFadeDuration)
    }
    convenience init(title: String, message: String, toastColor: UIColor,
                            fontColor: UIColor, duration: TimeInterval) {
        self.init(title: title, message: message, toastColor: toastColor,
                  fontColor: fontColor, duration: duration, fadeDuration: .defaultFadeDuration)
    }

    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        let (width, height) = sizeComponents()
        view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        return CGSize(width: width, height: height)
    }
}

//MARK: - Setup
extension SMToast {
    fileprivate func initialSetup() {
        setup()
        formatTitleLabel()
        formatMessageLabel()
        addSubview(titleLabel!)
        addSubview(messageLabel!)
        sizeToFit()
        adjustPosition()
    }
    private func setup() {
        alpha = 0.0
        backgroundColor = .clear
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.66

        view = UIView()
        view.alpha = 0.8
        view.backgroundColor = toastColor
        view.layer.cornerRadius = cornerRadius
        addSubview(view)
    }
    private func formatTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightSemibold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = fontColor
        titleLabel.numberOfLines = 2
        titleLabel.text = title
        titleLabel.sizeToFit()
    }
    private func formatMessageLabel() {
        let frame = CGRect(x: 0, y: titleLabel!.frame.height, width: 0, height: 0)
        messageLabel = UILabel(frame: frame)
        messageLabel.font = UIFont.systemFont(ofSize: 13, weight: UIFontWeightLight)
        messageLabel.textAlignment = .center
        messageLabel.textColor = fontColor
        messageLabel.numberOfLines = 4
        messageLabel.text = message
        messageLabel.sizeToFit()
    }
    private func adjustPosition() {
        titleLabel.center.x = bounds.midX
        titleLabel.frame.origin.y += 8
        messageLabel.center.x = bounds.midX
        messageLabel.frame.origin.y += 8
    }
}

//MARK: - Make
public extension SMToast {
    func make() {
        guard let topView = UIApplication.topViewController()?.view else { return }
        if title == "" && message == "" { return }
        center.x = topView.center.x
        present()
    }
}

//MARK: - Animation
extension SMToast {
    fileprivate func present() {
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: fadeDuration, animations: {
            self.alpha = 0.75
        }) { _ in
            UIView.animate(withDuration: self.fadeDuration, delay: self.duration, options: [], animations: {
                self.alpha = 0.0
            }, completion: { _ in
                self.removeFromSuperview()
            })
        }
    }
}

//MARK: - Additional
extension SMToast {
    fileprivate func sizeComponents() -> (CGFloat, CGFloat) {
        let titleWidth = titleLabel.frame.width
        let messageWidth = messageLabel.frame.width
        let maxLabelWidth = messageWidth > titleWidth ? messageWidth : titleWidth
        let maxWidth = UIScreen.main.bounds.width*0.66
        var totalLabelHeight = titleLabel.frame.height + messageLabel.frame.height

        var width: CGFloat
        var height: CGFloat
        if maxLabelWidth < maxWidth {
            width = maxLabelWidth
            height = totalLabelHeight
        }else {
            titleLabel.frame.size.width = maxWidth
            titleLabel.sizeToFit()
            let frame = CGRect(x: 0, y: titleLabel.frame.height, width: maxWidth, height: 0)
            messageLabel.frame = frame
            messageLabel.sizeToFit()
            totalLabelHeight = titleLabel.frame.height + messageLabel.frame.height
            width = maxWidth
            height = totalLabelHeight
        }
        return (width+32, height+16)
    }
}





/**************************
        Extensions
 **************************/


//MARK: - UIApplication
extension UIApplication {
    class func topViewController(_ controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let tabBarController = controller as? UITabBarController {
            if let selectedVC = tabBarController.selectedViewController {
                return topViewController(selectedVC)
            }
        }
        if let navController = controller as? UINavigationController {
            if let navRootVC = navController.visibleViewController {
                return topViewController(navRootVC)
            }
        }
        if let presentedVC = controller?.presentedViewController {
            return topViewController(presentedVC)
        }
        return controller
    }
}



/****************************
        Default Values
 ****************************/

//MARK: - String
extension String {
    static let defaultString = ""
}

//MARK: - UIColor 
extension UIColor {
    static let defaultToastColor: UIColor = .black
    static let defaultFontColor: UIColor = .white
}

//MARK: - TimeInterval
extension TimeInterval {
    static let defaultDuration = 3.0
    static let defaultFadeDuration = 1.0
}
