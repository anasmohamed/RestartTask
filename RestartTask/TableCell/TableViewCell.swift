//
//  TableViewCell.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,TableViewCellView{
    
    
    @IBOutlet var collectionView : UICollectionView!
    
    static let identifier = "TableViewCell"
    var attractions : [Attraction]?
    static func nib() ->UINib{
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attractions!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        if attractions?.count != 0{
            cell.configure(with:attractions![indexPath.item].name!, type: "anas", image: "")}
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: 260)
    }
    
    func displayAttractions(attraction: [Attraction]) {
        self.attractions = attraction
        collectionView.reloadData()
    }
    
    func displayHotspot(hotspot: [Hotspot]) {
        
    }
    
    func displayEvents(event: [Events]) {
        
    }
    
}
