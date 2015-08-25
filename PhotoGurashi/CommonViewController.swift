//
//  CommonViewController.swift
//  PhotoGurashi
//
//  Created by 板谷晃良 on 2015/08/25.
//  Copyright (c) 2015年 AkkeyLab. All rights reserved.
//

import UIKit
import CoreImage
import AVFoundation

class CommonViewController: UIViewController {
    
    //***Field***
    var mySession:            AVCaptureSession!
    var myDevice:             AVCaptureDevice!
    var myImageOutput:        AVCaptureStillImageOutput!
    let cameraButton:         UIButton = UIButton()
    let exitButton:           UIButton = UIButton()
    var provisionalImageView: UIImageView!
    var provisionalImage:     UIImage = UIImage(named: "image/yuki.png")!
    //Take a picture
    var takeInputImage:       CIImage!
    //****END****
    
    //Initializer
    func changeImage(image: UIImage){
        self.provisionalImage = image
    }
    
    /*
    ***Session list***
    
    1->Caputure
    2->VideoInput
    3->VideoOutput
    
    4->Start
    ******************
    
    ***Add View list ***
    
    1->myVideoLayer
    2->provisionalImageView
    3->CameraButton
    ********************
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySession = AVCaptureSession()
        
        let devices = AVCaptureDevice.devices()//Add all devices
        for device in devices{//Select back camera
            if(device.position == AVCaptureDevicePosition.Back){
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
        
        //Add provisional Image
        provisionalImageView = UIImageView(frame: CGRectMake(0, 0, (self.view.bounds.width  / 2) + (self.view.bounds.width  / 4),
            (self.view.bounds.height / 2) + (self.view.bounds.height / 4)))
        //memo: Move to field
        //let provisionalImage = UIImage(named: "image/yuki.png")
        provisionalImageView.image = provisionalImage
        provisionalImageView.layer.position = CGPoint(x: (self.view.bounds.width  / 2) + (self.view.bounds.width  / 8),
            y: (self.view.bounds.height / 2) + (self.view.bounds.height / 8))
        //Add View
        self.view.addSubview(provisionalImageView)
        
        //ex) let cameraButton = UIButton(frame: CGRectMake(0,0,120,50))
        cameraButton.frame = CGRectMake(0, 0, 120, 50)//size
        cameraButton.backgroundColor = UIColor.redColor();
        cameraButton.layer.masksToBounds = true
        cameraButton.setTitle("撮影", forState: .Normal)
        cameraButton.layer.cornerRadius = 20.0
        cameraButton.layer.position = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height - 50)
        cameraButton.addTarget(self, action: "onClickButton:", forControlEvents: .TouchUpInside)
        cameraButton.tag = 0//Add button tag
        //Add View
        self.view.addSubview(cameraButton)
        
        //ex) let exitButton = UIButton(frame: CGRectMake(0,0,80,80))
        exitButton.frame = CGRectMake(0, 0, 50, 50)//size
        exitButton.backgroundColor = UIColor.cyanColor()
        exitButton.layer.masksToBounds = true
        exitButton.setTitle("戻る", forState: .Normal)
        exitButton.titleLabel?.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        exitButton.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        exitButton.layer.cornerRadius = 10.0//edge
        exitButton.layer.position = CGPoint(x: 50, y: self.view.bounds.height - 50)
        exitButton.addTarget(self, action: "onClickButton:", forControlEvents: .TouchUpInside)
        exitButton.tag = 1
        self.view.addSubview(exitButton)
    }
    
    //Button event
    func onClickButton(sender: UIButton){
        
        switch sender.tag{
        case 0:
            //Lets output image
            outputImage()
        case 1:
            //Lets exit
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            print("ERROR")
        }
        
    }
    
    func outputImage(){
        
        //It is connected to the video output
        let myVideoConnection = myImageOutput.connectionWithMediaType(AVMediaTypeVideo)
        
        //Get the image from the connection
        self.myImageOutput.captureStillImageAsynchronouslyFromConnection(myVideoConnection, completionHandler: { (imageDataBuffer, error) -> Void in
            //Convert DataBuffer of the acquired Image to Jpeg.
            let myImageData : NSData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataBuffer)
            let myImage : UIImage = UIImage(data: myImageData)!
            
            //Image synthesis (memo: Move to field)
            //let provisionalImage = UIImage(named: "image/yuki.png")
            //Main size is take image (No conversion take-image-size)
            UIGraphicsBeginImageContext(CGSizeMake(myImage.size.width, myImage.size.height))
            myImage.drawAtPoint(CGPointMake(0, 0))
            //Synthesis image
            let provisionalSizeX = (myImage.size.width  / 2) + (myImage.size.width  / 4)
            let provisionalSizeY = (myImage.size.height / 2) + (myImage.size.height / 4)
            self.provisionalImage.drawInRect(CGRectMake(myImage.size.width  - provisionalSizeX,
                                                        myImage.size.height - provisionalSizeY,
                                                        provisionalSizeX,
                                                        provisionalSizeY))
            //Remake image
            let reMyImage = UIGraphicsGetImageFromCurrentImageContext()
            //End synthesis
            UIGraphicsEndImageContext()
            
            //Add album
            UIImageWriteToSavedPhotosAlbum(reMyImage, self, nil, nil)
            
        })
        
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
