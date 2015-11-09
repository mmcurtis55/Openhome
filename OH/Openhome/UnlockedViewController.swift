//
//  UnlockedViewController.swift
//  Openhome
//
//  Created by Alejandro Silveyra on 11/8/15.
//  Copyright © 2015 Alejandro Silveyra. All rights reserved.
//

import Foundation
import UIKit

class UnlockedViewController : UIViewController {

    @IBAction func buttonTapped(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LockedViewController") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
}

