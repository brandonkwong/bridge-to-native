//
//  RNViewController.swift
//  Tabby
//
//  Created by Brandon Kwong on 3/19/18.
//  Copyright © 2018 Brandon Kwong. All rights reserved.
//

import UIKit
import React

class RNViewController: UIViewController {

    var rootView: RCTRootView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mockData:NSDictionary = [
            "native": [
                ["name": "Leoric", "role": "warrior"],
                ["name": "Abathur", "role": "specialist"]
            ]
        ]

        rootView = RCTRootView(bridge: appDelegate.bridge, moduleName: "RNTab", initialProperties: mockData as [NSObject : AnyObject])

        self.view.addSubview(rootView)

        rootView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - self.tabBarController!.tabBar.bounds.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
