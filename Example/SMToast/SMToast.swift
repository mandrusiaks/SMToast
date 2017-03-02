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

    //MARK: - View Components
    var view: UIView!
    var titleLabel: UILabel!
    var messageLabel: UILabel!

    //MARK: - Initialization
    required public init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    public init(title: String, message: String, toastColor: UIColor, fontColor: UIColor) {
        let frame = CGRect(x: 0, y: UIScreen.main.bounds.height*0.8, width: 0, height: 0)
        super.init(frame: frame)
        initialSetup(title: title, message: message, toastColor: toastColor, fontColor: fontColor)
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
    fileprivate func initialSetup(title: String, message: String, toastColor: UIColor, fontColor: UIColor) {
        setup(toastColor)
        formatTitleLabel(title, fontColor: fontColor)
        formatMessageLabel(message, fontColor: fontColor)
        addSubview(titleLabel!)
        addSubview(messageLabel!)
        sizeToFit()
        adjustPosition()
    }
    private func setup(_ toastColor: UIColor) {
        alpha = 0.0
        backgroundColor = .clear
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.66

        view = UIView()
        view.alpha = 0.8
        view.backgroundColor = toastColor
        view.layer.cornerRadius = cornerRadius
        addSubview(view)
    }
    private func formatTitleLabel(_ title: String, fontColor: UIColor) {
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightSemibold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = fontColor
        titleLabel.numberOfLines = 2
        titleLabel.text = title
        titleLabel.sizeToFit()
    }
    private func formatMessageLabel(_ message: String, fontColor: UIColor) {
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
extension SMToast {
    class func make(title: String = "", message: String = "", toastColor: UIColor = .black, fontColor: UIColor = .white) {
        guard let topView = UIApplication.topViewController()?.view else { return }
        if title == "" && message == "" { return }
        let toast = SMToast(title: title, message: message, toastColor: toastColor, fontColor: fontColor)
        toast.center.x = topView.center.x
        present(toast: toast)
    }
}

//MARK: - Animation
extension SMToast {
    fileprivate class func present(toast: SMToast) {
        UIApplication.shared.keyWindow?.addSubview(toast)
        UIView.animate(withDuration: 1, animations: {
            toast.alpha = 0.75
        }) { _ in
            UIView.animate(withDuration: 1, delay: 2, options: [], animations: {
                toast.alpha = 0.0
            }, completion: { _ in
                toast.removeFromSuperview()
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





/*=========================
        Extensions
 =========================*/


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
