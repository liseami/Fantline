//
//  VerificationCodeView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/25.
//

import SwiftUI

struct VerificationCodeView: View {
    
    @EnvironmentObject var userDC : UserDataCenter
    @State private var PF_TextFieldFocus : Bool = true
    
    var body: some View {
        VStack(spacing:12){
            Text("欢迎使用拉片Laper")
                .mFont(style: .LargeTitle_22_B,color: .fc1)
            Text("请输入手机号码以注册/登陆")
                .mFont(style: .Body_15_R,color: .fc2)
            
           
            textFiled
            
            
            Spacer()
            
            Text("重新发送验证码")
                .mFont(style: .Body_15_R,color: .blue)
            Text("请检查你的手机号是否正确")
                .mFont(style: .Body_12_R,color: .fc2)
            
        }
        .padding(.vertical,32)
        .navigationBarTitleDisplayMode(.inline)
        .PF_Navilink(isPresented: $userDC.showUserInfoFormView) {
            UserInfoFormView()
        }
    }
    
    
    var textFiled : some View {
        VStack{
            Divider()
                .opacity(0.6)
            PF_TextField(text: $userDC.verificationCodeInput, isFirstResponder: $PF_TextFieldFocus ){
                $0.textAlignment = .center
                $0.textColor = UIColor(Color.fc1.opacity(0.5))
                $0.font = UIFont.boldSystemFont(ofSize: 24)
                $0.keyboardType = .numberPad
            }
            .frame( height: GoldenH)
            .opacity(0)
            .overlay(characterInput)
            Divider()
                .opacity(0.6)
        }
        .padding(.top,44)
    }
    
    var characterInput : some View {
        HStack(spacing:12){
            ForEach(0..<6){ index in
                Spacer()
                    .frame(width: 24, height: 24)
                    .overlay(
                        Group{
                            if userDC.verificationCodeInput.count - 1 < index{
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .frame(width: 24, height: 2)
                            }
                            else{
                                Text(getStr(index: index))
                                    .mFont(style: .LargeTitle_22_B,color: .fc1)
                            }
                        }
                        
                    )
                Spacer()
                    .frame(width: 32)
                    .ifshow(index == 2)
            }
        }
    }
    //按index获取输入的数字
    func getStr(index : Int) -> String{
        let str = userDC.verificationCodeInput
        let strmap = str.map { Character in
            Character
        }
        let result = String(strmap[index])
        return result
        
    }
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView()
            .environmentObject(UserDataCenter.shared)
    }
}
