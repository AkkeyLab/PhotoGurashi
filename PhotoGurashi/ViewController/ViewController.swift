//
//  ViewController.swift
//  PhotoGurashi
//
//  Created by 板谷晃良 on 2015/08/22.
//  Copyright (c) 2015年 AkkeyLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var topImageView: UIImageView!
    let yukiButton: UIButton = UIButton()
    let kurumiButton: UIButton = UIButton()
    let yuuriButton: UIButton = UIButton()
    let mikiButton: UIButton = UIButton()
    let meguneeButton: UIButton = UIButton()
    var topImage: UIImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Change top image
        if(timeBoolean(0, goalTime: 4)) {
            topImage = UIImage(named: "top_default")!
        } else {
            topImage = UIImage(named: "top_darkness")!
        }

        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        topImageView.image = topImage
        topImageView.layer.position = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
        self.view.addSubview(topImageView)

        //ex) let yukiButton = UIButton(frame: CGRectMake(0,0,80,80))
        yukiButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)//size
        yukiButton.backgroundColor = UIColor.magenta
        yukiButton.layer.masksToBounds = true
        yukiButton.setTitle("由紀", for: UIControlState())
        yukiButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        yukiButton.setTitleColor(UIColor.white, for: UIControlState())
        yukiButton.layer.cornerRadius = 40.0//edge
        yukiButton.layer.position = CGPoint(x: self.view.bounds.width / 4,
                                            y: (self.view.bounds.height / 2) + (self.view.bounds.height / 4))
        yukiButton.addTarget(self, action: #selector(ViewController.onClickButton(_:)), for: .touchUpInside)
        yukiButton.tag = 0
        self.view.addSubview(yukiButton)

        //ex) let kurumiButton = UIButton(frame: CGRectMake(0,0,80,80))
        kurumiButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)//size
        kurumiButton.backgroundColor = UIColor.purple
        kurumiButton.layer.masksToBounds = true
        kurumiButton.setTitle("胡桃", for: UIControlState())
        kurumiButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        kurumiButton.setTitleColor(UIColor.white, for: UIControlState())
        kurumiButton.layer.cornerRadius = 40.0//edge
        kurumiButton.layer.position = CGPoint(x: (self.view.bounds.width / 2) + (self.view.bounds.width / 4),
                                              y: (self.view.bounds.height / 2) - (self.view.bounds.height / 4))
        kurumiButton.addTarget(self, action: #selector(ViewController.onClickButton(_:)), for: .touchUpInside)
        kurumiButton.tag = 1
        self.view.addSubview(kurumiButton)

        //ex) let yuuriButton = UIButton(frame: CGRectMake(0,0,80,80))
        yuuriButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)//size
        yuuriButton.backgroundColor = UIColor.red
        yuuriButton.layer.masksToBounds = true
        yuuriButton.setTitle("悠里", for: UIControlState())
        yuuriButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        yuuriButton.setTitleColor(UIColor.white, for: UIControlState())
        yuuriButton.layer.cornerRadius = 40.0//edge
        yuuriButton.layer.position = CGPoint(x: self.view.bounds.width / 7,
                                             y: (self.view.bounds.height / 2) - (self.view.bounds.height / 6))
        yuuriButton.addTarget(self, action: #selector(ViewController.onClickButton(_:)), for: .touchUpInside)
        yuuriButton.tag = 2
        self.view.addSubview(yuuriButton)

        //ex) let mikiButton = UIButton(frame: CGRectMake(0,0,80,80))
        mikiButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)//size
        mikiButton.backgroundColor = UIColor.orange
        mikiButton.layer.masksToBounds = true
        mikiButton.setTitle("美紀", for: UIControlState())
        mikiButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        mikiButton.setTitleColor(UIColor.white, for: UIControlState())
        mikiButton.layer.cornerRadius = 40.0//edge
        mikiButton.layer.position = CGPoint(x: (self.view.bounds.width / 2) + (self.view.bounds.width / 4),
                                            y: (self.view.bounds.height / 2) + (self.view.bounds.height / 4))
        mikiButton.addTarget(self, action: #selector(ViewController.onClickButton(_:)), for: .touchUpInside)
        mikiButton.tag = 3
        self.view.addSubview(mikiButton)

        //ex) let meguneeButton = UIButton(frame: CGRectMake(0,0,80,80))
        meguneeButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)//size
        meguneeButton.backgroundColor = UIColor.yellow
        meguneeButton.layer.masksToBounds = true
        meguneeButton.setTitle("佐倉", for: UIControlState())
        meguneeButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        meguneeButton.setTitleColor(UIColor.magenta, for: UIControlState())
        meguneeButton.layer.cornerRadius = 40.0//edge
        meguneeButton.layer.position = CGPoint(x: (self.view.bounds.width / 2),
                                               y: (self.view.bounds.height / 2) + (self.view.bounds.height / 9))
        meguneeButton.addTarget(self, action: #selector(ViewController.onClickButton(_:)), for: .touchUpInside)
        meguneeButton.tag = 4
        self.view.addSubview(meguneeButton)
    }

    //Button event
    func onClickButton(_ sender: UIButton!) {
        switch sender.tag {
        case 0:
            //Lets Yuki mode
            let controller = YukiViewController()
            controller.view.backgroundColor = UIColor.white
            self.present(controller, animated: true, completion: nil)
        case 1:
            //Lets Kurumi mode
            let controller = KurumiViewController()
            controller.view.backgroundColor = UIColor.white
            self.present(controller, animated: true, completion: nil)
        case 2:
            //Lets Yuuri mode
            let controller = YuuriViewController()
            controller.view.backgroundColor = UIColor.white
            self.present(controller, animated: true, completion: nil)
        case 3:
            //Lets miki mode
            let controller = MikiViewController()
            controller.view.backgroundColor = UIColor.white
            self.present(controller, animated: true, completion: nil)
        case 4:
            //Lets megunee mode
            let controller = MeguneeViewController()
            controller.view.backgroundColor = UIColor.white
            self.present(controller, animated: true, completion: nil)
        default:
            print("ERROR", terminator: "")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Time event
    func timeBoolean(_ startTime: UInt8, goalTime: UInt8) -> (Bool) {

        var result: Bool = false

        //Get the current date and time
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        //yyyy/MM/dd HH:mm:ss -> 2014/06/25 02:13:18
        dateFormatter.dateFormat = "HH"

        for i in startTime...goalTime {
            //Convert "int(Uint8)" of the acquired "String" and two number format.
            if(dateFormatter.string(from: now) == NSString(format: "%02d", i) as String) {
                result = true
            }
        }
        return result
    }
}

