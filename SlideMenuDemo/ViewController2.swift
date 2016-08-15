//
//  ViewController2.swift
//  SlideMenuDemo
//
//  Created by NKJay on 8/15/16.
//  Copyright © 2016 NKJay. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    private lazy var button:UIButton = {
        let button = UIButton()
        button.setTitle("back", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: #selector(ViewController.buttonDidClick), forControlEvents: .TouchUpInside)
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let screenHeight = UIScreen.mainScreen().bounds.height
        button.sizeToFit()
        button.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        return button
    }()
    
    func buttonDidClick() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
    }

}
