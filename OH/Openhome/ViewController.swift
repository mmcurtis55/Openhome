//
//  ViewController.swift
//  Openhome
//
//  Created by Alejandro Silveyra on 11/7/15.
//  Copyright © 2015 Alejandro Silveyra. All rights reserved.
//

import UIKit
import GoogleMaps
import NMPopUpViewSwift
import Firebase

class ViewController: UIViewController, GMSMapViewDelegate {
    var markers : [Openhome] = []

    @IBOutlet var mapView: GMSMapView!
    var popViewController : PopUpViewControllerSwift!
    var myRootRef = Firebase(url:"https://dazzling-inferno-7299.firebaseio.com")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateMarkers()
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(30.2705365, longitude: -97.7362387, zoom: 12.0)
        mapView.camera = camera
        mapView.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            print("\(snapshot.key) -> \(snapshot.value)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateMarkers(){

        for (var i = 0; i < 50; i++) {
            let open = Openhome.init()
            open.map = mapView
            markers.append(open)
        }

    }
    
    //MARK: GMSMapView Delegate
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        for openhome in markers {
            if (openhome.position.latitude == marker.position.latitude && openhome.position.longitude == marker.position.longitude) {
                //found openhome clicked
                showPopUp(openhome)

                print(openhome)
            }
        }
        return false
    }
    
    @IBAction func showPopUp(sender: AnyObject) {
        let open : Openhome = sender as! Openhome
        let bundle = NSBundle(forClass: PopUpViewControllerSwift.self)
        if (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        {
            self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPad", bundle: bundle)
            self.popViewController.title = "This is a popup view"
            self.popViewController.showInView(self.view, withHouseImage: UIImage(named: "Icon"), withAddress: "Test address", withCityState: "AUstin tx", withPrice: "101,010", withBedBath: "3-2", withSqrFr: "2,000", animated: true)

        } else
        {
            if UIScreen.mainScreen().bounds.size.width > 320 {
                if UIScreen.mainScreen().scale == 3 {
                    self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6Plus", bundle: bundle)
                    self.popViewController.title = "This is a popup view"
                    self.popViewController.showInView(self.view, withHouseImage: UIImage(named: "Icon"), withAddress: "Test address", withCityState: "AUstin tx", withPrice: "101,010", withBedBath: "3-2", withSqrFr: "2,000", animated: true)
                    
                } else {
                    self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6", bundle: bundle)
                    self.popViewController.title = "This is a popup view"
                    self.popViewController.showInView(self.view, withHouseImage: UIImage(named: "Icon"), withAddress: "Test address", withCityState: "AUstin tx", withPrice: "101,010", withBedBath: "3-2", withSqrFr: "2,000", animated: true)
                }
            } else {
                self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: bundle)
                self.popViewController.title = "This is a popup view"
                let price = "$ \(open.price!)"
                let bdbath = "\(open.bedrooms!) | \(open.bathrooms!)"
                let sqft = "\(open.sqfeet!)sq ft"
                self.popViewController.showInView(self.view, withHouseImage: UIImage(named: open.photo!), withAddress: "4532 Westbrook Ln", withCityState: "Austin, Tx", withPrice: price, withBedBath: bdbath, withSqrFr: sqft, animated: true)
                
            }
        }
    }
    
    
    func setRoundedBorder(radius : CGFloat, withBorderWidth borderWidth: CGFloat, withColor color : UIColor, forButton button : UIButton)
    {
        let l : CALayer = button.layer
        l.masksToBounds = false
        l.cornerRadius = radius
        l.borderWidth = borderWidth
        l.borderColor = color.CGColor
    }

}

