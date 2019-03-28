//
//  CustomButton.swift
//  PhotoGurashi
//
//  Created by AKIO on 2017/04/07.
//  Copyright © 2017 AkkeyLab. All rights reserved.
//

import UIKit

extension UIButton {
    func customSetting(_ vc: UIViewController, title: String) {
        frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        backgroundColor = randomColor()
        layer.masksToBounds = true
        titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        setTitleColor(UIColor.white, for: UIControl.State())
        layer.cornerRadius = 40.0
        setTitle(title, for: UIControl.State())

        addTarget(vc, action: #selector(vc.onClickButton(_:)), for: .touchUpInside)
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
    @objc func onClickButton(_ sender: UIButton) { }
} 
