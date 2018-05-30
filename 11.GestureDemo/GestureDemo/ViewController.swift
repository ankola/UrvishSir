//
//  ViewController.swift
//  GestureDemo
//
//  Created by agilemac-24 on 12/18/17.
//  Copyright © 2017 agilemac-24. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet var imgViewPinch:UIImageView!
    @IBOutlet var imgViewRotate:UIImageView!
    @IBOutlet var imgViewPan:UIImageView!
    
    var firstXL:CGFloat = 0.0
    var firstY:CGFloat = 0.0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.TapGestureHandler(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinch(_:)))
        imgViewPinch.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotate(_:)))
        imgViewRotate.addGestureRecognizer(rotateGesture)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(_:)))
        imgViewPan.addGestureRecognizer(panGesture)

        let swipeGesture:UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(ViewController.TapGestureHandler(_:)))
        swipeGesture.direction = .up
        self.view.addGestureRecognizer(swipeGesture)
        
    }

    @objc func TapGestureHandler(_ recognizer:UITapGestureRecognizer)
    {
        print("Tap")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func handlePinch(_ recognizer: UIPinchGestureRecognizer)
    {
        print(recognizer.scale)
        recognizer.view?.transform = (recognizer.view?.transform.scaledBy(x: recognizer.scale, y: recognizer.scale))!
       // recognizer.scale = 1
    }
    
    @IBAction func handleRotate(_ recognizer: UIRotationGestureRecognizer)
    {
        print(recognizer.rotation)
        recognizer.view?.transform = (recognizer.view?.transform.rotated(by: recognizer.rotation))!
        recognizer.rotation = 0
    }

    @IBAction func handlePan(_ sender:UIPanGestureRecognizer)
    {
        var translatedPoint: CGPoint = sender.translation(in: view)
        // NSLog(@"%f %f",translatedPoint.x,translatedPoint.y);
        //var velocity: CGPoint = sender.velocity(in: view)
        //print("\(velocity.x) \(velocity.y)")
        if (sender as? UIPanGestureRecognizer)?.state == .began {
            firstXL = (sender.view?.center.x)!
            firstY = (sender.view?.center.y)!
        }
        translatedPoint = CGPoint(x: firstXL + translatedPoint.x, y: firstY + translatedPoint.y)
        sender.view?.center = translatedPoint

        
    }
}

