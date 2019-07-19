//
//  URLS.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/19/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import Foundation

typealias completionHandler = (_ Success : Bool, _ err: String)->()


let BASEURL = "https://roomy-application.herokuapp.com/"


let URLREGISTER = BASEURL + "signup"
let URLLOGIN = BASEURL + "auth/login"
let ROOMS = BASEURL + "rooms"
