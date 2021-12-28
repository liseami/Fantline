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
        var _ = [
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
    
    static var scheme: String { "https" }
    
    static var host: String {
        switch env {
        case .local: return "imdb-api.com" //
        case .test: return "" //
        }
    }
    
    static var port: Int? {
        return nil
    }
    
   
    
    static var firstPath: String? {
        switch env {
        case .local: return ""
        case .test: return "manpower/rest-api"
        }
    }
}

