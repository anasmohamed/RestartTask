//
//  ViewController.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var filterBarView: UIView!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var topBarView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: ResponsePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        tableView.estimatedRowHeight = 120
//        tableView.tableFooterView = UIView()
//
        presenter = ResponsePresenter(view : self)
               presenter.getOffers()
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        filterBtn.roundedButton()
        filterBarView.layer.cornerRadius = 10
       

    }
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        presenter.configure(cell: cell, for: indexPath.section)
            return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270.0
    }
}



extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.bottomRight , .topRight],
            cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
