//
//  Alert.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 8/3/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    class Alert{
        class func showAlert(msgerror:String = "complete all fields"){
            let alert = UIAlertController(title: "error", message: msgerror, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            //present(alert, animated: true, completion: nil)
        }
    }
}

