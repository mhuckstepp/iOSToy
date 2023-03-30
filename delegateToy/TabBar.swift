//
//  TabBar.swift
//  delegateToy
//
//  Created by Maxim Huckstepp on 3/21/23.
//

import UIKit

class ToyTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }

    func setupViewControllers() {
        viewControllers = [
            FirstViewController(),
            FirstViewController()
        ]
    }
}
