//
//  GridView.swift
//  delegateToy
//
//  Created by Maxim Huckstepp on 3/17/23.
//

import UIKit

protocol GridViewDelegate: AnyObject {
    func mainButtonTapped()
}

class GridView: UIView {
    let mainBackgroundColor: UIColor

    init(mainBackgroundColor: UIColor) {
        self.mainBackgroundColor = mainBackgroundColor
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainButton1)
        NSLayoutConstraint.activate([
            mainButton1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var mainButton1: UIButton = {
        let mainButton1 = UIButton()
        mainButton1.setTitle("some button", for: .normal)
        mainButton1.setTitle("Disabled button", for: .disabled)
        mainButton1.backgroundColor = mainBackgroundColor
        mainButton1.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        mainButton1.translatesAutoresizingMaskIntoConstraints = false
        return mainButton1
    }()

    @objc
    func buttonClicked() {
        print("button clicked")
        delegate?.mainButtonTapped()
    }

    weak var delegate: GridViewDelegate?

}
