//
//  UserDataCenter.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/25.
//


import SwiftUI

class UserDataCenter : ObservableObject {
    
    static let shared = UserDataCenter()
    
    @Published var phoneNumberInput : String = ""
    @Published var verificationCodeInput : String = ""{
        didSet{
            if verificationCodeInput.count >= 6{
                showUserInfoFormView = true
            }
        }
    }
    @Published var isloading : Bool = false
    
    
    //验证码页面
    @Published var showVerificationCodeView : Bool = false
    //资料填写
    @Published var showUserInfoFormView : Bool = false
    //
    @Published var showFirstCompleteLoginView : Bool = false
    
    
    func clearSelf() {
        self.phoneNumberInput = ""
        self.verificationCodeInput = ""
    }
}

//
//
////api
//enum UserDataCenterApi : ApiType{
//
//    case register(p:RegisterData)
//
//    var path : String {
//        return "api/register"
//    }
//
//    var method: HTTPRequestMethod{
//        return .post
//    }
//
//    var parameters: [String : Any]?{
//        switch self {
//        case .register(let p):
//            return p.kj.JSONObject()
//        }
//    }
//
//    var parameterEncoding: ParameterEncoding{
//        return JSONEncoding.default
//    }
//
//}
//
////Module
//struct RegisterData: Convertible {
//  var name: String?
//  var username: String?
//  var password: String?
//  var confirmPassword: String?
//}
