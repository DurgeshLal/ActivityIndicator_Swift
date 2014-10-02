//
//  ActivityIndicatorView.swift
//  ActivityIndicator
//
//  Created by Admin on 02/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

 enum ActivityIndicatorViewType {
    case DLActivityIndicatorTypeLargeTeal
    case DLActivityIndicatorTypeLargeWhite
    case DLActivityIndicatorTypeSmallTeal
    case DLActivityIndicatorTypeSmallWhite
    case DLActivityIndicatorTypeSmallRed
}

class ActivityIndicatorView: UIView {
    var indicatorImageView:UIImageView!
    var shouldContinueAnimating:Bool!
    func initWithType(type:ActivityIndicatorViewType) -> AnyObject{
        var _type = type;
        var aRect: CGRect!
        if (_type == ActivityIndicatorViewType.DLActivityIndicatorTypeLargeTeal){
            aRect = CGRectMake(0, 0, 95, 95);
            self.indicatorImageView = UIImageView(image: UIImage(named: "global_activity_indicator_large_teal.png"));
        }
        self.indicatorImageView.frame = aRect;
        self.addSubview(self.indicatorImageView)
        return self;
    }
    
    func startAnimation() -> Void{
        shouldContinueAnimating = true
        self.startAnimationCycle()
    }
    func stopAnimating() -> Void{
        shouldContinueAnimating = false
        self.layer.removeAllAnimations()
    }
    
    func startAnimationCycle() -> (Void){
        if (shouldContinueAnimating != nil){
            var scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale");
            scaleAnimation.duration = 1.0
            scaleAnimation.autoreverses = true
            scaleAnimation.fromValue = 1.0
            scaleAnimation.toValue = 0.75
            scaleAnimation.beginTime = CACurrentMediaTime()
            scaleAnimation.delegate = self
            
            var rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation");
            rotationAnimation.duration = 2.0
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = 2*3.14159265358979323846264338327950288
            rotationAnimation.beginTime = CACurrentMediaTime()
            rotationAnimation.fillMode = kCAFillModeForwards
            rotationAnimation.delegate = self
            self.indicatorImageView.layer.addAnimation(scaleAnimation, forKey: "scaleAnimation")
            self.indicatorImageView.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
            
            
        }
    }
    
    override  func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if flag{
            self.startAnimationCycle()
        }
    }
}