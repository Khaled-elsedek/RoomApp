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

class MainAds {
    static let instance = MainAds()
    
    func main(completion : @escaping (_ error:Error?,_ sucess:Bool,_ modelArray:[RoomsDataModel]?)->Void){
        let header:[String:Any]=["Authorization" : "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNTYzNjQ3OTE2fQ.oR4_VqhpLdSYmz1txAc7KyiYN1WWMEe_Cre0wkHvF2U"]
        Alamofire.request(ROOMS,method:.get,parameters:nil,encoding:JSONEncoding.default,headers:(header as! HTTPHeaders)).responseJSON{(response)in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                guard let data = json.array else { return }
                var modelArray = [RoomsDataModel]()
                for item in data {
                    guard let obj = item.dictionary ,
                        let id = obj["id"]?.int,
                        let title = obj["title"]?.string ,
                        let price = obj["price"]?.string ,
                        let place = obj["place"]?.string ,
                        let image = obj["image"]?.url,
                        let description = obj["description"]?.string else { return }
                    
                    modelArray.append(RoomsDataModel(id: id, title: title, price: price, place: place, image: image, description: description))}
                completion(nil, true, modelArray)
                print(modelArray.count)
            case .failure(let error):
                print(error)
            }
        }
    }
}
