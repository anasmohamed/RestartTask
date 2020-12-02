//
//  Hotspot.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Hotspot{
    var id : String?
    var name : String?
    var profileImage : String?
    var type : String?
    init?(withJSON data: JSON) {
        self.id  = data["id"].stringValue
        self.name = data["name"].stringValue
        self.profileImage = data["profile_photo"][0].stringValue
        self.type = data["arabic_name"].stringValue
    }
}
