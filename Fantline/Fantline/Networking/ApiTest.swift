//
//  ApiTest.swift
//  Cashmix
//
//  Created by 赵翔宇 on 2021/12/18.
//

import Foundation


enum LogoutApi: CustomTargetType {
    case setOut
    
    
    var path: String {
        "/system/logout"
    }
    
    var method: HTTPRequestMethod {
        .get
    }
    
    var parameters: [String : Any]? {
        nil
    }
    
}
 
public func Networktest() {
    Networking.request(LogoutApi.setOut) { result in
        
    }
}
