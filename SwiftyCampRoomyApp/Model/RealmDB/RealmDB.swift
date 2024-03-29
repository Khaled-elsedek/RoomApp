//
//  RealmDB.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/30/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class roomsOFFline : Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var image:String = ""
    @objc dynamic var adress:String = ""
    @objc dynamic var stateAdress:String = ""
    @objc dynamic var price:String = ""
    @objc dynamic var info:String = ""
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var descriptionPic: UIImage = UIImage(named: "pic")!
    @objc dynamic var descriptionL: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func addDB (room : Room){
        let realm = try! Realm()
        try! realm.write {
            let realmRoom = roomsOFFline()
            realmRoom.id = room.id
            realmRoom.adress = room.adress
            realmRoom.stateAdress = room.stateAdress
            realmRoom.image = room.image
            realmRoom.price = room.price
            realmRoom.info = room.info
            realmRoom.descriptionText = room.descriptionText
            realmRoom.descriptionL = room.descriptionL
            realm.add(realmRoom,update: .modified)
        }
    }
    
    func readAllRooms() -> Results<roomsOFFline> {
        let realm = try! Realm()
        let rooms = realm.objects(roomsOFFline.self)
        return rooms
    }
    
}
