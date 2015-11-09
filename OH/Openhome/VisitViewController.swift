//
//  VisitViewController.swift
//  Openhome
//
//  Created by Alejandro Silveyra on 11/8/15.
//  Copyright © 2015 Alejandro Silveyra. All rights reserved.
//

import Foundation
import UIKit

class VisitViewController: UIViewController {
    var popViewController : PopUpViewControllerSwift!

    @IBAction func livingTapped(sender: AnyObject) {
        showPopUp("living")
    }
    
    @IBAction func showPopUp(sender: AnyObject) {
        //let open : Openhome = sender as! Openhome
        let bundle = NSBundle(forClass: PopUpViewControllerSwift.self)
        self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6", bundle: bundle)
        self.popViewController.title = "This is a popup view"
        //self.popViewController.showInView(self.view, withHouseImage: UIImage(named: "Icon"), withAddress: "Test address", withCityState: "AUstin tx", withPrice: "101,010", withBedBath: "3-2", withSqrFr: "2,000", animated: true)
        self.popViewController.showVisitView(self.view, animated: true)
//        self.popViewController.title = "This is a popup view"
//        let price = "$ "
//        let bdbath = ""
//        let sqft = "sq ft"
//        self.popViewController.showInView(self.view, withHouseImage: nil, withAddress: "4532 Westbrook Ln", withCityState: "Austin, Tx", withPrice: price, withBedBath: bdbath, withSqrFr: sqft, animated: true)
    }
}
