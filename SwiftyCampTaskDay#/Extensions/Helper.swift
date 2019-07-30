//
//  Helper.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/19/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import Foundation
import UIKit

class Helper: NSObject {
    class func restartApp(){
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        if getApiToken() == nil {
            //go to auth screen
            vc = sb.instantiateInitialViewController()!
        } else {
            // go to main screen
            vc = sb.instantiateViewController(withIdentifier: "HomeScreen")
        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    class func saveApiToken(token:String){
        //save api token to userDefaults
        let def = UserDefaults.standard
        def.setValue(token, forKey: "api_token")
        def.synchronize()
    }
    class func getApiToken()-> String?{
        let def = UserDefaults.standard
        return def.object(forKey: "api_token") as? String
    }
}

