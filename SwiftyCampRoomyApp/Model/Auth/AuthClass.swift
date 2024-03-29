import Foundation
import SwiftyJSON
import Alamofire
class NetworkCall:NSObject {
    class func login (email:String,password:String, completion: @escaping (Error?,Bool,_ errormessage  :String) -> Void ){
        let paramters = ["email":email,"password":password]
        Alamofire.request(NetworkRoute.login(paramters)) .validate() .responseJSON { respone in
            switch respone.response?.statusCode {
            case 401:
                let json = JSON(respone.data as Any)
                let errormessage = json["message"].string
                completion(nil,true,errormessage ?? "")
            case 200:
                let json = JSON(respone.result.value as Any)
                Parser.parseLogin(from: json)
                completion(nil, true ,"")
                if let api_token = json["auth_token"].string{
                    Helper.saveApiToken(token: api_token)
                }
            default:
                break
            }
        }
    }
    class func signUp(name:String,email:String,password:String, completion: @escaping (Error?,Bool ,_ msgerror  :String) ->Void){
        let paramters = ["name":name,"email":email,"password":password]
        Alamofire.request(NetworkRoute.register(paramters)) .validate() .responseJSON{ response in
            
            switch response.result{
            case .failure(let error):
                completion(error,false,"")
            case .success(let value):
                let json = JSON(response.result.value as Any)
                let errormessage = json["message"].string
                completion(nil, true ,errormessage ?? "")
                if let api_token = json["auth_token"].string{
                    Helper.saveApiToken(token: api_token)
                }
            }
        }
    }
}
