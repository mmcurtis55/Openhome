//
//  Openhome.swift
//  Openhome
//
//  Created by Alejandro Silveyra on 11/7/15.
//  Copyright © 2015 Alejandro Silveyra. All rights reserved.
//

import UIKit
import GoogleMaps

class Openhome : GMSMarker {
    var address : String?
    var price : NSNumber?
    var bedrooms : NSNumber?
    var bathrooms : NSNumber?
    var photo : String?
    var sqfeet : NSNumber?
    
    required override init() {
        super.init()
        self.icon = UIImage(named: "Icon-Small-40.png")
        let lowerBound = -0.05
        let upperBound = 0.05
        let rndValue = lowerBound + drand48() % (upperBound - lowerBound);
        let rndValueTwo = lowerBound + drand48() % (upperBound - lowerBound)
        self.position = CLLocationCoordinate2DMake(Constants.lat + rndValue, Constants.long + rndValueTwo)

        price = Constants.minPrice + random() % (Constants.maxPrice - Constants.minPrice)
        bedrooms = Constants.minBedrooms + random() % (Constants.maxBedrooms - Constants.minBedrooms)
        bathrooms = Constants.minBedrooms + random() % (Constants.maxBedrooms - Constants.minBedrooms)
        photo = "house2"
        sqfeet = Constants.minsqft + random() % (Constants.maxsqft - Constants.minsqft)
    }

}
