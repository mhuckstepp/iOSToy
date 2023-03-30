//
//  CustomColorViewController.swift
//  delegateToy
//
//  Created by Caleb Rudnicki on 3/30/23.
//

import UIKit

class CustomColorViewController: UIViewController {
    let colorProvider: ColorProviding
    init(colorProvider: ColorProviding) {
        self.colorProvider = colorProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorProvider.color
    }
}
