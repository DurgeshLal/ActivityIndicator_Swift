//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Admin on 02/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var activityIndicatorView:ActivityIndicatorView = ActivityIndicatorView().initWithType(ActivityIndicatorViewType.DLActivityIndicatorTypeLargeTeal) as! ActivityIndicatorView;
        activityIndicatorView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

