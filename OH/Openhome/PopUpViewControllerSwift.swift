//
//  PopUpViewControllerSwift.swift
//  NMPopUpView
//
//  Created by Nikos Maounis on 13/9/14.
//  Copyright (c) 2014 Nikos Maounis. All rights reserved.
//

import UIKit
import QuartzCore


public class PopUpViewControllerSwift : UIViewController {
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var visitView : UIView!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var CityState: UILabel!
    @IBOutlet weak var HouseImage: UIImageView!
    @IBOutlet weak var OpenHome: UIButton!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var BedBath: UILabel!
    @IBOutlet weak var SqrFt: UILabel!
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        
        self.popUpView.layer.shadowOpacity = 0.2
    
        self.popUpView.layer.shadowOffset = CGSizeMake(0.0, 0.0)
    }
    
    override public func viewDidAppear(animated: Bool) {
        popUpView.clipsToBounds = true
        view.clipsToBounds = true
        if ((OpenHome) != nil) {
            OpenHome.clipsToBounds = true
            OpenHome.layer.cornerRadius = 10
        }
        self.popUpView.layer.cornerRadius = 10
        self.view.layer.cornerRadius = 10

    }
    
    func showInView(aView: UIView!, withHouseImage image : UIImage!, withAddress address: String!, withCityState citystate: String!, withPrice price: String!, withBedBath bedbath: String!, withSqrFr sqrft: String!, animated: Bool)
    {
        aView.addSubview(self.view)
        HouseImage!.image = image
        Address!.text = address
        CityState!.text = citystate
        Price!.text = price
        BedBath!.text = bedbath
        SqrFt!.text = sqrft
        if animated
        {
             //self.removeAnimate()
            self.showAnimate()
        }
    }
    
    func showVisitView(aView: UIView!, animated : Bool) {
        aView.addSubview(self.view)
        if (animated) {
            self.showAnimate()
        }
    }
    
    
    func showAnimate()
    {
        

        self.view.frame.origin.y = 550
        self.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.view.frame.origin.y = UIScreen.mainScreen().bounds.height - self.view.bounds.height + 2
            self.view.alpha = 1.0
            
        });
    }
    
    func removeAnimate()
    {
        UIView.animateWithDuration(0.25, animations: {
            self.view.frame.origin.y = 550
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
        });
    }
    
    @IBAction public func closePopup(sender: AnyObject) {
        self.removeAnimate()
    }
    @IBAction func openhomeTapped(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("GrantedViewController") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
