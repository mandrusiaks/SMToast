//
//  SMToast.swift
//  SMToast
//
//  Created by Spencer Mandrusiak on 2017-02-27.
//  Copyright © 2017 Spencer Mandrusiak. All rights reserved.
//

import UIKit


public class SMToast: UIView {

    //MARK: - Queue
    fileprivate static var activeQueue = SMQueue()
    fileprivate static var onHoldQueue = SMQueue()

    //MARK: - Configuration Variables
    fileprivate let cornerRadius: CGFloat = 15
    let id: TimeInterval = Date().timeIntervalSince1970
    var title: String = ""
    var message: String = ""
    var toastColor: UIColor = .black
    var fontColor: UIColor = .white
    var duration: TimeInterval = 2
    var fadeDuration: TimeInterval = 1

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
        isUserInteractionEnabled = true

        view = UIView()
        view.alpha = 0.8
        view.backgroundColor = toastColor
        view.layer.cornerRadius = cornerRadius
        view.isUserInteractionEnabled = true
        addSubview(view)
    }
    private func formatTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightSemibold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = fontColor
        titleLabel.numberOfLines = 2
        titleLabel.text = title
        titleLabel.isUserInteractionEnabled = true
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
        messageLabel.isUserInteractionEnabled = true
        messageLabel.sizeToFit()
    }
    private func adjustPosition() {
        titleLabel.center.x = bounds.midX
        titleLabel.frame.origin.y += 8
        messageLabel.center.x = bounds.midX
        messageLabel.frame.origin.y += 8
    }
}

//MARK: -
extension SMToast {
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.06, y: 1.06)
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let topView = UIApplication.topViewController()?.view,
              let touchCenter = touches.first?.location(in: topView)
        else { return }
        center = touchCenter
    }
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1, y: 1)
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
    fileprivate func present(fromHold: Bool = false) {
        if fromHold || shouldShowToast() {
            SMToast.activeQueue.add(toast: self)
            UIApplication.shared.keyWindow?.addSubview(self)
            UIView.animateKeyframes(withDuration: self.fadeDuration, delay: 0, options: .allowUserInteraction, animations: {
                self.alpha = 0.75
            }, completion: { (_) in
                self.fadeOut()
            })
        }else {
            SMToast.onHoldQueue.add(toast: self)
        }
    }

    private func fadeOut() {
        UIView.animate(withDuration: fadeDuration, delay: duration, options: .allowUserInteraction, animations: {
            //Threshold to ensure user interaction still enabled
            self.alpha = 0.02
        }, completion: { (_) in
            self.finish()
        })
    }

    private func finish() {
        //Fade out rest of view smoothly
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }, completion: { (_) in
            self.removeFromSuperview()
            SMToast.activeQueue.remove(toast: self)
            self.checkHold()
        })
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
    fileprivate func checkHold() {
        guard let toast = SMToast.onHoldQueue.first else { return }
        print(toast)
        toast.center = self.center
        present(fromHold: true)
        SMToast.onHoldQueue.remove(toast: toast)
    }
    fileprivate func shouldShowToast() -> Bool {
        guard let lastToast = SMToast.activeQueue.last else { return true }
        var newY = (lastToast.frame.minY-8)-(frame.height/2.0)
        guard newY - (frame.height/2) > 0 else {
            print("cannot place on screen")
            return false
        }
        center.y = newY
        return true
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
