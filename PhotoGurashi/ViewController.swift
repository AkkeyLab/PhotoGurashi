//
//  ViewController.swift
//  PhotoGurashi
//
//  Created by 板谷晃良 on 2015/08/22.
//  Copyright (c) 2015年 AkkeyLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var topImageView: UIImageView!
    let yukiButton:   UIButton = UIButton()
    let kurumiButton: UIButton = UIButton()
    let yuuriButton:  UIButton = UIButton()
    let mikiButton:   UIButton = UIButton()
    var topImage:     UIImage  = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the current date and time
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        //yyyy/MM/dd HH:mm:ss -> 2014/06/25 02:13:18
        dateFormatter.dateFormat = "HH"
        if(dateFormatter.stringFromDate(now) == "00"){
            topImage = UIImage(named: "topImage_darkness.jpg")!
        }else{
            topImage = UIImage(named: "image/topImage.jpg")!
        }
        
        topImageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        topImageView.image = topImage
        topImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
        self.view.addSubview(topImageView)
        
        //ex) let yukiButton = UIButton(frame: CGRectMake(0,0,80,80))
        yukiButton.frame = CGRectMake(0, 0, 80, 80)//size
        yukiButton.backgroundColor = UIColor.magentaColor()
        yukiButton.layer.masksToBounds = true
        yukiButton.setTitle("由紀", forState: .Normal)
        yukiButton.titleLabel?.font = UIFont.systemFontOfSize(UIFont.buttonFontSize())
        yukiButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        yukiButton.layer.cornerRadius = 40.0//edge
        yukiButton.layer.position = CGPoint(x:  self.view.bounds.width  / 4,
                                            y: (self.view.bounds.height / 2) + (self.view.bounds.height / 4))
        yukiButton.addTarget(self, action: "onClickButton:", forControlEvents: .TouchUpInside)
        yukiButton.tag = 0
        self.view.addSubview(yukiButton)
        
        //ex) let kurumiButton = UIButton(frame: CGRectMake(0,0,80,80))
        kurumiButton.frame = CGRectMake(0, 0, 80, 80)//size
        kurumiButton.backgroundColor = UIColor.purpleColor()
        kurumiButton.layer.masksToBounds = true
        kurumiButton.setTitle("胡桃", forState: .Normal)
        kurumiButton.titleLabel?.font = UIFont.systemFontOfSize(UIFont.buttonFontSize())
        kurumiButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        kurumiButton.layer.cornerRadius = 40.0//edge
        kurumiButton.layer.position = CGPoint(x: (self.view.bounds.width  / 2) + (self.view.bounds.width  / 4),
                                              y: (self.view.bounds.height / 2) - (self.view.bounds.height / 4))
        kurumiButton.addTarget(self, action: "onClickButton:", forControlEvents: .TouchUpInside)
        kurumiButton.tag = 1
        self.view.addSubview(kurumiButton)
        
        //ex) let yuuriButton = UIButton(frame: CGRectMake(0,0,80,80))
        yuuriButton.frame = CGRectMake(0, 0, 80, 80)//size
        yuuriButton.backgroundColor = UIColor.redColor()
        yuuriButton.layer.masksToBounds = true
        yuuriButton.setTitle("悠里", forState: .Normal)
        yuuriButton.titleLabel?.font = UIFont.systemFontOfSize(UIFont.buttonFontSize())
        yuuriButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        yuuriButton.layer.cornerRadius = 40.0//edge
        yuuriButton.layer.position = CGPoint(x:  self.view.bounds.width  / 7,
                                             y: (self.view.bounds.height / 2) - (self.view.bounds.height / 6))
        yuuriButton.addTarget(self, action: "onClickButton:", forControlEvents: .TouchUpInside)
        yuuriButton.tag = 2
        self.view.addSubview(yuuriButton)
        
        //ex) let mikiButton = UIButton(frame: CGRectMake(0,0,80,80))
        mikiButton.frame = CGRectMake(0, 0, 80, 80)//size
        mikiButton.backgroundColor = UIColor.orangeColor()
        mikiButton.layer.masksToBounds = true
        mikiButton.setTitle("美紀", forState: .Normal)
        mikiButton.titleLabel?.font = UIFont.systemFontOfSize(UIFont.buttonFontSize())
        mikiButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        mikiButton.layer.cornerRadius = 40.0//edge
        mikiButton.layer.position = CGPoint(x: (self.view.bounds.width  / 2) + (self.view.bounds.width  / 4),
                                            y: (self.view.bounds.height / 2) + (self.view.bounds.height / 4))
        mikiButton.addTarget(self, action: "onClickButton:", forControlEvents: .TouchUpInside)
        mikiButton.tag = 3
        self.view.addSubview(mikiButton)
    }
    
    //Button event
    func onClickButton(sender: UIButton!){
        switch sender.tag{
        case 0:
            //Lets Yuki mode
            let controller = YukiViewController()
            controller.view.backgroundColor = UIColor.whiteColor()
            self.presentViewController(controller, animated: true, completion: nil)
        case 1:
            //Lets Kurumi mode
            let controller = KurumiViewController()
            controller.view.backgroundColor = UIColor.whiteColor()
            self.presentViewController(controller, animated: true, completion: nil)
        case 2:
            //Lets Yuuri mode
            let controller = YuuriViewController()
            controller.view.backgroundColor = UIColor.whiteColor()
            self.presentViewController(controller, animated: true, completion: nil)
        case 3:
            //Lets miki mode
            let controller = MikiViewController()
            controller.view.backgroundColor = UIColor.whiteColor()
            self.presentViewController(controller, animated: true, completion: nil)
        default:
            print("ERROR")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

