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
    init?(withJSON data: JSON) {
          self.attractionId  = data["id"].stringValue
          self.name = data["name"].stringValue
      
          
      }
    
}

