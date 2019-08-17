//
//  RoomsApi.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/19/19.
//  Copyright © 2019 Khaled. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON

class FetchRooms : NSObject {
    class func getRoomsInBackend ( completion: @escaping (Error?,[Room]?) -> Void ) {
        guard (UserDefaults.standard.object(forKey: "auth_token") as? String) != nil else {
            completion(nil,nil)
            return
        }
        Alamofire.request(NetworkRoute.getRooms) .validate() .responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                guard let rooms = Parser.parseRooms(from: JSON(value).array!) else {
                    completion(nil,nil)
                    return
                }
                completion(nil,rooms)
            }
        }
    }
    
    class func getRoomsInDB( completion : @escaping (Error?,[Room]?) -> Void ){
        let offlineRooms = roomsOFFline()
        let dbRooms = offlineRooms.readAllRooms()
        let parsRooms = Parser.parseRooms(from: JSON(dbRooms).array!)
        completion(nil,parsRooms)
    }
}
