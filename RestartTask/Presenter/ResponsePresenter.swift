//
//  ResponsePresenter.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class ResponsePresenter {
    private weak var view: AttractionView?
    private var offer: Attraction?
    private let responseAPIServerClient:AppServerClient
    
    
    private var attractionsList: [Attraction]
    private var hotspotList: [Hotspot]
    private var eventsList: [Event]
    
    init(view: AttractionView) {
        self.view = view
        responseAPIServerClient = AppServerClient()
        attractionsList = [Attraction]()
        hotspotList = [Hotspot]()
        eventsList = [Event]()
        
    }
    
    func viewDidLoad(countryId:String,page:String) {
        
        getOffers()
        
    }
    
    func getOffers() {
        responseAPIServerClient.fetchData { [unowned self] (success,attractionsList,hotspotList,eventsList, error)  in
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                
                    if attractionsList!.count != 0{
                        self.attractionsList = attractionsList!
                        self.hotspotList = hotspotList!
                        self.eventsList = eventsList!
                        self.view?.getResponseSuccess()
                    }
                
            }
        }
    }
    func getOffersCount() -> Int {
        return attractionsList.count
    }
    
    func getHotspotsCount() -> Int {
        return hotspotList.count
    }
    func getEventsCount() -> Int {
        return eventsList.count
    }
    
    func configure(cell: TableViewCellView, for index: Int) {
        let attractions = attractionsList
        let hotspots = hotspotList
        let events = eventsList
       
        
        switch index {
        case 0:
            cell.displayAttractions(attraction: attractions,index: index)
        case 1:
            cell.displayHotspot(hotspot: hotspots,index: index)
        case 2:
            cell.displayEvents(event: events,index: index)
        default:break
            
        }
        
    }
    
    
    
    
    
    
}
