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
    let changeCameraButton:   UIButton = UIButton()
    var provisionalImageView: UIImageView!
    var provisionalImage:     UIImage = UIImage(named: "image/yuki.png")!
    
    var cameraInfo:           Bool = true
    //Take a picture
    var takeInputImage:       CIImage!
    //****END****
    
    //Initializer
    func changeImage(_ image: UIImage){
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
        
        //Camera
        cameraSetting()
        
        //Add provisional Image
        provisionalImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (self.view.bounds.width  / 2) + (self.view.bounds.width  / 4),
                                                                   height: (self.view.bounds.height / 2) + (self.view.bounds.height / 4)))
        
        //memo: Move to field
        //let provisionalImage = UIImage(named: "image/yuki.png")
        provisionalImageView.image = provisionalImage
        provisionalImageView.layer.position = CGPoint(x: (self.view.bounds.width  / 2) + (self.view.bounds.width  / 8),
                                                      y: (self.view.bounds.height / 2) + (self.view.bounds.height / 8))
        //Add View
        self.view.addSubview(provisionalImageView)
        
        //ex) let cameraButton = UIButton(frame: CGRectMake(0,0,120,50))
        cameraButton.frame = CGRect(x: 0, y: 0, width: 120, height: 50)//size
        cameraButton.backgroundColor = UIColor.red;
        cameraButton.layer.masksToBounds = true
        cameraButton.setTitle("撮影", for: UIControlState())
        cameraButton.layer.cornerRadius = 20.0
        cameraButton.layer.position = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height - 50)
        cameraButton.addTarget(self, action: #selector(CommonViewController.onClickButton(_:)), for: .touchUpInside)
        cameraButton.tag = 0//Add button tag
        //Add View
        self.view.addSubview(cameraButton)
        
        //ex) let exitButton = UIButton(frame: CGRectMake(0,0,80,80))
        exitButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)//size
        exitButton.backgroundColor = UIColor.cyan
        exitButton.layer.masksToBounds = true
        exitButton.setTitle("戻る", for: UIControlState())
        exitButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        exitButton.setTitleColor(UIColor.darkGray, for: UIControlState())
        exitButton.layer.cornerRadius = 10.0//edge
        exitButton.layer.position = CGPoint(x: 50, y: self.view.bounds.height - 50)
        exitButton.addTarget(self, action: #selector(CommonViewController.onClickButton(_:)), for: .touchUpInside)
        exitButton.tag = 1
        self.view.addSubview(exitButton)
        
        //ex) let changeCameraButton = UIButton(frame: CGRectMake(0,0,80,80))
        changeCameraButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)//size
        changeCameraButton.backgroundColor = UIColor.gray
        changeCameraButton.layer.masksToBounds = true
        changeCameraButton.setTitle("変更", for: UIControlState())
        changeCameraButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        changeCameraButton.setTitleColor(UIColor.white, for: UIControlState())
        changeCameraButton.layer.cornerRadius = 25.0//edge
        changeCameraButton.layer.position = CGPoint(x: self.view.bounds.width - 50, y: 50)
        changeCameraButton.addTarget(self, action: #selector(CommonViewController.onClickButton(_:)), for: .touchUpInside)
        changeCameraButton.tag = 2
        self.view.addSubview(changeCameraButton)
    }
    
    //Button event
    func onClickButton(_ sender: UIButton){
        
        switch sender.tag{
        case 0:
            //Lets output image
            outputImage()
        case 1:
            //Lets exit
            self.dismiss(animated: true, completion: nil)
        case 2:
            cameraInfo = !cameraInfo
            viewDidLoad()
        default:
            print("ERROR", terminator: "")
        }
        
    }
    
    func cameraSetting(){
        
        mySession = AVCaptureSession()
        
        let devices = AVCaptureDevice.devices()//Add all devices
        for device in devices!{
            if(cameraInfo){//Select back camera
                if((device as AnyObject).position == AVCaptureDevicePosition.back){
                    myDevice = device as! AVCaptureDevice
                }
            }else{//Select front camera
                if((device as AnyObject).position == AVCaptureDevicePosition.front){
                    myDevice = device as! AVCaptureDevice
                }
            }
            
        }
        //let videoInput = (try! AVCaptureDeviceInput.deviceInputWithDevice(myDevice))
        let videoInput: AVCaptureInput!
        do{
            videoInput = try AVCaptureDeviceInput.init(device: myDevice)
        }catch{
            videoInput = nil
        }
        mySession.addInput(videoInput)
        
        myImageOutput = AVCaptureStillImageOutput()
        mySession.addOutput(myImageOutput)
        
        //let myVideoLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.layerWithSession(mySession) as AVCaptureVideoPreviewLayer
        let myVideoLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: mySession)
        myVideoLayer.frame = self.view.bounds
        myVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        //Add View
        self.view.layer.addSublayer(myVideoLayer)

        mySession.startRunning()
    }
    
    func outputImage(){
        
        //It is connected to the video output
        let myVideoConnection = myImageOutput.connection(withMediaType: AVMediaTypeVideo)
        
        //Get the image from the connection
        self.myImageOutput.captureStillImageAsynchronously(from: myVideoConnection, completionHandler: { (imageDataBuffer, error) -> Void in
            //Convert DataBuffer of the acquired Image to Jpeg.
            let myImageData : Data = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataBuffer)
            let myImage : UIImage = UIImage(data: myImageData)!
            
            //Image synthesis (memo: Move to field)
            //let provisionalImage = UIImage(named: "image/yuki.png")
            //Main size is take image (No conversion take-image-size)
            UIGraphicsBeginImageContext(CGSize(width: myImage.size.width, height: myImage.size.height))
            myImage.draw(at: CGPoint(x: 0, y: 0))
            //Synthesis image
            let provisionalSizeX = (myImage.size.width  / 2) + (myImage.size.width  / 4)
            let provisionalSizeY = (myImage.size.height / 2) + (myImage.size.height / 4)
            self.provisionalImage.draw(in: CGRect(x: myImage.size.width  - provisionalSizeX,
                                                        y: myImage.size.height - provisionalSizeY,
                                                        width: provisionalSizeX,
                                                        height: provisionalSizeY))
            //Remake image
            let reMyImage = UIGraphicsGetImageFromCurrentImageContext()
            //End synthesis
            UIGraphicsEndImageContext()
            
            //Add album
            UIImageWriteToSavedPhotosAlbum(reMyImage!, self, nil, nil)
            
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
