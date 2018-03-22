//
//  FirstViewController.swift
//  GestureRecognizerDemo
//
//  Created by Jon Boling on 3/22/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        squareView = UIView(frame: CGRect(x:150, y: 250, width: 100, height: 100))
        squareView.backgroundColor = .blue
        view.addSubview(squareView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(recognizer:)))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
        
         squareView.gestureRecognizers = [panGesture, tapGesture, rotateGesture, pinchGesture]
    }
    
    //Xcode wouldn't allow the following funcs w/o the @objc. Unsure why this differs from CF code.
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        let translationInView = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        recognizer.view?.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    @objc func handleRotation(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    @objc func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    

}

