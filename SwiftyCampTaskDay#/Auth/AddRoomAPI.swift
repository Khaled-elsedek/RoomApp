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

//class AddRoom {
//    static let instance = AddRoom()
//    
//    func main(title : String , price:String , place:String , description : String ,    completion : @escaping (_ error:Error?,_ sucess:Bool,_ errormsg : String)->Void){
//        if let api_token = Helper.getApiToken(){
//        let header:[String:Any]=["Authorization" : "\(api_token)"]
//        let body:[String: Any] = [
//            "title": title,
//            "price": price ,
//            "place": place,
//            "description":description]
//            Alamofire.request(roomsURL, method: .post, parameters: body, encoding: JSONEncoding.default , headers: (header as! HTTPHeaders)).responseString { (response) in
//                switch response.result
//                {
//                case .failure(let error):
//                    completion(error , false , "")
//                    print(error)
//                case .success(let value):
//                    let resData = response.data
//                    let json = JSON(resData)
//                    print(json)
//                    print(value)
//                    if let errormessage = json["message"].string{
//                        completion(nil , true , errormessage)
//
//                    }else {
//                        completion(nil , true , "")
//                    }
//                }
//            }
//    }
//}
//
//}
