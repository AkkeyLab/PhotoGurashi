//
//  MainViewController.swift
//  PhotoGurashi
//
//  Created by AKIO on 2017/04/23.
//  Copyright © 2017 AkkeyLab. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        setBKImage(backImageView)

        button1.customSetting(self, title: "Button1")
        button1.tag = 1
        button2.customSetting(self, title: "Button2")
        button2.tag = 2
        button3.customSetting(self, title: "Button3")
        button3.tag = 3
    }

    override func onClickButton(_ sender: UIButton) {
        let name: String

        switch sender.tag {
        case 1:
            name = "01"
        case 2:
            name = "02"
        case 3:
            name = "03"
        default:
            name = "04"
        }
        let vc = CameraViewController()
        vc.view.backgroundColor = UIColor.white
        vc.setCharaImage(name)
        self.present(vc, animated: true, completion: nil)
    }
}
