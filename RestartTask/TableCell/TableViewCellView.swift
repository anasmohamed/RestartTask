//
//  TableViewCellView.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
protocol TableViewCellView {
    func displayAttractions(attraction: [Attraction])
    func displayHotspot(hotspot: [Hotspot])
    func displayEvents(event :[Events])

}
