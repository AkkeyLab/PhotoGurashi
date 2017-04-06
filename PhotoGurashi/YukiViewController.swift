//
//  YukiViewController.swift
//  PhotoGurashi
//
//  Created by 板谷晃良 on 2015/08/23.
//  Copyright (c) 2015年 AkkeyLab. All rights reserved.
//

import UIKit

class YukiViewController: CommonViewController {

    //Initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        changeImage(UIImage(named: "image/yuki.png")!)
    }

    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nil, bundle: nil)
        changeImage(UIImage(named: "image/yuki.png")!)
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    //END

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
