//
//  Attractions.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class Attraction{
    var attractionId : String?
    var name : String?
    var photo: String?
    var type : String?
    init?(withJSON data: JSON) {
        self.attractionId  = data["id"].stringValue
        self.name = data["name"].stringValue
        self.photo = data["photos"][0].stringValue
        self.type = data["arabic_name"].stringValue
    }
    
}

