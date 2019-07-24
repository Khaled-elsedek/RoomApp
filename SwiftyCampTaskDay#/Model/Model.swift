//
//  Model.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/19/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import Foundation

struct RoomsDataModel {
    var id:Int?
    var title : String?
    var price: String?
    var place: String?
    var image : String?
    var description : String?
    init(id:Int ,title:String,price:String,place:String,image:String, description:String) {
        self.id = id
        self.title = title
        self.price = price
        self.place = place
        self.image = image
        self.description = description
    }
    init(){}
}


