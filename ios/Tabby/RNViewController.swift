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

        rootView = RCTRootView(bridge: appDelegate.bridge, moduleName: "RNTab", initialProperties: nil)

        self.view.addSubview(rootView)

        rootView.frame = self.view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
