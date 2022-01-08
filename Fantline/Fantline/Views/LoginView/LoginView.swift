//
//  LoginView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/19.
//

import SwiftUI

import AuthenticationServices

struct LoginView: View {
    @StateObject var userDC = UserDataCenter.shared
    
    @ObservedObject var uistate = UIState.shared
    
    @State private var text : String = ""
    @State private var focus : Bool = true
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.BackGround.ignoresSafeArea()
                
                VStack(spacing:24){
                    
                    TitleAndSubline(title: "欢迎使用拉片Laper", subline: "请输入手机号码以注册/登陆")
                

                    PF_TextField(text: $text
                        , isFirstResponder: $focus ){
                        $0.textAlignment = .center
                        $0.textColor = UIColor(Color.fc1)
                        $0.font = UIFont.boldSystemFont(ofSize: 20)
                        $0.placeholder = "手机号码"
                        $0.tintColor = UIColor(Color.fc1)
                        $0.keyboardType = .numberPad
                        $0.setValue(UIColor(Color.fc2 ), forKeyPath: "placeholderLabel.textColor")
                        
                    }
                    .frame( height: GoldenH)

                    
                    Spacer()
                    
                    MainButton(title: "继续",color: Color.MainColor) {
                        userDC.showVerificationCodeView
                        = true
                    }
                    
                    Text("或")
                        .mFont(style: .Body_13_R,color: .fc2)
                    
                    SignInWithAppleButton(
                        onRequest: { request in

                        },
                        onCompletion: { result in

                        }
                    )
                        .frame( height: GoldenH)
                
                    
                    Text("点击继续或使用Apple登陆，均代表您已阅读并同意拉片LaperApp的用户协议与隐私条款。")
                        .mFont(style: .Caption_10_R,color: .fc2)
              
                    
                }
                .onAppear(perform: {
                    userDC.clearSelf()
                })
                .padding(.all,32)
                .navigationBarTitleDisplayMode(.inline)
                .PF_Navilink(isPresented: $userDC.showVerificationCodeView) {
                    VerificationCodeView()
                        .environmentObject(userDC)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        CloseBtn(){
                    uistate.showLoginView = false}
                    }
            }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.accentColor)
    
     
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        
            LoginView()
        

            
    }
}

