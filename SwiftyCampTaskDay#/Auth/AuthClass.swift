//
//  AuthClass.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/19/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class AuthService {
    static let instance = AuthService()
    func registerUSer(email:String , password:String , name:String , completion : @escaping ( _ error : Error? , _ sucess : Bool,_ errormsg : String)->Void){
        let body:[String: Any] = [
            "email": email,
            "password": password ,
            "name": name]
        Alamofire.request(URLREGISTER, method: .post, parameters: body, encoding: JSONEncoding.default , headers: nil).responseString { (response) in
            switch response.result
            {
            case .failure(let error):
                completion(error , false , "")
                print(error)
            case .success(let value):
                let resData = response.data
                let json = JSON(resData)
                print(json)
                print(value)
                let errormessage = json["message"].string
                completion(nil , true , errormessage!)
                if let api_token = json["auth_token"].string{
                    print("khaledkhaled" + api_token)
                    Helper.saveApiToken(token: api_token)
                } else {
                    print("api_token is empty")
                }
            }
        }
    }
    
    func login( email:String, password:String , completion : @escaping ( _ error : Error? , _ sucess : Bool,_ errormsg : String)->Void){
        let body:[String: Any] = [
            "password": password ,
            "email": email]
        Alamofire.request(URLLOGIN, method: .post, parameters: body, encoding: JSONEncoding.default , headers: nil).responseString { (response) in
            switch response.result
            {
            case .failure(let error):
                completion(error , false , "")
                print(error)
            case .success(let value):
                let resData = response.data
                let json = JSON(resData)
                print(json)
                print(value)
                let errormessage = json["message"].string
                completion(nil , true , errormessage ?? "")
                
                if let api_token = json["auth_token"].string{
                    
                    print("khaledkhaled" + api_token)
                    Helper.saveApiToken(token: api_token)
                } else {
                    print("api_token is empty")
                }
            }
        }
    }
}

