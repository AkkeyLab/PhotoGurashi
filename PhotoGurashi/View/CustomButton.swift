//
//  CustomButton.swift
//  PhotoGurashi
//
//  Created by AKIO on 2017/04/07.
//  Copyright © 2017 AkkeyLab. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        backgroundColor = randomColor()
        layer.masksToBounds = true
        titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        setTitleColor(UIColor.white, for: UIControlState())
        layer.cornerRadius = 40.0
    }

    func customAddTarget(vc: UIViewController) {
        addTarget(vc, action: #selector(vc.onClickButton(_:)), for: .touchUpInside)
    }

    func customSetTitle(title: String) {
        setTitle(title, for: UIControlState())
    }

    func randomColor() -> UIColor {
        switch arc4random_uniform(5) {
        case 0: return .magenta
        case 1: return .purple
        case 2: return .red
        case 3: return .orange
        case 4: return .yellow
        default: return .clear
        }
    }
}

extension UIViewController {
    func onClickButton(_ sender: UIButton) { }
}
