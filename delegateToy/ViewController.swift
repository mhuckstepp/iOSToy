//
//  ViewController.swift
//  delegateToy
//
//  Created by Maxim Huckstepp on 3/17/23.
//

import UIKit

class FirstViewController: UIViewController, GridViewDelegate {
    func mainButtonTapped() {
        print("Delegated!!!!")
    }

    lazy var gridView: GridView = GridView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gridView)
        gridView.backgroundColor = .blue
        gridView.delegate = self
        NSLayoutConstraint.activate([
            gridView.topAnchor.constraint(equalTo: view.topAnchor),
            gridView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            gridView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gridView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
//        mainButton1.isEnabled = true
        // Do any additional setup after loading the view.
    }


}

