//
//  isConnected.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/30/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import Foundation
import Alamofire
class Connection {
    class func  isConnected () -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
