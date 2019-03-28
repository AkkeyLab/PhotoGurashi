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

enum CameraDirection {
    case front
    case back
}

class CameraViewController: UIViewController {

    private var screenHeight: CGFloat!
    private var screenWidth: CGFloat!
    private var charaSize: CGRect!
    private var charaPosition: CGPoint!

    // Character image view
    private var charaImageView: UIImageView!
    private var charaImage: UIImage!

    private var cameraSession: AVCaptureSession!
    private var cameraInfo: CameraDirection!
    private var imageOutput: AVCaptureStillImageOutput!

    private let cameraButton: UIButton = UIButton()
    private let exitButton: UIButton = UIButton()
    private let changeCameraButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setValue()
        setCamera()
        setParts()
    }

    func setValue() {
        screenHeight = self.view.bounds.height
        screenWidth = self.view.bounds.width

        charaSize = CGRect(x: 0, y: 0, width: (screenWidth / 2) + (screenWidth / 4), height: (screenHeight / 2) + (screenHeight / 4))
        charaPosition = CGPoint(x: (screenWidth / 2) + (screenWidth / 8), y: (screenHeight / 2) + (screenHeight / 8))

        charaImage = UIImage(named: "04") // Default
    }

    func setParts() {
        charaImageView = UIImageView(frame: charaSize)
        charaImageView.layer.position = charaPosition
        if let image = charaImage {
            charaImageView.image = image
        }
        view.addSubview(charaImageView)

        cameraButton.frame = CGRect(x: 0, y: 0, width: 120, height: 50)
        cameraButton.backgroundColor = .red
        cameraButton.layer.masksToBounds = true
        cameraButton.setTitle("撮影", for: UIControl.State())
        cameraButton.layer.cornerRadius = 20.0
        cameraButton.layer.position = CGPoint(x: screenWidth / 2, y: screenHeight - 50)
        cameraButton.addTarget(self, action: #selector(CameraViewController.onClickButton(_:)), for: .touchUpInside)
        cameraButton.tag = 0
        view.addSubview(cameraButton)

        exitButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        exitButton.backgroundColor = .cyan
        exitButton.layer.masksToBounds = true
        exitButton.setTitle("戻る", for: UIControl.State())
        exitButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        exitButton.setTitleColor(UIColor.darkGray, for: UIControl.State())
        exitButton.layer.cornerRadius = 10.0
        exitButton.layer.position = CGPoint(x: 50, y: screenHeight - 50)
        exitButton.addTarget(self, action: #selector(CameraViewController.onClickButton(_:)), for: .touchUpInside)
        exitButton.tag = 1
        view.addSubview(exitButton)

        changeCameraButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        changeCameraButton.backgroundColor = .gray
        changeCameraButton.layer.masksToBounds = true
        changeCameraButton.setTitle("変更", for: UIControl.State())
        changeCameraButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        changeCameraButton.setTitleColor(UIColor.white, for: UIControl.State())
        changeCameraButton.layer.cornerRadius = 25.0
        changeCameraButton.layer.position = CGPoint(x: self.view.bounds.width - 50, y: 50)
        changeCameraButton.addTarget(self, action: #selector(CameraViewController.onClickButton(_:)), for: .touchUpInside)
        changeCameraButton.tag = 2
        view.addSubview(changeCameraButton)
    }

    func setCharaImage(_ name: String) {
        if let image = UIImage(named: name) {
            charaImage = image
            charaImageView.image = charaImage
        }
    }

    @objc override func onClickButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            outputPhoto()
        case 1:
            dismiss(animated: true, completion: nil)
        case 2:
            changeCameraDirection()
        default:
            NSLog("Button tag error")
        }
    }

    func setCamera() {
        cameraInfo = .back
        cameraSession = AVCaptureSession()
        imageOutput = AVCaptureStillImageOutput()
        cameraSession.addOutput(imageOutput)

        if let device = setDevice(cameraInfo) {
            do {
                let videoInput: AVCaptureInput = try AVCaptureDeviceInput(device: device)
                cameraSession.addInput(videoInput)
            } catch {
                NSLog("AVCaptureInput get error")
            }
        }

        let videoLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: cameraSession)
        videoLayer.frame = self.view.bounds
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(videoLayer)

        cameraSession.startRunning()
    }

    func changeCameraDirection() {
        cameraSession.stopRunning()

        if cameraInfo == .back {
            cameraInfo = .front
        } else {
            cameraInfo = .back
        }

        if let device = setDevice(cameraInfo) {
            do {
                let videoInput: AVCaptureInput = try AVCaptureDeviceInput(device: device)
                cameraSession.addInput(videoInput)
            } catch {
                NSLog("AVCaptureInput get error")
            }
        }

        cameraSession.startRunning()
    }

    func setDevice(_ direction: CameraDirection) -> AVCaptureDevice? {
        let devices = AVCaptureDevice.devices()
        for device in devices {
            if cameraInfo == .back {
                if (device as AnyObject).position == .back {
                    return device as? AVCaptureDevice
                }
            } else {
                if (device as AnyObject).position == .front {
                    return device as? AVCaptureDevice
                }
            }
        }
        return nil
    }

    func outputPhoto() {
        guard let videoConnection = imageOutput.connection(with: AVMediaType.video) else { return }
        imageOutput.captureStillImageAsynchronously(from: videoConnection, completionHandler: { (imageDataBuffer, error) -> Void in
            guard let buffer = imageDataBuffer else { return }
            // Convert DataBuffer of the acquired Image to Jpeg.
            guard let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(buffer),
                let image: UIImage = UIImage(data: imageData) else { return }

            // Edit image
            UIGraphicsBeginImageContext(CGSize(width: image.size.width, height: image.size.height))
            image.draw(at: CGPoint(x: 0, y: 0))

            let charaSizeX = (image.size.width / 2) + (image.size.width / 4)
            let charaSizeY = (image.size.height / 2) + (image.size.height / 4)
            let drawposition = CGRect(x: image.size.width - charaSizeX, y: image.size.height - charaSizeY, width: charaSizeX, height: charaSizeY)
            if self.charaImage != nil {
                self.charaImage.draw(in: drawposition)
            }

            let editImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // END

            if editImage != nil {
                //Add album
                UIImageWriteToSavedPhotosAlbum(editImage!, self, nil, nil)
            }
        })
    }
}
