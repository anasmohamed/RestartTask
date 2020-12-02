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
    
    init(view: AttractionView) {
        self.view = view
        responseAPIServerClient = AppServerClient()
        attractionsList = [Attraction]()
        
    }
    
    func viewDidLoad(countryId:String,page:String) {
        
        getOffers()
        
    }
    
    func getOffers() {
        responseAPIServerClient.fetchData { [unowned self] (success,attractionsList, error)  in
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                if attractionsList != nil{
                    if attractionsList!.count != 0{
                        self.attractionsList += attractionsList!
                        self.view?.getResponseSuccess()
                    }}
                
            }
        }
    }
    func getOffersCount() -> Int {
        return attractionsList.count
    }
    
    
    
    func configure(cell: TableViewCellView, for index: Int) {
        let attractions = attractionsList

//        let price = attraction.name
//        let totalPrice = attraction.attractionId
//        let quntity = attraction.quantity

        
        cell.displayAttractions(attraction: attractions)
//        cell.displayProductTotalPrice(productTotalPrice:totalPrice )
//        cell.displayProductQuntity(quntity: quntity)
        
    }
    
    
    
    
    
    
}
