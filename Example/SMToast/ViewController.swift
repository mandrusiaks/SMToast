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
        SMToast.make(title: "Hello", message: "This is a test toast", toastColor: .blue, fontColor: .white)
    }
}
