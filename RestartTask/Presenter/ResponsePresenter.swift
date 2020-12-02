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

    init(view: AttractionView) {
        self.view = view
        responseAPIServerClient = AppServerClient()
        attractionsList = [Attraction]()
        hotspotList = [Hotspot]()
        
    }
    
    func viewDidLoad(countryId:String,page:String) {
        
        getOffers()
        
    }
    
    func getOffers() {
        responseAPIServerClient.fetchData { [unowned self] (success,attractionsList,hotspotList, error)  in
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                if attractionsList != nil{
                    if attractionsList!.count != 0{
                        self.attractionsList = attractionsList!
                        self.hotspotList = hotspotList!
                        self.view?.getResponseSuccess()
                    }}
                
            }
        }
    }
    func getOffersCount() -> Int {
        return attractionsList.count
    }
    
    func getHotspotsCount() -> Int {
        return hotspotList.count
    }
    
    func configure(cell: TableViewCellView, for index: Int) {
        let attractions = attractionsList
        let hotspots = hotspotList

//        let price = attraction.name
//        let totalPrice = attraction.attractionId
//        let quntity = attraction.quantity
        switch index {
        case 0:
            cell.displayAttractions(attraction: attractions,index: 0)
        case 1:
            cell.displayHotspot(hotspot: hotspots,index: 1)

        default:break
            
        }
        
//        cell.displayProductTotalPrice(productTotalPrice:totalPrice )
//        cell.displayProductQuntity(quntity: quntity)
        
    }
    
    
    
    
    
    
}
