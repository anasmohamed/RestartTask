//
//  TableViewCellView.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
protocol TableViewCellView {
    func displayAttractions(attraction: [Attraction],index:Int)
    func displayHotspot(hotspot: [Hotspot],index:Int)
    func displayEvents(event :[Event],index:Int)

}
