//
//  ViewController+ResponseViewDelegate.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
extension ViewController:AttractionView{
    func getResponseSuccess() {
        tableView.reloadData()
    }
    
    func showError(error: String) {
        
    }
    
    
}
