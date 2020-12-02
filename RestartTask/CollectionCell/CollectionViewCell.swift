//
//  CollectionViewCell.swift
//  RestartTask
//
//  Created by Anas on 12/2/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var name : UILabel!
    @IBOutlet var type : UILabel!
    @IBOutlet var image : UIImageView!


    static let identifier = "CollectionViewCell"
       
       static func nib() ->UINib{
           return UINib(nibName: "CollectionViewCell", bundle: nil)
       }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with name:String, type:String,image:String)
    {
        self.name.text = name
        self.type.text = type
        self.image.image = UIImage(named: image)
    }
}
