//
//  UserInfoFormView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/25.
//

import SwiftUI

struct UserInfoFormView: View {
    
    @ObservedObject var userDC = UserDataCenter.shared
    @State private var text : String = ""
    @State private var focus : Bool = true
    
    var body: some View {
        VStack(spacing:12){
            Text("输入你的用户名")
                .mFont(style: .LargeTitle_22_B,color: .fc1)
            Text("用于显示拉片的署名")
                .mFont(style: .Body_15_R,color: .fc2)
            
            
            VStack{
                Divider().opacity(0.6)
                PF_TextField(text: $text
                    , isFirstResponder: $focus ){
                    $0.textAlignment = .left
                    $0.textColor = UIColor(Color.fc1)
                    $0.font = UIFont.boldSystemFont(ofSize: 24)
                    $0.placeholder = "用户名"
                    $0.keyboardType = .twitter
                }
                    .padding(.horizontal,44)
                .frame( height: GoldenH)
                Divider().opacity(0.6)
            }
            .padding(.top,44)
            
            
            
            Spacer()
            
            MainButton(title: "继续") {
                userDC.showFirstCompleteLoginView = true
            }
            .padding(.horizontal,32)
        }
        .padding(.vertical,32)
        .PF_Navilink(isPresented: $userDC.showFirstCompleteLoginView) {
            FirstCompleteLoginView()
        }
       
        
    }
}

struct UserInfoFormView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoFormView()
    }
}
