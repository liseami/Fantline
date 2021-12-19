//
//  LoginView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/19.
//

import SwiftUI
import FantasyUI

struct LoginView: View {
    @ObservedObject var userDC = UserDataCenter.shared
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("用户名", text: $userDC.usernameInput)
                }header: {
                    Text("请输入用户名")
                        .mFont(style: .Body_12_R,color: .fc3)
                        .PF_Leading()
                }
                
                Section {
                    TextField("密码", text: $userDC.userpassWordInput)
                }header: {
                    Text("请输入密码")
                        .mFont(style: .Body_12_R,color: .fc3)
                        .PF_Leading()
                }
                
                Button {
                    userDC.register()
                } label: {
                    Text("注册")
                        .mFont(style: .Title_17_B,color: .accentColor)
                        .frame(maxWidth:.infinity,alignment: .center)
                }

               
            }
            .background(Color.BackGround.ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ICON(sysname:"xmark")
                }
            }
        }
     
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
            LoginView()
        

            
    }
}


class UserDataCenter : ObservableObject {
    static let shared = UserDataCenter()
    
    @Published var usernameInput : String = ""
    @Published var userpassWordInput : String = ""
    @Published var isloading : Bool = false
    
    func register(){
        let target = UserDataCenterApi.register
        Networking.request(target) { result in
            
        }
    }
}

//api
enum UserDataCenterApi : ApiType{
    
    case register
    
    var path : String {
        return "api"
    }

    var method: HTTPRequestMethod{
        return .get
    }
    
    var parameters: [String : Any]?{
        return nil
    }
    
    var parameterEncoding: ParameterEncoding{
        return URLEncoding.default
    }
    
}

//Module


