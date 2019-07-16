//
//  CellTable.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/12/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit
import IBAnimatable

class CellTable: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var adressLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var bedsCountLbl: AnimatableLabel!
    @IBOutlet weak var firstImage: AnimatableImageView!
    @IBOutlet weak var secondImage: AnimatableImageView!
    @IBOutlet weak var thirdImage: AnimatableImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
