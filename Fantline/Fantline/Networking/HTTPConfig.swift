//
//  ApiCenter.swift
//  Cashmix
//
//  Created by 赵翔宇 on 2021/12/18.
//

import FantasyUI


protocol ApiType: CustomTargetType {
    
}

extension ApiType {
    
    var scheme: String { ProjectConfig.scheme }
    var host: String { ProjectConfig.host }
    var port: Int? { ProjectConfig.port }
    var firstPath: String? { ProjectConfig.firstPath }
    

    var headers: [String: String]? {
        var headers = [
            "apiVersion": "1.0",
            "os": "1",// 1.ios, 2.android
        ]
        return nil
    }
    
  
    
}

struct ProjectConfig {
    static let env: Environment = .local
    
    enum Environment {
    case local, test
    }
    
    static var scheme: String { "http" }
    
    static var host: String {
        switch env {
        case .local: return "192.168.1.2" //
        case .test: return "183.66.65.207" //http://183.66.65.207:8081/api/authorization/
        }
    }
    
    static var port: Int? {
        switch env {
        case .local:
            return 8080
        case .test:
            return 9999
        }
    }
    
   
    
    static var firstPath: String? {
        switch env {
        case .local: return ""
        case .test: return "manpower/rest-api"
        }
    }
}

