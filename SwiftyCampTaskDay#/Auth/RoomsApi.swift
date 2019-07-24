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
    
    func main(completion : @escaping (_ error:Error?,_ sucess:Bool, _ errormessage:String,_ modelArray:[RoomsDataModel]?)->Void){
        if let api_token = Helper.getApiToken(){
        let header:[String:Any]=["Authorization" : "\(api_token)"]
        Alamofire.request(ROOMS,method:.get,parameters:nil,encoding:JSONEncoding.default,headers:(header as! HTTPHeaders)).responseJSON{(response)in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                if let errormessage = json["message"].string{
                if errormessage != "" {
                    completion(nil , true , errormessage,nil)
                    print(errormessage)
                    }}
                guard let data = json.array else { return }
                var modelArray = [RoomsDataModel]()
                
                for obj in data {
                    
                    var khaled = RoomsDataModel()
                    khaled.id = obj["id"].int
                    khaled.title = obj["title"].string
                    khaled.price = obj["price"].string
                    khaled.place = obj["place"].string
                    khaled.image = obj["image"].string
                    khaled.description = obj["description"].string
                    
                    modelArray.append(khaled)}
                
                completion(nil, true,"", modelArray)
                print(modelArray.count)
            case .failure(let error):
                print(error)
            }
        }
    }
}
}
