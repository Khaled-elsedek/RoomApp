//
//  AddRoomAPI.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/20/19.
//  Copyright © 2019 Khaled. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

class AddRooms : NSObject {
    class func addRoom (title : String , price:String , place:String , description : String, completion: @escaping (Error?,_ success : Bool ,_ errormsg : String ) -> Void ) {
        let paramters = ["title" :title,"price" :price , "place": place , "description": description]
        Alamofire.request(NetworkRoute.addRoom(paramters)) .validate() .responseJSON { response in
            switch response.result {
            case .failure(let error):
                let resData = response.data
                let json = JSON(resData as Any)
                if let errormessage = json["message"].string{
                    completion(error , false , errormessage)
                }
                
            case .success(let value):
                let resData = response.data
                let json = JSON(resData as Any)
                if let errormessage = json["message"].string{
                    completion(nil , true , errormessage)
                } else {
                    completion(nil , true , "")
                }
                
            }
        }
    }
}
