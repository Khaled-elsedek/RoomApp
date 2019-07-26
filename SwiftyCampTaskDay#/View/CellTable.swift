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
    var item:RoomsDataModel!{
        didSet{
            self.nameLbl.text  = item.place
            self.priceLbl.text = item.price
            adressLbl.text     = item.description
        }
    }
    
    
    

}
