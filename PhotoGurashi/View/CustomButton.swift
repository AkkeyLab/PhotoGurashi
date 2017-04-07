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

        self.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        self.layer.masksToBounds = true
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        self.layer.cornerRadius = 40.0
    }

}
