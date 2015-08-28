//
//  FrontCameraViewController.swift
//  PhotoGurashi
//
//  Created by 板谷晃良 on 2015/08/29.
//  Copyright (c) 2015年 AkkeyLab. All rights reserved.
//

import UIKit
import AVFoundation

class FrontCameraViewController: CommonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func changeSetting(){
        //Lets exit
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func cameraSetting(){
        
        mySession = AVCaptureSession()
        
        let devices = AVCaptureDevice.devices()//Add all devices
        for device in devices{//Select back camera
            if(device.position == AVCaptureDevicePosition.Front){
                myDevice = device as! AVCaptureDevice
            }
        }
        
        let videoInput = AVCaptureDeviceInput.deviceInputWithDevice(myDevice, error: nil) as! AVCaptureDeviceInput
        mySession.addInput(videoInput)
        
        myImageOutput = AVCaptureStillImageOutput()
        mySession.addOutput(myImageOutput)
        
        let myVideoLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.layerWithSession(mySession) as! AVCaptureVideoPreviewLayer
        myVideoLayer.frame = self.view.bounds
        myVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        //Add View
        self.view.layer.addSublayer(myVideoLayer)
        
        mySession.startRunning()
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
