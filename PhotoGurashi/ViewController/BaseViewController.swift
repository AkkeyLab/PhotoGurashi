//
//  ViewController.swift
//  PhotoGurashi
//
//  Created by 板谷晃良 on 2015/08/22.
//  Copyright (c) 2015年 AkkeyLab. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    fileprivate var topImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setBKImage()
    }

    func setBKImage() {
        var topImage: UIImage = UIImage(named: "top_default")!

        if timeBoolean(0, goalTime: 4) {
            topImage = UIImage(named: "top_darkness")!
        }

        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        topImageView.image = topImage
        topImageView.layer.position = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
        self.view.addSubview(topImageView)
    }

    func timeBoolean(_ startTime: UInt8, goalTime: UInt8) -> Bool {
        //Get the current date and time
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        //yyyy/MM/dd HH:mm:ss -> 2014/06/25 02:13:18
        dateFormatter.dateFormat = "HH"

        for i in startTime...goalTime {
            //Convert "int(Uint8)" of the acquired "String" and two number format.
            if dateFormatter.string(from: now) == (NSString(format: "%02d", i) as String) {
                return true
            }
        }
        return false
    }

    override func onClickButton(_ sender: UIButton) {
        let controller = CameraViewController()
        controller.view.backgroundColor = UIColor.white
        self.present(controller, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

