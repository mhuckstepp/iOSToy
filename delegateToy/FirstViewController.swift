//
//  FirstViewController.swift
//  delegateToy
//
//  Created by Maxim Huckstepp on 3/17/23.
//

import UIKit
import Swinject

protocol ColorProviding {
    var color: UIColor { get }
}

class ColorProvider: ColorProviding {
    var color: UIColor = .red
}

class FirstViewController: UIViewController, GridViewDelegate {

    let container: Container = {
        let container = Container()
        container.register(ColorProviding.self) { _ in
            return ColorProvider()
        }
        container.register(CustomColorViewController.self) { resolver in
            return CustomColorViewController(colorProvider: resolver.resolve(ColorProviding.self)!)
        }
        return container
    }()

    func mainButtonTapped() {
        print("Delegated!!!!")
//        let vc = CustomColorViewController(colorProvider: ColorProvider())
        guard let vc = container.resolve(CustomColorViewController.self) else { return }
        present(vc, animated: true)
    }

    lazy var gridView: GridView = GridView(mainBackgroundColor: .green)

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

