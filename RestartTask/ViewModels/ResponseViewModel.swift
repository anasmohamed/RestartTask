//
//  ResponseViewMode;.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
public enum ResponseTableState {
    case loading
    case error
    case empty
    case populated
}
class ResponseListViewModel {
    let apiService: ResponseAPIServiceProtocol
    private var products: [Response] = [Response]()
    private var cellViewModels: [ResponseListCellViewModel] = [ResponseListCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    // callback for interfaces
    var state: ResponseTableState = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    var isAllowSegue: Bool = false
    
    var selctedProduct: Response?
    
    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    init(apiService: ResponseAPIServiceProtocol = AppServerClient()) {
        self.apiService = apiService
    }
    func initFetch() {
        state = .loading
       
            apiService.fetchData{ [weak self] (success, products, error) in
                guard let self = self else {
                    return
                }
                
                guard error == nil else {
                    self.state = .error
                    // self.alertMessage = error?.errorDescription
                    return
                }
                
                self.state = .populated
            }
            
            
            
        }
        
    
    
    func getCellViewModel( at indexPath: IndexPath ) -> ResponseListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel( response: Response ) -> ResponseListCellViewModel {
        return ResponseListCellViewModel(name: "", imageUrl: "", type: "")
    }
    
    private func processFetchedProductAndSaveProductLocal( products: [Response] ) {
        self.products = products
        var vms = [ResponseListCellViewModel]()
        for product in products {
            vms.append(createCellViewModel(response: product))
        }
        self.cellViewModels = vms
    }

    
}
