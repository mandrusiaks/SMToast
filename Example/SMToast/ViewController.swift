//
//  ViewController.swift
//  SMToast
//
//  Created by mandrusiaks on 03/01/2017.
//  Copyright (c) 2017 mandrusiaks. All rights reserved.
//

import UIKit
import SMToast

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let toast = SMToast(title: "Test",
                            message: "Test Toast",
                            toastColor: .green,
                            fontColor: .white,
                            duration: 2,
                            fadeDuration: 0.5)
        toast.make()

        SMToast(title: "Another toast", message: "Sometimes you need to present multiple toasts when debugging code.").make()
        SMToast(title: "Network Calls", message: "SMToasts are great for dispalying errors returned from network calls.", toastColor: .red).make()
        SMToast(title: "Random", message: "Just another toast to show the stacking capability of SMToast", toastColor: .blue, duration: 1).make()

    }
}
