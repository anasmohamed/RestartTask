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
    @IBOutlet var titleIcon : UIImageView!
    @IBOutlet var titleLbl : UILabel!
    
    
    static let identifier = "TableViewCell"
    var attractions : [Attraction]?
    var hotspots : [Hotspot]?
    var events : [Event]?
    var index : Int?
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
        switch index {
        case 0:
            
            return attractions?.count ?? 0
        case 1:
            return hotspots?.count ?? 0
        case 2:
            return events?.count ?? 0
            
        default:
            break
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        switch  index{
            
        case 0:
            if attractions?.count != 0{
                cell.configure(with:attractions![indexPath.item].name!, type: attractions![indexPath.item].type!, image: attractions![indexPath.item].photo!)}
        case 1:
            if hotspots?.count != 0{
                cell.configure(with:hotspots![indexPath.item].name!, type: hotspots![indexPath.item].type!, image: hotspots![indexPath.item].profileImage!)}
        case 2:
            if events?.count != 0{
                cell.configure(with:events![indexPath.item].name!, type: events![indexPath.item].type!, image: events![indexPath.item].profileImage!)}
            
        default: break
            
        }
        
        return cell
    }
    
    
//    func titleForSection (){
//        
//        switch index {
//        case 0:
//            
//        case 1:
//            titleLbl.text = "HOTSOPTS"
//            
//        case 2:
//            titleLbl.text = "HOTSOPTS"
//            
//        default:break
//        }
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: 260)
    }
    
    func displayAttractions(attraction: [Attraction],index :Int) {
        self.attractions = attraction
        self.index = index
        titleLbl.text = "ATTRACTIONS"
        titleIcon.image = UIImage(named:"attarctions_icon")
        collectionView.reloadData()
    }
    
    func displayHotspot(hotspot: [Hotspot],index :Int) {
        self.hotspots = hotspot
        self.index = index
        titleLbl.text = "HOTSOPTS"
        titleIcon.image = UIImage(named:"hotspot_icon")

        collectionView.reloadData()
        
    }
    
    func displayEvents(event: [Event],index : Int) {
        self.events = event
        self.index = index
        titleLbl.text = "Events"
        titleIcon.image = UIImage(named:"events_icon")


        collectionView.reloadData()
    }
    
}
