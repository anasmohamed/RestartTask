//
//  AppServerClient.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class AppServerClient {
    
    
    
    
    func fetchData(completion: @escaping (Bool, [Attraction]?,[Hotspot]?,[Event]?, AFError?) -> ()) {
        AF.request("http://bellman-bd.restart-technology.com/api/home")
            .responseJSON { response in
                
                
                
                if let response = response.data {
                    print("Response Data: \(response)")
                } else {
                    print("Response Data: nil")
                }
                if let request = response.request {
                    print("Request Request: \(request)")
                    print("Request Description: \(request.description)")
                    print("Request Debug Description: \(request.debugDescription)")
                    
                    print("Response Request HTTP method: \(request.httpMethod!)")
                    //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
                } else {
                    print("Response Request: nil")
                }
                
                if let responseStatusCode = response.response {
                    print("Response Status Code: \(responseStatusCode.statusCode)")
                } else {
                    print("Response Status Code: nil")
                }
                
                if let error = response.error {
                    print("Response Error Code: \(error.localizedDescription)")
                } else {
                    print("Response Error Code: nil")
                }
                //   print(response.value!)
                let result = response.result
                switch result {
                case .success :
                    let json = JSON(response.value!)
                    print(json)
                    var attractionsList = [Attraction]()
                    var hotspotList = [Hotspot]()
                    var eventsList = [Event]()

                    let attractions = json["data"]["attractions"].arrayValue
                    let hotspots = json["data"]["hot_spots"].arrayValue
                    let events = json["data"]["events"].arrayValue

                    
                    for attraction in attractions
                    {
                        let data = Attraction(withJSON: attraction)
                        attractionsList.append(data!)
                    }
                    for hotspot in hotspots
                    {
                        let data = Hotspot(withJSON: hotspot)
                        hotspotList.append(data!)
                    }
                    for event in events
                    {
                        let data = Event(withJSON: event)
                        eventsList.append(data!)
                    }
                    completion(true,attractionsList,hotspotList,eventsList,nil)
                    
                    
                case .failure(let error):
                    
                    completion(false,nil,nil,nil,error)
                }
        }
    }
}

