//
//  GrantedViewController.swift
//  Openhome
//
//  Created by Alejandro Silveyra on 11/7/15.
//  Copyright © 2015 Alejandro Silveyra. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class GrantedViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    var myRootRef = Firebase(url:"https://dazzling-inferno-7299.firebaseio.com")
    // Write data to Firebase
    override func viewDidLoad() {
    }
    
    override func viewDidAppear(animated: Bool) {
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1.0).CGColor
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 5
    }
    @IBAction func startTapped(sender: AnyObject) {
        myRootRef.setValue("Do you have data? You'll love Firebase.")

        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("VisitViewController") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
}